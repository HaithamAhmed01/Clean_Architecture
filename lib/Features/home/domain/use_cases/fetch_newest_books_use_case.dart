import 'package:bookly/Features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../entities/book_entity.dart';

class FetchNewestBooksUseCase {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() {
    return homeRepo.fetchNewestBooks();
  }
}
