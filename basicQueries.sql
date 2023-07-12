--Get category id:  input: category name

SELECT id FROM category
WHERE name = input;

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
SELECT product_id, id, order_id, product_id, quantity, price  FROM order_detail od WHERE od.order_id = input_id