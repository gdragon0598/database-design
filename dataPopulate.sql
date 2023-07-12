
INSERT INTO category (name)
VALUES
    ('Đồ chơi - Mẹ và bé'),
    ('Điện thoại, máy tính bảng'),
    ('Làm đẹp - Sức khoẻ'),
    ('Điện gia dụng'),
    ('Thời trang nữ'),
    ('Thời trang nam'),
    ('Giày - dép nữ'),
    ('Túi thời trang nữ'),
    ('Giày - dép nam'),
    ('Túi thời trang nam'),
    ('Balo và vali'),
    ('Phụ kiện thời trang'),
    ('Đồng hồ trang sức'),
    ('Laptop - máy vi tính'),
    ('Nhà cửa - Đời sống'),
    ('Hàng quốc tế'),
    ('Thể thao dã ngoại'),
    ('Điện tu - Điện lạnh'),
    ('Máy ảnh - Máy quay phim');

INSERT INTO brand(name)
VALUES
    ('TEFAL'),
    ('MARSHALL'),
    ('LOCKNLOCK'),
    ('LOGITECH'),
    ('SAMSUNG'),
    ('PAULA''S CHOICE'),
    ('LA ROCHE POSAY'),
    ('KINGSPORT'),
    ('NAGAKAWA'),
    ('LG'),
    ('TCL'),
    ('FUJI'),
    ('CASPER'),
    ('SONY'),
    ('XIAOMI'),
    ('ELECTROLUX'),
    ('LET-GREEN'),
    ('SUNLIGHT'),
    ('OMO'),
    ('BOBBY'),
    ('ENFA'),
    ('VINAMILK'),
    ('ENSURE'),
    ('HUGGIES'),
    ('VIM');

INSERT INTO product(name, price,category_id, brand_id)
VALUES
    ('Nước Lau Sàn Sunlight Tinh Dầu Thảo Mộc Dạng Túi 3.4/3.6 kg
',61000, 101, 118),
    ('Combo 3 Hộp 4 Viên Nén Vệ Sinh Lồng Giặt OMO Matic 80gr', 276000, 101, 119),
    ('Sữa Bột Abbott Ensure Gold Vani 850g', 800000, 101, 123),
    ('Tã dán sơ sinh Huggies mới (4kg-8kg) - Gói 80 miếng Tràm Trà + Tặng 2 miếng', 255000, 101, 124),
    ('Combo Viên tẩy bồn cầu 55G x 3 VIM Power 5 hương Oải hương Sạch Khuẩn Thơm Mát suốt 30 ngày', 84000, 101, 125),
    ('Điện thoại Samsung Galaxy A34 5G (8GB/128GB)', 7000000, 102, 105);

INSERT INTO role(name)
VALUES
    ('ADMIN'),
    ('USER');

INSERT INTO "user"(email, password, first_name, last_name, sex, date_of_birth)
VALUES
    ('leminhhuan1@gmail.com','123456789','le','minh huan','M','2002-05-24'),
    ('leminhhuan2@gmail.com','123456789','truong','nhat minh','M','2002-03-15'),
    ('leminhhuan3@gmail.com','123456789','dao','quang dung','M','2002-10-10'),
    ('leminhhuan4@gmail.com','123456789','nguyen','hoang sang','M','2002-09-20');

INSERT INTO user_role(user_id, role_id)
VALUES
    (101, 101),
    (102,102),
    (103,102),
    (104,102);

INSERT INTO address(street, city, province, postal_code)
VALUES
    ('40/31 nguyễn giản thanh', 'quận 10', 'thành pho Ho Chi Minh', '700000'),
    ('41/31 nguyễn giản thanh', 'quận 10', 'thành pho Ho Chi Minh', '700000'),
    ('42/31 nguyễn giản thanh', 'quận 10', 'thành pho Ho Chi Minh', '700000'),
    ('43/31 nguyễn giản thanh', 'quận 10', 'thành pho Ho Chi Minh', '700000');

INSERT INTO customer(user_id, address_id)
VALUES
    (102, 102),
    (103, 103);

INSERT INTO supplier(user_id, company_name, address_id, contact_number, description)
VALUES
    (104, 'ABC LTD Company', 104, '0916732870', 'This is a test company');

INSERT INTO access_group(name, role_id, privilege)
VALUES
        ('admin_edit', 101, 'EDIT'),
        ('admin_view', 101, 'VIEW'),
        ('user_view', 101, 'VIEW');
