import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taller_flutter/data/local/review_list.dart';
import 'package:taller_flutter/screens/barReviews/bloc/bar_reviews_event.dart';
import 'package:taller_flutter/screens/barReviews/bloc/bar_reviews_state.dart';

class BarReviewsBloc extends Bloc<BarReviewsEvent,BarReviewsState> {
  BarReviewsBloc() : super(BarReviewsState()) {
    on<LoadBarReviews>((event, emit) {
      emit(state.copyWith(reviews: reviewList));
  });
  }
}