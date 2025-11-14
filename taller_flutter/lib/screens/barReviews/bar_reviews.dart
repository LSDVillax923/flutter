import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taller_flutter/screens/barReviews/bloc/bar_reviews_bloc.dart';
import 'package:taller_flutter/screens/barReviews/bloc/bar_reviews_state.dart';
import 'package:taller_flutter/screens/barReviews/bloc/bar_reviews_event.dart';
import 'package:taller_flutter/uiModels/Review.dart';

class BarReviews extends StatefulWidget {
  const BarReviews({super.key});

  @override
  State<BarReviews> createState() => _BarReviewsState();
}

class _BarReviewsState extends State<BarReviews> {
  late final BarReviewsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BarReviewsBloc();
    _bloc.add(LoadBarReviews('all')); 
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<BarReviewsBloc, BarReviewsState>(
        builder: (context, state) {
          final List<Review> reviews = state.reviews;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Reseñas'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: reviews.isEmpty
                  ? const Center(
                      child: Text(
                        'Aún no hay reseñas registradas',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.separated(
                      itemCount: reviews.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        return GestureDetector(
                          onTap: () {
                            context.push('/bar_detail/${review.gastroBarId}');
                          },
                          child: ReviewCard(review: review),
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}


/// Widget que muestra la información de una Review
class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del lugar
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              review.placeImage,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return SizedBox(
                  height: 160,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 160,
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Nombre del usuario
          Text(
            review.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 4),

          // Nombre del lugar
          Text(
            review.placeName,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 8),

          // Texto de la reseña
          Text(
            review.reviewText,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
