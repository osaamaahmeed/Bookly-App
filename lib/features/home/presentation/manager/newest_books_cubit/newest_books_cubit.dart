import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaggingLoading([]));
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailure(failure.errMessage));
      } else {
        emit(NewestBooksPaggingFailure(failure.errMessage));
      }
    }, (books) {
      if (state is NewestBooksSuccess && pageNumber != 0) {
        final currentBooks = (state as NewestBooksSuccess).books;
        emit(NewestBooksSuccess([...currentBooks, ...books]));
      } else if (state is NewestBooksPaggingLoading && pageNumber != 0) {
        final currBooks = (state as NewestBooksPaggingLoading).books;
        emit(NewestBooksSuccess([...currBooks, ...books])); 
      } else {
        emit(NewestBooksSuccess(books));
      }
    });
  }
}
