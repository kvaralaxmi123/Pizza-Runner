# Pizza-Runner sql case study
# OVERVIEW
This project answers business questions using SQL, covering aspects like customer behavior, runner performance, ingredient usage, and financial efficiency.
# DATASET
| Table Name           | Description                                           |
|----------------------|-------------------------------------------------------|
| customer_orders      | Tracks each pizza order by customers.                |
| runners              | Information on registered delivery runners.          |
| runner_orders        | Contains data on order pickup, duration, and distance.|
| pizza_names          | Pizza types (Meat Lovers, Vegetarian).               |
| pizza_recipes        | Ingredient IDs mapped to pizza types.                |
| pizza_toppings       | Ingredient names and IDs.                            |
| extras_extracted     | Extra toppings added per order.                      |
| exclusions_extracted | Toppings excluded by customers.                      |
| rating_runners       | Simulated customer feedback for runners.             |

# insights
* Total Revenue: $138 without extras, $144 with extras.
* Top Pizza: Meat Lovers is the most ordered.
* Popular Extra: Cheese is the most frequently added topping.
* Most Excluded: Bacon is the most excluded ingredient.
# Recommendations
* Route Optimization: Use tracking to improve runner efficiency.
* Feedback System: Use runner ratings for performance improvement and rewards.
* Combo Offers: Introduce bundles with popular extras.
