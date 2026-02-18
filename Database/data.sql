INSERT INTO customers VALUES
(1, 'Amit Sharma', 'Pune'),
(2, 'Riya Mehta', 'Mumbai'),
(3, 'Sohan Patil', 'Pune'),
(4, 'Neha Verma', 'Delhi');

INSERT INTO restaurants VALUES
(101, 'Burger Hub', 'Pune', 4.2),
(102, 'Pizza Palace', 'Mumbai', 4.5),
(103, 'Delhi Biryani', 'Delhi', 4.6);

INSERT INTO menu VALUES
(1, 101, 'Veg Burger', 120),
(2, 101, 'Cheese Burger', 150),
(3, 102, 'Margherita Pizza', 300),
(4, 103, 'Chicken Biryani', 350);

INSERT INTO orders VALUES
(1001, 1, 101, '2024-01-10'),
(1002, 2, 102, '2024-01-12'),
(1003, 3, 101, '2024-01-15'),
(1004, 4, 103, '2024-01-18');

INSERT INTO order_details VALUES
(1, 1001, 1, 2),
(2, 1001, 2, 1),
(3, 1002, 3, 1),
(4, 1003, 1, 3),
(5, 1004, 4, 2);
