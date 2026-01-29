CREATE DATABASE food_delivery_db;
USE food_delivery_db;

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE delivery_partners (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100),
    vehicle_type VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    restaurant_id INT,
    partner_id INT,
    food_item VARCHAR(50),
    order_hour INT,
    order_quantity INT,
    delivery_time_min INT,
    is_weekend BOOLEAN,
    is_holiday BOOLEAN,
    
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (partner_id) REFERENCES delivery_partners(partner_id)
);

INSERT INTO restaurants VALUES
(1, 'Spice Hub', 'Bangalore'),
(2, 'Food Fiesta', 'Mumbai');

INSERT INTO delivery_partners VALUES
(1, 'Ravi', 'Bike'),
(2, 'Amit', 'Scooter');

INSERT INTO orders VALUES
(101, 1, 1, 'Pizza', 13, 2, 35, 0, 0),
(102, 2, 2, 'Biryani', 20, 3, 42, 1, 0),
(103, 1, 1, 'Burger', 20, 1, 30, 1, 0);

SELECT 
    food_item,
    SUM(order_quantity) AS total_orders
FROM orders
GROUP BY food_item
ORDER BY total_orders DESC;

SELECT 
    order_hour,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_hour
ORDER BY total_orders DESC;

SELECT 
    order_hour,
    COUNT(order_id) AS weekend_orders
FROM orders
WHERE is_weekend = 1
GROUP BY order_hour
ORDER BY weekend_orders DESC;

SELECT 
    restaurant_id,
    AVG(delivery_time_min) AS avg_delivery_time
FROM orders
GROUP BY restaurant_id;

