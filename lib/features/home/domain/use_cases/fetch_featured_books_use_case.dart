import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

// this use case is currenlty useless but will be helpful in the future
// param here is something like auth or the user permission
// but here we don't need param so we will make it optional & also create a class called noParam instead of leaving it empty or putting void

class FetchFeaturedBooksUseCase extends Usecase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
}
