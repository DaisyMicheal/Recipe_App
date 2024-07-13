import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/dessert_data.dart';
import '../models/recipe_or_dessert.dart';
import '../providers/bookmark_provider.dart';
import 'dessert_detail.dart';

class DessertPage extends StatefulWidget {
  final List<Dessert> foodItems;

  DessertPage({required this.foodItems});

  @override
  _DessertPageState createState() => _DessertPageState();
}

class _DessertPageState extends State<DessertPage> {
  bool isDarkMode = false;
  late List<Dessert> displayedDesserts;

  @override
  void initState() {
    super.initState();
    displayedDesserts = widget.foodItems;
  }

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _searchDesserts(String query) {
    setState(() {
      displayedDesserts = DessertData.searchDesserts(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Desserts'),
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
                  onChanged: _searchDesserts,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search desserts',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: displayedDesserts.isNotEmpty
                      ? ListView.builder(
                          itemCount: displayedDesserts.length,
                          itemBuilder: (context, index) {
                            final item = displayedDesserts[index];
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
                                        builder: (context) =>
                                            DessertDetailPage(dessert: item),
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
                                                "Recipe by ${item.ownerName}",
                                                style: GoogleFonts.roboto(
                                                  color: Colors.grey[600],
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(Icons.star,
                                                      size: 16,
                                                      color:
                                                          Colors.yellow[700]),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    item.rating.toString(),
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
                                                                'Dessert added to favorites'),
                                                          ),
                                                        );
                                                      } else {
                                                        Provider.of<BookmarkProvider>(
                                                                context,
                                                                listen: false)
                                                            .removeBookmark(
                                                                item);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'Dessert removed from favorites'),
                                                          ),
                                                        );
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
                                                                'Dessert added to bookmarks'),
                                                          ),
                                                        );
                                                      } else {
                                                        Provider.of<BookmarkProvider>(
                                                                context,
                                                                listen: false)
                                                            .removeBookmark(
                                                                item);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'Dessert removed from bookmarks'),
                                                          ),
                                                        );
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
                            'No desserts found',
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
