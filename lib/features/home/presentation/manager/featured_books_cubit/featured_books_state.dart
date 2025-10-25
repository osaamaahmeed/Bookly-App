part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksPaginationLoading extends FeaturedBooksState {}


final class FeaturedBooksPaginationFailure extends FeaturedBooksState {
    final String errMessage;
  const FeaturedBooksPaginationFailure(this.errMessage);
}


final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;
  const FeaturedBooksSuccess(this.books);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;
  const FeaturedBooksFailure(this.errMessage);
}
