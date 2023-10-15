import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/save_books.dart';

import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchSimilarBooks(
      {required String category, int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');
    BookModel bookModel = BookModel.fromJson(data);
    List<BookEntity> books = bookModel.items!;
    //cache data to local data base
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10}');
    BookModel bookModel = BookModel.fromJson(data);
    List<BookEntity> books = bookModel.items!;
    //cache data to local data base
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks(
      {required String category, int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&relevance=$category&q=subject:Programming&startIndex=${pageNumber * 10}');
    BookModel bookModel = BookModel.fromJson(data);
    List<BookEntity> books = bookModel.items!;
    return books;
  }
}
