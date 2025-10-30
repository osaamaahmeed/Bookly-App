part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();
  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksPaggingLoading extends NewestBooksState {
  final List<BookEntity> books;
  const NewestBooksPaggingLoading(this.books);

  @override
  List<Object> get props => [books];
}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;
  const NewestBooksSuccess(this.books);
}

final class NewestBooksPaggingSuccess extends NewestBooksState {
  final List<BookEntity> books;
  const NewestBooksPaggingSuccess(this.books);
}

final class NewestBooksPaggingFailure extends NewestBooksState {
  final String errMessage;
  const NewestBooksPaggingFailure(this.errMessage);
}

final class NewestBooksFailure extends NewestBooksState {
  final String errMessage;
  const NewestBooksFailure(this.errMessage);
}