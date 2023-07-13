
--Get category id:  input: category name
SELECT c.id, c.name, c.description FROM category c
WHERE c.name = input;

--GET PRODUCT BY CATEGORY ID
SELECT p.id, p.name,p.image_url, p.price, p.sale, c.name, c.description FROM category c JOIN product p on c.id = p.category_id OFFSET 0 LIMIT 10;

--GET MAIN PAGE SUGGESTED PRODUCTS (xxx ITEMS PER PAGE)
SELECT p.id, p.name, p.image_url, p.price, p.sale FROM product p OFFSET 0 LIMIT 10;

--GET product by brand
SELECT p.id, p.name, p.image_url, p.price, p.sale, b.name, b.description FROM product p JOIN brand b ON b.id = p.brand_id WHERE b.id = input_id OFFSET 0 LIMIT 10;

--GET product by a seller ID
SELECT p.id, p.name, p.image_url, p.price, p.sale, s.description, s.company_name, s.contact_number FROM product p JOIN supplier s on p.supplier_id = s.user_id
WHERE p.supplier_id = seller_id
OFFSET 0 LIMIT 10 ;

--GET seller information by ID
SELECT contact_number, company_name, description, u.email, u.password, u.first_name, u.last_name, u.sex, u.date_of_birth FROM supplier s JOIN "user" u ON s.user_id = u.id WHERE user_id = input_id;

--GET address information of an user
SELECT a.id, a.street, a.city, a.province, a.postal_code, c.user_id FROM address a JOIN customer c ON a.id = c.address_id WHERE c.user_id = input_id;

--GET comments of a product
SELECT c.user_id, c.comment_text, c.rating FROM comment c JOIN product p ON c.product_id = p.id OFFSET 0 LIMIT 10;

--GET product detail
SELECT pd.product_id, pd.description, pd.additional_information FROM product_detail pd JOIN product p ON p.id = pd.product_id
WHERE p.id = input_id;

--GET product image by product id
SELECT pi.image_url, product_detail_id FROM product_image pi JOIN product_detail pd ON pi.product_detail_id = pd.id
WHERE pi.product_detail_id = pd.id AND pd.product_id = input_id;

--GET order by user id
SELECT o.user_id, o.status, o.total_amount FROM order o WHERE o.user_id = input_id offset 0 LIMIT 10;

--GET order detail by order id
SELECT product_id, id, order_id, product_id, quantity, price  FROM order_detail od WHERE od.order_id = input_id;

--Get access group of a user
SELECT ag.name, ag.role_id, ag.privilege, r.name FROM access_group ag JOIN role r ON ag.role_id = r.id
WHERE ag.role_id = (
    SELECT ur.role_id
    FROM user_role ur
    WHERE ur.user_id = 101
    );

--Get number of products which are successfully ordered. (xyz sản phẩm đã bán)
SELECT SUM(od.quantity) FROM order_detail od JOIN order o ON od.order_id = o.id
WHERE od.product_id = input_product_id AND o.status = 'SUCCESS';

--calculate average rating for a product
SELECT AVG(c.rating) FROM comment c JOIN product p ON c.product_id = p.id;

--GET products list from a category and a brand AND/OR sort by price
SELECT p.name, p.price, p.image_url, c.name FROM category c JOIN product p on c.id = p.category_id
WHERE p.category_id = input_category AND p.brand_id = input_brand_id
ORDER BY p.price ASC;

--GET products list form a category and sort by created_at (sản phẩm mới nhất ,cũ nhat)
SELECT p.id, p.name, p.price, p.image_url, p.sale, c.name
FROM product p JOIN category c on p.category_id = c.id
WHERE c.id = input_category
ORDER BY p.created_at
OFFSET 0
LIMIT 10;

--GET top product from a category (sản phẩm bán chạy)
SELECT p1.id, p1.image_url, p1.name, p1.price, p1.sale, p1.supplier_id
FROM product p1
WHERE p1.id IN (
    SELECT od.product_id
    FROM order_detail od JOIN product p ON od.product_id = p.id
    WHERE p.category_id = input_category_id
    GROUP BY od.product_id
    ORDER BY COUNT(*)
)
OFFSET 0
LIMIT 10;

--GET top product which have the biggest sale and the number of that item has been sold within today
SELECT p.id, p.name, p.price, p.sale, p.image_url, COUNT(1) as number_item_sold
FROM product p JOIN order_detail od on p.id = od.product_id
WHERE p.id IN (
    SELECT p1.id
    FROM product p1
    ORDER BY p1.sale DESC
    ) AND od.created_at >= NOW() - 1
GROUP BY p.id

