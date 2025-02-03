-- Problem 1 -- 
SELECT *
FROM cs_bookstore.books_inventory
WHERE mrp > 500 AND mrp < 2000;

-- Problem 2 --
SELECT 
item_id, 
item_price, 
discount_amount,
quantity,
item_price * quantity AS price_total,
discount_amount * quantity AS discount_total,
(item_price - discount_amount) * quantity AS item_total

FROM cs_bookstore.readers_order_items
WHERE (item_price - discount_amount) * quantity > 500
ORDER BY item_total DESC;

-- Problem 3 --
# One row, multiple columns
SELECT 
NOW() AS 'today_unformatted', 
DATE_FORMAT(NOW(), '%d-%b-%y')  AS 'today_formatted',
DATE_FORMAT(NOW(), '%m/%y')  AS 'today_formatted_mmyyyy';

-- Problem 4 --
SELECT 
readers.first_name, 
readers.last_name, 
readers_addresses.line1,
readers_addresses.city, 
readers_addresses.state, 
readers_addresses.zip_code
FROM readers
JOIN readers_addresses 
ON readers.reader_id = readers_addresses.reader_id
WHERE readers.email_address = 'david.goldstein@hotmail.com';

-- Problem 5 --
SELECT 
readers.first_name, 
readers.last_name, 
readers_addresses.line1,
readers_addresses.city, 
readers_addresses.state, 
readers_addresses.zip_code
FROM readers
JOIN readers_addresses 
ON readers.billing_address_id = readers_addresses.address_id;

-- Problem 6 --
SELECT 
r.last_name, 
r.first_name,
ro.order_date,
bi.title,
roi.item_price,
roi.discount_amount,
roi.quantity
FROM readers AS r
INNER JOIN readers_orders AS ro ON r.reader_id = ro.reader_id
INNER JOIN readers_order_items AS roi ON ro.order_id = roi.order_id
INNER JOIN books_inventory AS bi ON roi.book_id = bi.book_id
ORDER BY r.last_name, ro.order_date, bi.title DESC;

-- Problem 7 --
SELECT b1.title, b1.mrp
FROM 
books_inventory AS b1,
books_inventory AS b2
WHERE b1.book_id <> b2.book_id # checks that book_id are not equal
AND b1.mrp = b2.mrp 
ORDER BY b1.title;

-- Problem 8 --
SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM readers_orders
WHERE ship_date IS NOT NULL
UNION 
SELECT 'UNSHIPPED', order_id, order_date
FROM readers_orders
WHERE ship_date IS NULL
ORDER BY order_date;





