import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/save_books.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=programming&Sorting=relevance&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = parsingData(data);
    saveBooksData(kFeaturedBox, books);
    return books;
  }

  List<BookEntity> parsingData(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookItem in data['items']) {
      books.add(BookModel.fromJson(bookItem));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming&Sorting=newest&startIndex=${pageNumber * 10}',
    );

    // if (data['items'] == null || !(data['items']) is List || data['items'].isEmpty) {
    //   throw Exception('No Books found in API response');
    // }
    List<BookEntity> books = parsingData(data);
    saveBooksData(kNewestBox, books);
    return books;
  }
}
