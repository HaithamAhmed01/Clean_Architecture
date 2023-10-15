import 'package:bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/smilar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/widgets/featured_list_view.dart';
import 'package:bookly/Features/home/presentation/widgets/similar_books_list_view.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListviewBlocBuilder extends StatefulWidget {
  const SimilarBooksListviewBlocBuilder({Key? key}) : super(key: key);

  @override
  State<SimilarBooksListviewBlocBuilder> createState() =>
      _SimilarBooksListviewBlocBuilderState();
}

class _SimilarBooksListviewBlocBuilderState
    extends State<SimilarBooksListviewBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBooksListview(
            books: state.books,
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
