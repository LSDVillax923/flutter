import 'package:flutter/material.dart';

class BarReviews extends StatelessWidget {
  final String gastroBarName;

  const BarReviews({super.key, required this.gastroBarName});

  @override
  Widget build(BuildContext context) {
    // Simulación visual de reseñas (en lugar de ViewModel)
    final List<Map<String, String>> reviews = [
      {
        'id': '1',
        'user': 'Juan Pérez',
        'comment': 'Excelente ambiente y atención.',
      },
      {
        'id': '2',
        'user': 'María López',
        'comment': 'Los cocteles estaban increíbles!',
      },
      {
        'id': '3',
        'user': 'Carlos Díaz',
        'comment': 'Buen lugar, aunque algo costoso.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(gastroBarName),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: reviews.isEmpty
            ? const Center(
                child: Text(
                  'Aún no hay reseñas para este lugar',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : ListView.separated(
                itemCount: reviews.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return ReviewCard(
                    user: review['user']!,
                    comment: review['comment']!,
                  );
                },
              ),
      ),
    );
  }
}

/// Widget que simula el ReviewCard de Compose
class ReviewCard extends StatelessWidget {
  final String user;
  final String comment;

  const ReviewCard({super.key, required this.user, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            comment,
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}
