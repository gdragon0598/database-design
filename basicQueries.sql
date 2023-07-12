--Get category id:  input: category name

SELECT id FROM category
WHERE name = input;

--GET PRODUCT BY CATEGORY ID
SELECT * FROM category c JOIN product p on c.id = p.category_id LIMIT 10;

--GET MAIN PAGE SUGGESTED PRODUCTS (xxx ITEMS PER PAGE)
SELECT * FROM product LIMIT 10;

--GET product by brand
SELECT * FROM product p JOIN brand b ON b.id = p.brand_id;

--GET product by a seller ID
SELECT * FROM product p
WHERE p.supplier_id = seller_id;

--GET seller information by ID
SELECT * FROM supplier WHERE user_id = input_id;

--GET address information of an user
SELECT * FROM address a JOIN customer c ON a.id = c.address_id WHERE c.user_id = input_id;

--GET comments of a product
SELECT * FROM comment c JOIN product p ON c.product_id = p.id;

--GET product detail
SELECT * FROM product_detail pd JOIN product p ON p.id = pd.product_id
WHERE p.id = input_id;

--GET product image by product id
SELECT * FROM product_image pi JOIN product_detail pd ON pi.product_detail_id = pd.id
WHERE pi.product_detail_id = pd.id AND pd.product_id = input_id;

--GET order by user id
SELECT * FROM order o WHERE o.user_id = input_id;

--GET order detail by order id
SELECT * FROM order_detail od WHERE od.order_id = input_id