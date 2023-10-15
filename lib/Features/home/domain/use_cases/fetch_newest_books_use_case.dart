import 'package:bookly/Features/home/domain/repo/home_repo.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../entities/book_entity.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.fetchNewestBooks(
      pageNumber: param,
    );
  }
}
