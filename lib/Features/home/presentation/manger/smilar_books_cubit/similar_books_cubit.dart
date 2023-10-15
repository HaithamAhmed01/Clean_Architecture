import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetchSimilarBooks_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({
    required String category,
    int pageNumber = 0,
  }) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksPaginationLoading());
    }

    var result = await fetchSimilarBooksUseCase.call(
      category,
      pageNumber,
    );
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(SimilarBooksFailure(failure.message));
        } else {
          emit(SimilarBooksPaginationFailure(failure.message));
        }
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
