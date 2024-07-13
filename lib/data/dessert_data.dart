import '../models/recipe_or_dessert.dart';

class DessertData {
  static List<Dessert> desserts = [
    Dessert(
      name: "Chocolate Cake",
      type: "Dessert",
      imagePath: "assets/Cake.jpg",
      ingredients: [
        {'name': 'Flour', 'imagePath': 'assets/flour.jpg'},
        {'name': 'Sugar', 'imagePath': 'assets/Brown Suger.jpg'},
        {'name': 'Eggs', 'imagePath': 'assets/egg.jpg'},
        {'name': 'Butter', 'imagePath': 'assets/butter.jpg'},
      ],
      time: "60 mins",
      description:
          "Rich and moist chocolate cake topped with chocolate ganache.",
      ownerName: "Chef Emily Brown",

    ),
    Dessert(
      name: "Brownies",
      type: "Dessert",
      imagePath: "assets/Brownies.jpg",
      ingredients: [
        {'name': 'Chocolate', 'imagePath': 'assets/chocolate.jpg'},
        {'name': 'Flour', 'imagePath': 'assets/flour.jpg'},
        {'name': 'Sugar', 'imagePath': 'assets/palm suger.jpg'},
        {'name': 'Butter', 'imagePath': 'assets/butter.jpg'},
        {'name': 'Eggs', 'imagePath': 'assets/egg.jpg'},
      ],
      time: "45 mins",
      description: "Chewy and fudgy brownies with a crackly top.",
      ownerName: "Chef Emily Brown",
    ),
    Dessert(
      name: "MilkShake",
      type: "Milky Donut",
      imagePath: "assets/milky.jpg",
      ingredients: [
        {'name': 'Chocolate', 'imagePath': 'assets/palm suger.jpg'},
        {'name': 'Flour', 'imagePath': 'assets/condensed milk.jpg'},
        {'name': 'Sugar', 'imagePath': 'assets/egg.jpg'},
        {'name': 'Butter', 'imagePath': 'assets/honey.jpg'},
        {'name': 'Eggs', 'imagePath': 'assets/butter.jpg'},
      ],
      time: "45 mins",
      description: "Chewy and fudgy micky donut  with a crackly top.",
      ownerName: "Chef Emily Brown",
    ),

    Dessert(
      name: "MilkShake",
      type: "MilkShake",
      imagePath: "assets/milkshake.jpg",
      ingredients: [
        {'name': 'Chocolate', 'imagePath': 'assets/Dark chocolate chips.jpg'},
        {'name': 'Flour', 'imagePath': 'assets/honey.jpg'},
        {'name': 'Sugar', 'imagePath': 'assets/Oreos plus .jpg'},
      ],
      time: "45 mins",
      description: " Chocolate MilkShake with oreos plus  ",
      ownerName: "Chef Emily Brown",
    ),

    Dessert(
      name: "Cake ",
      type: "Cake",
      imagePath: "assets/oreos.jpg",
      ingredients: [
        {'name': 'Chocolate', 'imagePath': 'assets/Dark chocolate chips.jpg'},
        {'name': 'Flour', 'imagePath': 'assets/honey.jpg'},
        {'name': 'Sugar', 'imagePath': 'assets/Oreos plus .jpg'},
      ],
      time: "45 mins",
      description: " Chocolate MilkShake with oreos plus  ",
      ownerName: "Chef Emily Brown",
    ),

  ];

  static List<Dessert> searchDesserts(String query) {
    if (query.isEmpty) {
      return desserts;
    }
    return desserts.where((dessert) {
      final nameLower = dessert.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();
  }
}
