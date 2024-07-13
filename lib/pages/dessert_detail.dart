import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/recipe_or_dessert.dart';

class DessertDetailPage extends StatelessWidget {
  final Dessert dessert;

  const DessertDetailPage({Key? key, required this.dessert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            children: [
              _buildImage(dessert.imagePath, size),
            ],
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 1,
            initialChildSize: 0.6,
            minChildSize: 0.6,
            builder: (context, controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dessert.name,
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 20, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            "By ${dessert.ownerName}",
                            style: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                          ),
                          const Spacer(),
                          const Icon(Icons.star, color: Colors.orange, size: 20),
                          Text(
                            "4.5",
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Description",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        dessert.description,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Ingredients",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: dessert.ingredients.map((ingredient) {
                          return _buildIngredientItem(
                            ingredient['name'] ?? '',
                            ingredient['imagePath'] ?? '',
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.play_circle_filled),
                          label: const Text("Watch Videos"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            textStyle: GoogleFonts.roboto(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String path, Size size) {
    return Image.asset(
      path,
      height: size.height * 0.55,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Center(
          child: Text(
            'Image not found',
            style: TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }

  Widget _buildIngredientItem(String ingredient, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image, size: 40, color: Colors.grey);
              },
            ),
          ),
          const SizedBox(width: 8),
          Text(
            ingredient,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          // Add any additional widgets or functionality as needed
        ],
      ),
    );
  }
}
