
use pizza_runner;
      
-- casestudy2-Pizza Runner --
-- How many pizzas were ordered? --
select count(order_id) 
from customer_orders;

-- How many unique customer orders were made? --
select * from customer_orders;
select count(Distinct(order_id)), customer_id
from customer_orders
group by customer_id;

-- How many successful orders were delivered by each runner? --

SELECT runner_id, COUNT(DISTINCT order_id) AS successful_deliveries
FROM runner_orders
WHERE cancellation IS NULL
  AND pickup_time IS NOT NULL
GROUP BY runner_id;

-- How many of each type of pizza was delivered?--
select * from customer_orders;
select * from pizza_names;
select * from runner_orders;
select * from pizza_recipes;

SELECT co.pizza_id, pn.pizza_name, COUNT(*) AS total_delivered
FROM customer_orders co
JOIN runner_orders ro ON co.order_id = ro.order_id
JOIN pizza_names pn ON co.pizza_id = pn.pizza_id
WHERE ro.cancellation IS NULL
  AND ro.pickup_time IS NOT NULL
GROUP BY co.pizza_id, pn.pizza_name;

-- How many Vegetarian and Meatlovers were ordered by each customer?--

SELECT co.customer_id, pn.pizza_name, COUNT(*) AS total
FROM customer_orders co
JOIN runner_orders ro ON co.order_id = ro.order_id
JOIN pizza_names pn ON co.pizza_id = pn.pizza_id
WHERE ro.cancellation IS NULL
  AND ro.pickup_time IS NOT NULL
GROUP BY co.customer_id, pn.pizza_name
ORDER BY co.customer_id;

-- What was the maximum number of pizzas delivered in a single order?--

SELECT co.order_id, COUNT(*) AS pizzas_delivered
FROM customer_orders co
JOIN runner_orders ro ON co.order_id = ro.order_id
WHERE ro.cancellation IS NULL
  AND ro.pickup_time IS NOT NULL
GROUP BY order_id
ORDER BY pizzas_delivered DESC
LIMIT 1;


-- How many pizzas were delivered that had both exclusions and extras?--

SELECT COUNT(*) AS pizzas_with_both_changes
FROM customer_orders co
JOIN runner_orders ro ON co.order_id = ro.order_id
WHERE ro.cancellation IS NULL
  AND ro.pickup_time IS NOT NULL
  AND TRIM(COALESCE(exclusions, '')) NOT IN ('', 'null')
  AND TRIM(COALESCE(extras, '')) NOT IN ('', 'null');
  
  -- What was the total volume of pizzas ordered for each hour of the day?--
  
  SELECT EXTRACT(HOUR FROM order_time) AS order_hour,
       COUNT(*) AS total_pizzas
FROM customer_orders
GROUP BY order_hour
ORDER BY order_hour;

-- What was the volume of orders for each day of the week? --

SELECT (order_time, 'Day') AS day_of_week,
       COUNT(DISTINCT order_id) AS total_orders
FROM customer_orders
GROUP BY day_of_week
ORDER BY MIN(order_time);




 

 
 