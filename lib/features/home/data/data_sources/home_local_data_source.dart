import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int startIndex = pageNumber*10;
    int endIndex = (pageNumber+1)*10;
    int length = box.length;
    if (startIndex >= length || endIndex > length) return [];
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kNewestBox);
    int startIndex = pageNumber*10;
    int endIndex = (pageNumber+1)*10;
    int length = box.length;
    if (startIndex >= length || endIndex > length) return [];
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
