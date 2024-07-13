import '../models/recipe_or_dessert.dart';

class RecipeData {
  static List<Recipe> recipes = [
    Recipe(
      name: "Grilled Burger",
      type: "Main Course",
      imagePath: "assets/buger2.jpg",
      ingredients: [
        {'name': 'Lettuce', 'imagePath': 'assets/letus.jpg'},
        {'name': 'Tomato', 'imagePath': 'assets/Tomatoes.jpg'},
        {'name': 'Cheese', 'imagePath': 'assets/cheese.jpg'},
        {'name': 'Burger Bun', 'imagePath': 'assets/Buger Bun.jpg'},
      ],
      time: "30 mins",
      description:
          "Juicy beef patty with fresh vegetables and cheese in a toasted bun.",
      ownerName: "Chef John Doe",
    ),
    Recipe(
      name: "Salmon Fillet",
      type: "Main Course",
      imagePath: "assets/Salmon Fillet.jpg",
      ingredients: [
        {'name': 'Fish', 'imagePath': 'assets/fish.jpg'},
        {'name': 'Rice', 'imagePath': 'assets/rice.jpg'},
        {'name': 'Basil', 'imagePath': 'assets/basil.jpg'},
        {'name': 'Sauce', 'imagePath': 'assets/Chili garlic sauce.jpg'},
      ],
      time: "30 mins",
      description: "Fried and fantantic chicken for daily meal",
      ownerName: "Chef John Doe",
    ),
    Recipe(
      name: "Ramen",
      imagePath: 'assets/ramen.jpg',
      type: 'Main Course',
      ingredients: [
        {'name': 'Soy Sauce', 'imagePath': 'assets/Soy sauce.jpg'},
        {'name': 'Sesame Seeds', 'imagePath': 'assets/Sesame seeds.jpg'},
        {'name': 'Ginger', 'imagePath': 'assets/ginger.jpg'},
        {'name': 'Scallions', 'imagePath': 'assets/Scallions.jpg'},
        {'name': 'Vegetables', 'imagePath': 'assets/vegetables.jpg'},
      ],
      time: "30 mins",
      description:
          "Here's an easy saucy ramen noodles recipe with a thick and flavourful sauce! You can also add in whatever veggies of your choice or even some tofu and mushrooms!The sauce is really versatile so you can opt to even use it for stir-fries. Slurp away and enjoy!",
      ownerName: "Chef John Doe",
    ),
    Recipe(
      name: "Wings",
      imagePath: 'assets/wings.jpg',
      type: 'Main Course',
      ingredients: [
        {'name': 'Wings', 'imagePath': 'assets/chicken wing.jpg'},
        {'name': 'Galic Sauce', 'imagePath': 'assets/Chili garlic sauce.jpg'},
        {'name': 'Ginger', 'imagePath': 'assets/ginger.jpg'},
        {'name': 'Oil', 'imagePath': 'assets/oil.jpg'},
      ],
      time: "30 mins",
      description:
          "Baked salmon fillet with honey ginger glaze served with rice and vegetables.",
      ownerName: "Chef John Doe",
    ),
    Recipe(
      name: "Rice Beef",
      imagePath: 'assets/fried rice .jpg',
      type: 'Main Course',
      ingredients: [
        {'name': 'Oil', 'imagePath': 'assets/oil.jpg'},
        {'name': 'Onion', 'imagePath': 'assets/onion.jpg'},
        {'name': 'Ginger', 'imagePath': 'assets/ginger.jpg'},
        {'name': 'Rice', 'imagePath': 'assets/rice.jpg'},
        {'name': 'Vegetables', 'imagePath': 'assets/vegetables.jpg'},
      ],
      time: "30 mins",
      description: "Fried and fantantic chicken for daily meal",
      ownerName: "Chef John Doe",
    ),
    Recipe(
      name: "Meat",
      imagePath: 'assets/meat.jpg',
      type: 'Main Course',
      ingredients: [
        {'name': 'Oil', 'imagePath': 'assets/oil.jpg'},
        {'name': 'Cucumber', 'imagePath': 'assets/cocuber.jpg'},
        {'name': 'Ginger', 'imagePath': 'assets/ginger.jpg'},
        {'name': 'Onion', 'imagePath': 'assets/onion.jpg'},
        {'name': 'Mushroom', 'imagePath': 'assets/mushroom .jpg'},
      ],
      time: "30 mins",
      description:
          "Baked salmon fillet with honey ginger glaze served with rice and vegetables.",
      ownerName: "Chef John Doe",
    ),
    Recipe(
      name: "Tobokki",
      imagePath: 'assets/toboki.jpg',
      type: 'Main Course',
      ingredients: [
        {'name': 'Soy Sauce', 'imagePath': 'assets/Soy sauce.jpg'},
        {'name': 'Tofu', 'imagePath': 'assets/Tofu.jpg'},
        {'name': 'Ginger', 'imagePath': 'assets/ginger.jpg'},
        {'name': 'Spices', 'imagePath': 'assets/spices.jpg'},
        {'name': 'Tomato Sauce', 'imagePath': 'assets/tomato_sauce.jpg'},
      ],
      time: "30 mins",
      description:
          "Baked salmon fillet with honey ginger glaze served with rice and vegetables.",
      ownerName: "Chef John Doe",
    ),
  ];

  static List<Recipe> searchRecipes(String query) {
    if (query.isEmpty) {
      return recipes;
    }
    return recipes.where((recipe) {
      final nameLower = recipe.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();
  }
}
