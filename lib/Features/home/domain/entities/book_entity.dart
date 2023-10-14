import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String authorName;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final num price;
  @HiveField(6)
  final num rating;
  @HiveField(7)
  final num count;
  

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.count,
    required this.category,
  });
}
