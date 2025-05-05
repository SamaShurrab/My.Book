// This class represents the book and contains its properties.
class Book {
  final String bookTitle;
  final String authorName;
  final String bookImage;
  final double rating;
  final String bookDescription;
  bool isFavorite;
  bool isSaved;

  Book(
      {required this.bookTitle,
      required this.bookImage,
      required this.authorName,
      this.isFavorite = false,
      this.isSaved = false,
      required this.rating,
      required this.bookDescription});
}
