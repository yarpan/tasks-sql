-- Задача 1:
-- У вас є таблиця `products` зі стовпцями:
-- `product_id` (ціле число, первинний ключ)
-- `product_name` (текст)
-- `category` (текст)
-- `price` (число з плаваючою комою)
-- `stock_quantity` (ціле число)
-- Напишіть SQL-запит, який вибере назви всіх продуктів (`product_name`) з категорії 'Electronics', ціна яких (`price`) є більшою за 100 і кількість на складі (`stock_quantity`) є меншою за 50. Відсортуйте результат за назвою продукту в алфавітному порядку.

SELECT product_name
FROM products
WHERE category = 'Electronics' AND price > 100 AND stock_quantity < 50
ORDER BY product_name ASC;

-- Задача 2:
-- Використовуючи ту саму таблицю `products`, напишіть SQL-запит, який вибере унікальні назви категорій (`category`) та для кожної категорії виведе середню ціну (`price`) продуктів у цій категорії. Відсортуйте результат за середньою ціною від найвищої до найнижчої.

SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

-- Задача 3:
-- Знову використовуючи таблицю `products`, напишіть SQL-запит, який вибере назви (`product_name`) тих продуктів, кількість яких на складі (`stock_quantity`) є меншою за 10, або ціна (`price`) яких перевищує 500. Відсортуйте результат за ціною від найнижчої до найвищої.

SELECT product_name
FROM products
WHERE stock_quantity < 10 OR price > 500
ORDER BY price ASC;

-- Задача 4:
-- Використовуючи таблицю `products`, напишіть SQL-запит, який вибере назву категорії (`category`) та загальну кількість (`SUM`) продуктів у кожній категорії, але тільки для тих категорій, в яких загальна кількість продуктів на складі перевищує 100. Відсортуйте результат за назвою категорії в алфавітному порядку.

SELECT category, SUM(stock_quantity) AS total_quantity
FROM products
GROUP BY category
HAVING SUM(stock_quantity) > 100
ORDER BY category ASC;

-- Задача 5:
-- Використовуючи таблицю `products`, напишіть SQL-запит, який вибере назви (`product_name`) тих продуктів, ціна (`price`) яких знаходиться в діапазоні від 50 до 200 включно, і кількість яких на складі (`stock_quantity`) не дорівнює 0. Відсортуйте результат спочатку за ціною (від найнижчої до найвищої), а потім за назвою продукту (в алфавітному порядку).

SELECT product_name
FROM products
WHERE price >= 50 AND price <= 200 AND stock_quantity <> 0
ORDER BY price ASC, product_name ASC;

-- Задача 6:
-- У вас є таблиця `orders` зі стовпцями:
-- `order_id` (ціле число, первинний ключ)
-- `customer_id` (ціле число, зовнішній ключ до таблиці `customers`)
-- `order_date` (дата)
-- `total_amount` (число з плаваючою комою)
-- `status` (текст: 'Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')
-- Напишіть SQL-запит, який вибере всі можливі статуси замовлень та кількість замовлень для кожного статусу. Відсортуйте результат за кількістю замовлень у спадному порядку.

SELECT status, COUNT(order_id) AS number_of_orders
FROM orders
GROUP BY status
ORDER BY number_of_orders DESC;

-- Задача 7:
-- У вас є таблиця `products` зі стовпцями (повторно):
-- `product_id` (ціле число, первинний ключ)
-- `product_name` (текст)
-- `category` (текст)
-- `price` (число з плаваючою комою)
-- `stock_quantity` (ціле число)
-- Напишіть SQL-запит, який вибере назву кожної категорії (`category`) та середню ціну (`AVG(price)`) продуктів у цій категорії, але тільки для тих категорій, де середня ціна є більшою за 50. Відсортуйте результат за назвою категорії в алфавітному порядку.

SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category
HAVING AVG(price) > 50
ORDER BY category ASC;

-- Задача 8:
-- У вас є таблиця `sales` зі стовпцями:
-- `sale_id` (ціле число, первинний ключ)
-- `product_id` (ціле число, зовнішній ключ до таблиці `products`)
-- `sale_date` (дата)
-- `quantity_sold` (ціле число)
-- `unit_price` (число з плаваючою комою)
-- Напишіть SQL-запит, який вибере ідентифікатор товару (`product_id`) та загальну кількість проданого товару (`SUM(quantity_sold)`) для кожного товару, але тільки для тих товарів, загальна кількість продажу яких перевищує 100. Відсортуйте результат за загальною кількістю проданого товару у спадному порядку.

SELECT product_id, SUM(quantity_sold) AS total_sold
FROM sales
GROUP BY product_id
HAVING SUM(quantity_sold) > 100
ORDER BY total_sold DESC;

-- Задача 9:
-- У вас є таблиця `employees` зі стовпцями:
-- `employee_id` (ціле число, первинний ключ)
-- `department` (текст)
-- `salary` (ціле число)
-- `hire_date` (дата)
-- Напишіть SQL-запит, який вибере назву кожного відділу (`department`) та кількість співробітників (`COUNT(*)`) у цьому відділі, але тільки для тих відділів, де кількість співробітників є більшою за 2 і середня зарплата (`AVG(salary)`) у цьому відділі є меншою за 60000. Відсортуйте результат за назвою відділу в алфавітному порядку.

SELECT department, COUNT(employee_id) AS num_employees
FROM employees
GROUP BY department
HAVING COUNT(employee_id) > 2 AND AVG(salary) < 60000
ORDER BY department ASC;

-- Задача 10:
-- У вас є таблиця `events` зі стовпцями:
-- `event_id` (ціле число, первинний ключ)
-- `event_type` (текст)
-- `user_id` (ціле число, зовнішній ключ до таблиці `users`)
-- `event_date` (дата)
-- `duration_seconds` (ціле число)
-- Напишіть SQL-запит, який вибере тип події (`event_type`) та середню тривалість подій цього типу (`AVG(duration_seconds)`), але тільки для тих типів подій, середня тривалість яких є більшою за 30 секунд і кількість подій цього типу перевищує 5. Відсортуйте результат за середньою тривалістю у спадному порядку.

SELECT event_type, AVG(duration_seconds) AS average_duration
FROM events
GROUP BY event_type
HAVING AVG(duration_seconds) > 30 AND COUNT(event_id) > 5
ORDER BY average_duration DESC;