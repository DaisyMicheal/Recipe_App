import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/bookmark_provider.dart';
import '../models/recipe_or_dessert.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final bookmarkedItems = context.watch<BookmarkProvider>().bookmarkedItems;
    final filteredItems = bookmarkedItems
        .where((item) =>
        item.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    final favoriteItems = filteredItems.where((item) => item.isFavorite).toList();
    final recentItems = filteredItems.where((item) => !item.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmark',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search saved recipes',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredItems.isEmpty
                  ? Center(
                child: Text(
                  searchQuery.isEmpty
                      ? 'No Saved item found'
                      : 'Item not found',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
                  : ListView(
                children: [
                  if (favoriteItems.isNotEmpty) ...[
                    Text(
                      'Favorites',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...favoriteItems.map((item) => BookmarkListItem(
                      item: item,
                      onDelete: () {
                        Provider.of<BookmarkProvider>(context,
                            listen: false)
                            .removeBookmark(item);
                      },
                    )),
                    const SizedBox(height: 20),
                  ],
                  if (recentItems.isNotEmpty) ...[
                    Text(
                      'Recently Saved',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...recentItems.map((item) => BookmarkListItem(
                      item: item,
                      onDelete: () {
                        Provider.of<BookmarkProvider>(context,
                            listen: false)
                            .removeBookmark(item);
                      },
                    )),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookmarkListItem extends StatelessWidget {
  final BookmarkItem item;
  final VoidCallback onDelete;

  const BookmarkListItem({Key? key, required this.item, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            item.imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item.name,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          item.description,
          style: GoogleFonts.roboto(
            fontSize: 14,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
