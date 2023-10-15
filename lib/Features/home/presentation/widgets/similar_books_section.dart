import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/widgets/similar_books_list_view.dart';
import 'package:bookly/Features/home/presentation/widgets/similar_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.books});
  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListviewBlocBuilder(),
      ],
    );
  }
}
