import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/recipe_or_dessert.dart';
import '../widges/category_card.dart';
import 'detail_screen.dart';
import 'bookmark_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'recipe_page.dart';
import 'setting_page.dart';
import 'dessert_page.dart';
import '../data/recipe_data.dart';
import '../data/dessert_data.dart';

class Recommendation {
  final String imagePath;
  final String recipeName;
  final String chefName;
  final String description;


  Recommendation({
    required this.imagePath,
    required this.recipeName,
    required this.chefName,
    required this. description,

  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool isDarkMode = false;

  final List<Recommendation> recommendations = [
    Recommendation(
        imagePath: "assets/burger.jpg",
        recipeName: "Classic Burger",
        chefName: "Chef John Doe",
        description: " patty with fresh vegetables and cheese in a toasted bun.",

    ),
    Recommendation(
      imagePath: "assets/chicken_g.jpg",
      recipeName: "Grilled Chicken",
      chefName: "Chef Jane Smith",
        description:
        "Juicy beef patty with fresh vegetables and cheese in a toasted bun.",

    ),
    Recommendation(
      imagePath: "assets/chiken_f.jpeg",
      recipeName: "Fried Chicken",
      chefName: "Chef Emily Brown",
      description:
      "Juicy beef patty with fresh vegetables and cheese in a toasted bun.",
    ),
    Recommendation(
      imagePath: "assets/pizza.jpg",
      recipeName: "Pepperoni Pizza",
      chefName: "Chef Michael Lee",
      description:
      "Juicy beef patty with fresh vegetables and cheese in a toasted bun.",
    ),
    Recommendation(
      imagePath: "assets/spaghetti.jpg",
      recipeName: "Spaghetti Bolognese",
      chefName: "Chef Sarah Wilson",
      description:
      "Juicy beef patty with fresh vegetables and cheese in a toasted bun.",
    ),
  ];

  final List<Recipe> foodItems = RecipeData.recipes;
  final List<Dessert> dessertItems = DessertData.desserts;

  final List<String> recipeOfTheWeekImages = [
    "assets/burger.jpg",
    "assets/chicken_g.jpg",
    "assets/chiken_f.jpeg",
    "assets/pizza.jpg",
    "assets/shawama.jpg",
    "assets/beef_bibimbap_recipe.jpeg",
    "assets/pancake.jpg",
  ];

  final List<String> dessertImages = [
    "assets/brownies.jpg",
    "assets/Cake.jpg",
    "assets/chocolate cake .jpg",
    "assets/chocolate.jpg",
    "assets/shawama.jpg",
    "assets/dessert.jpg",
    "assets/corndog.jpg",
  ];

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeListPage(foodItems: foodItems),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BookmarkPage(),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  SettingsPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), label: "Recipes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_add), label: "Bookmark"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          iconSize: 30,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, ${getGreeting()}",
                              style: GoogleFonts.roboto(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "What would you like to cook today?",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: isDarkMode,
                        onChanged: (value) {
                          _toggleTheme();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search any recipes',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Categories",
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(
                          icon: Icons.breakfast_dining, label: "Breakfast"),
                      CategoryCard(icon: Icons.lunch_dining, label: "Lunch"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                imagePath: 'assets/chiken_f.jpeg',
                                foodName: 'Dinner',
                                description:
                                "Delicious dinner with various courses.",
                                ingredients: [
                                  {
                                    'name': 'Course 1',
                                    'imagePath': 'assets/chicken_g.jpg'
                                  },
                                  {
                                    'name': 'Course 2',
                                    'imagePath': 'assets/pizza.jpg'
                                  },
                                  {
                                    'name': 'Course 3',
                                    'imagePath': 'assets/spaghetti.jpg'
                                  },
                                ],
                                ownerName: 'Chef Emily Brown',
                              ),
                            ),
                          );
                        },
                        child: CategoryCard(
                            icon: Icons.dinner_dining, label: "Dinner"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeListPage(
                                foodItems: foodItems,
                              ),
                            ),
                          );
                        },
                        child: CategoryCard(icon: Icons.cake, label: "Dessert"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Recommendation",
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 250,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                    ),
                    items: recommendations.map((recommendation) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    imagePath: recommendation.imagePath,
                                    foodName: recommendation.recipeName,
                                    description: recommendation. description, // Add appropriate description here
                                    ingredients: [ {'name': 'Soy Sauce', 'imagePath': 'assets/Soy sauce.jpg'},
                                      {'name': 'Sesame Seeds', 'imagePath': 'assets/Sesame seeds.jpg'},
                                      {'name': 'Ginger', 'imagePath': 'assets/ginger.jpg'},
                                      {'name': 'Scallions', 'imagePath': 'assets/Scallions.jpg'},
                                      {'name': 'Vegetables', 'imagePath': 'assets/vegetables.jpg'},], // Add appropriate ingredients here
                                    ownerName: recommendation.chefName,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 9.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Hero(
                                      tag: recommendation.imagePath,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                          recommendation.imagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    recommendation.recipeName,
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey[800],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Recipe by ${recommendation.chefName}",
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recipe of the week",
                        style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RecipeListPage(foodItems: foodItems)),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: recipeOfTheWeekImages.map((image) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 9.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              image,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dessert",
                        style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DessertPage(
                                foodItems: dessertItems,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: dessertImages.map((image) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              image,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
