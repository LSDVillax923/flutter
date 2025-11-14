import 'package:taller_flutter/uiModels/Review.dart';

class BarReviewsState {
  final List<Review> reviews;

  BarReviewsState({this.reviews = const []});

  BarReviewsState copyWith({List<Review>? reviews}) =>
    BarReviewsState(
      reviews: reviews ?? this.reviews,
    );
  
}