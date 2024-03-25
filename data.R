# Load required libraries
library(tidyverse)

# Define recipes

# Recipe 1: Paneer Butter Masala
panner_butter_masala <- data.frame(
  recipe = "panner_butter_masala",
  ingredient = c("paneer", "butter", "onion", "tomato", "cashew nuts", "ginger garlic paste", "chili powder", "turmeric", "garam masala", "tomato ketchup", "kasuri methi"),
  qty = c(200, 50, 1, 2, 10, 1.5, 1, 1, 1, 1, 1),
  unit = c("g", "g", "cup", "cup", "tbsp", "tsp", "tsp", "tsp", "tsp", "tsp", "tsp")
)

# Recipe 2: Pepper Chicken Gravy
pepper_chicken_gravy <- data.frame(
  recipe = "pepper_chicken_gravy",
  ingredient = c("chicken", "onion", "tomato", "garlic", "ginger", "pepper", "turmeric", "coriander", "cumin", "garam masala", "cream"),
  qty = c(500, 1, 2, 2, 2, 2, 1, 1, 1, 1, 50),
  unit = c("g", "cup", "cup", "cloves", "inch", "tsp", "tsp", "tsp", "tsp", "tsp", "ml")
)

# Recipe 3: Strawberry Milk Shake
strawberry_milk_shake <- data.frame(
  recipe = "strawberry_milk_shake",
  ingredient = c("strawberry", "milk", "sugar", "vanilla ice cream"),
  qty = c(100, 200, 50, 100),
  unit = c("g", "ml", "tsp", "scoop")
)

# Recipe 4: Chicken Tikka Masala
chicken_tikka_masala <- data.frame(
  recipe = "chicken_tikka_masala",
  ingredient = c("chicken", "yogurt", "tomato", "onion", "garlic", "ginger", "coriander", "turmeric", "cumin", "garam masala", "paprika", "chili powder", "butter", "flour", "cream", "oil"),
  qty = c(1000, 500, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
  unit = c("g", "g", "cup", "cup", "tsp", "tsp", "tsp", "tsp", "tsp", "tsp", "tsp", "tsp", "tbsp", "tbsp", "ml", "tbsp")
)

# Recipe 5: Palak Paneer
palak_paneer <- data.frame(
  recipe = "palak_paneer",
  ingredient = c("paneer", "spinach", "onion", " garlic", "cumin", "garam masala", "turmeric", "chili powder", "cream", "oil", "salt", "lemon juice", "butter"),
  qty = c(200, 1, 1, 1, 1, 1, 1, 1, 50, 1, 1, 1, 1),
  unit = c("g", "bunch", "cup", "tsp", "tsp", "tsp", "tsp", "tsp", "ml", "tbsp", "tsp", "tsp", "tbsp")
)

# Combine recipes
recipe_data <- bind_rows(panner_butter_masala, pepper_chicken_gravy, strawberry_milk_shake, chicken_tikka_masala, palak_paneer)

# Save recipe data
save(recipe_data, file = "recipe_data.rda")
