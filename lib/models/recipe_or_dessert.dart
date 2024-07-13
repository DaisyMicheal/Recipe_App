abstract class BookmarkItem {
  String get name;
  String get description;
  String get imagePath;
  bool get isFavorite;
  bool get isSaved;
  double get rating;
  void toggleFavorite();
  void toggleSaved();
}

class Dessert extends BookmarkItem {
  final String name;
  final String type;
  final String imagePath;
  final List<Map<String, String>> ingredients;
  final String time;
  final String description;
  final String ownerName;
  bool isFavorite;
  bool isSaved;
  final double rating;

  Dessert({
    required this.name,
    required this.type,
    required this.imagePath,
    required this.ingredients,
    required this.time,
    required this.description,
    required this.ownerName,
    this.isFavorite = false,
    this.isSaved = false,
    this.rating = 4.5,
  });

  @override
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  @override
  void toggleSaved() {
    isSaved = !isSaved;
  }
}

class Recipe extends BookmarkItem {
  final String name;
  final String description;
  final String imagePath;
  final String type;
  final String time;
  final List<Map<String, String>> ingredients;
  final String ownerName;
  bool isFavorite;
  bool isSaved;
  final double rating;

  Recipe({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.type,
    required this.time,
    required this.ingredients,
    required this.ownerName,
    this.isFavorite = false,
    this.isSaved = false,
    this.rating = 4.5,
  });

  @override
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  @override
  void toggleSaved() {
    isSaved = !isSaved;
  }
}
