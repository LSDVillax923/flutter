abstract class BarReviewsEvent {}

class LoadBarReviews extends BarReviewsEvent {
  final String barId;

  LoadBarReviews(this.barId);
}