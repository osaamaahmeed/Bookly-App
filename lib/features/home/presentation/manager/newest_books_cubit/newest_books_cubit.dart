// import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
// import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'newest_books_state.dart';

// class NewestBooksCubit extends Cubit<NewestBooksState> {
//   NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
//   final FetchNewestBooksUseCase fetchNewestBooksUseCase;

//   Future<void> fetchNewestBooks({int pageNumber = 0}) async {
//     if (pageNumber == 0) {
//       emit(NewestBooksLoading());
//     } else {
//       emit(NewestBooksPaggingLoading([]));
//     }
//     var result = await fetchNewestBooksUseCase.call(pageNumber);
//     result.fold(
//       (failure) {
//         if (pageNumber == 0) {
//           emit(NewestBooksFailure(failure.errMessage));
//         } else {
//           emit(NewestBooksPaggingFailure(failure.errMessage));
//         }
//       },
//       (books) {
//         if (state is NewestBooksSuccess && pageNumber != 0) {
//           final currentBooks = (state as NewestBooksSuccess).books;
//           emit(NewestBooksSuccess([...currentBooks, ...books]));
//         } else if (state is NewestBooksPaggingLoading && pageNumber != 0) {
//           final currBooks = (state as NewestBooksPaggingLoading).books;
//           emit(NewestBooksSuccess([...currBooks, ...books]));
//         } else {
//           emit(NewestBooksSuccess(books));
//         }
//       },
//     );
//   }
// }

import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  List<BookEntity> allBooks = [];
  bool isMax = false;
  int currentPage = 0;

  /*
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaggingLoading([]));
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewestBooksFailure(failure.errMessage));
        } else {
          emit(NewestBooksPaggingFailure(failure.errMessage));
        }
      },
      (books) {
        if (state is NewestBooksSuccess && pageNumber != 0) {
          final currentBooks = (state as NewestBooksSuccess).books;
          emit(NewestBooksSuccess([...currentBooks, ...books]));
        } else if (state is NewestBooksPaggingLoading && pageNumber != 0) {
          final currBooks = (state as NewestBooksPaggingLoading).books;
          emit(NewestBooksSuccess([...currBooks, ...books]));
        } else {
          emit(NewestBooksSuccess(books));
        }
      },
    );
  }
  */

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (isMax) return;
    if (state is NewestBooksLoading || state is NewestBooksPaggingLoading) return;

    try {
      if (pageNumber == 0) {
        emit(NewestBooksLoading());
        allBooks = [];
        currentPage = 0;
        isMax = false;
      } else {
        emit(NewestBooksPaggingLoading(allBooks));
      }

      final result = await fetchNewestBooksUseCase.call(pageNumber);

      result.fold(
        (failure) {
          if (pageNumber == 0) {
            emit(NewestBooksFailure(failure.errMessage));
          } else {
            emit(NewestBooksPaggingFailure(failure.errMessage)); // -> show snak bar with the current books
          }
        },
        (newBooks) {
          if (newBooks.isEmpty) {
            isMax = true;
            emit(NewestBooksSuccess(allBooks));
          } else {
            allBooks.addAll(newBooks);
            currentPage = pageNumber;

            emit(NewestBooksSuccess(allBooks));
          }
        },
      );
    } catch (e) {
      if (pageNumber == 0) {
        emit(NewestBooksFailure(e.toString()));
      } else {
        emit(NewestBooksPaggingFailure(e.toString()));
      }
    }
  }

}