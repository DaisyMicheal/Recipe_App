import 'package:flutter/foundation.dart';
import '../models/recipe_or_dessert.dart';

class BookmarkProvider with ChangeNotifier {
  List<BookmarkItem> _bookmarkedItems = [];

  List<BookmarkItem> get bookmarkedItems => _bookmarkedItems;

  void addBookmark(BookmarkItem item) {
    _bookmarkedItems.add(item);
    notifyListeners();
  }

  void removeBookmark(BookmarkItem item) {
    _bookmarkedItems.remove(item);
    notifyListeners();
  }

  bool isBookmarked(BookmarkItem item) {
    return _bookmarkedItems.contains(item);
  }
}
