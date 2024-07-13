import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../data/recipe_data.dart';
import '../models/recipe_or_dessert.dart';
import '../providers/bookmark_provider.dart';
import 'detail_screen.dart';

class RecipeListPage extends StatefulWidget {
  final List<Recipe> foodItems;

  const RecipeListPage({Key? key, required this.foodItems}) : super(key: key);

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  bool isDarkMode = false;
  late List<Recipe> displayedRecipes;

  @override
  void initState() {
    super.initState();
    displayedRecipes = widget.foodItems;
  }

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _searchRecipes(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedRecipes = widget.foodItems;
      } else {
        displayedRecipes = RecipeData.searchRecipes(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Recipes'),
          actions: [
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                _toggleTheme();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  onChanged: _searchRecipes,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search recipes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: displayedRecipes.isNotEmpty
                      ? ListView.builder(
                          itemCount: displayedRecipes.length,
                          itemBuilder: (context, index) {
                            final item = displayedRecipes[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 4,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          imagePath: item.imagePath,
                                          foodName: item.name,
                                          description: item.description,
                                          ingredients: item.ingredients,
                                          ownerName: item.ownerName,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                        child: Image.asset(
                                          item.imagePath,
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              width: 120,
                                              height: 120,
                                              color: Colors.grey,
                                              child: Center(
                                                child: Text(
                                                  'Image not found',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                item.type,
                                                style: GoogleFonts.roboto(
                                                  color: Colors.grey[600],
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  const Icon(Icons.access_time,
                                                      size: 16),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    item.time,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14),
                                                  ),
                                                  const Spacer(),
                                                  IconButton(
                                                    icon: Icon(
                                                      item.isFavorite
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color: item.isFavorite
                                                          ? Colors.red
                                                          : null,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        item.toggleFavorite();
                                                      });
                                                      if (item.isFavorite) {
                                                        Provider.of<BookmarkProvider>(
                                                                context,
                                                                listen: false)
                                                            .addBookmark(item);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'Item added to favorites'),
                                                          ),
                                                        );
                                                      } else {
                                                        Provider.of<BookmarkProvider>(
                                                                context,
                                                                listen: false)
                                                            .removeBookmark(
                                                                item);
                                                      }
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      item.isSaved
                                                          ? Icons.bookmark
                                                          : Icons
                                                              .bookmark_border,
                                                      color: item.isSaved
                                                          ? Colors.blue
                                                          : null,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        item.toggleSaved();
                                                      });
                                                      if (item.isSaved) {
                                                        Provider.of<BookmarkProvider>(
                                                                context,
                                                                listen: false)
                                                            .addBookmark(item);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'Item added to bookmarks'),
                                                          ),
                                                        );
                                                      } else {
                                                        Provider.of<BookmarkProvider>(
                                                                context,
                                                                listen: false)
                                                            .removeBookmark(
                                                                item);
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            'Recipe not found',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
