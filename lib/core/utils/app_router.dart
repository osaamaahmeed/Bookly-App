import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/search_view.dart';
import 'package:bookly_app/features/splash/presentation/view_model/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetialsView = '/bookDetialsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: '/homeView', builder: (context, state) => const HomeView()),
      GoRoute(
        path: '/bookDetialsView',
        builder: (context, state) => BlocProvider(
          create: (context) {
            final cubit = NewestBooksCubit(getIt.get<FetchNewestBooksUseCase>());
            cubit.fetchNewestBooksUseCase();
            return cubit;
          },
          child: BookDetailsView(book: state.extra as BookEntity),
        ),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
