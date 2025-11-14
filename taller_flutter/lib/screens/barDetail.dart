// lib/ui/detail_gastrobar_screen.dart
import 'package:flutter/material.dart';
import 'package:taller_flutter/data/local/gastroBar_list.dart' as data;
import 'package:taller_flutter/uiModels/GastroBar.dart';
import 'package:taller_flutter/screens/barReviews/bar_reviews.dart';

class DetailGastroBarScreen extends StatefulWidget {
  final String gastroBarId;

  const DetailGastroBarScreen({
    super.key,
    required this.gastroBarId,
  });

  @override
  State<DetailGastroBarScreen> createState() => _DetailGastroBarScreenState();
}

class _DetailGastroBarScreenState extends State<DetailGastroBarScreen> {
  GastroBar? gastroBar;

  @override
  void initState() {
    super.initState();
    _loadGastroBar();
  }

  void _loadGastroBar() {
    final matching =
        data.gastroBarList.where((g) => g.id == widget.gastroBarId);

    setState(() {
      gastroBar = matching.isNotEmpty ? matching.first : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bar = gastroBar;

    if (bar == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detalle gastrobar'),
        ),
        body: const Center(
          child: Text('GastroBar no encontrado'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(bar.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeaderImage(imageUrl: bar.imagePlace),
            _PlaceInfoSection(gastroBar: bar),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Botón "Calificar y escribir reseña"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: abrir formulario de reseña
                      },
                      child: const Text('Calificar y escribir reseña'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Botón "Ver reseñas"
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // Navegar a la pantalla de reseñas
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BarReviews(),
                          ),
                        );
                      },
                      child: const Text('Ver reseñas'),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// HEADER IMAGE
// -----------------------------------------------------------------------------
class _HeaderImage extends StatelessWidget {
  final String imageUrl;

  const _HeaderImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: Image.network(
        imageUrl,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
        // Loading
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: 250,
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
        // Error
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
            height: 250,
            child: Center(
              child: Icon(
                Icons.broken_image,
                size: 48,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// INFO PRINCIPAL DEL LUGAR
// -----------------------------------------------------------------------------
class _PlaceInfoSection extends StatelessWidget {
  final GastroBar gastroBar;

  const _PlaceInfoSection({required this.gastroBar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nombre
          Text(
            gastroBar.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
          ),
          const SizedBox(height: 8),
          // Rating + número de reseñas
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _StarRating(rating: gastroBar.rating),
              const SizedBox(width: 8),
              Text(
                '${gastroBar.rating.toStringAsFixed(1)} '
                '(${gastroBar.reviewCount} reseñas)',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Info: ubicación, horario, tipo
          _InfoRow(
            icon: Icons.location_on,
            text: gastroBar.address,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.schedule,
            text: gastroBar.hours,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.lightbulb,
            text: gastroBar.cuisine,
          ),
          const SizedBox(height: 16),
          // Descripción
          Text(
            gastroBar.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// COMPONENTE: FILA DE INFO CON ICONO
// -----------------------------------------------------------------------------
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// COMPONENTE: RATING CON ESTRELLAS
// -----------------------------------------------------------------------------
class _StarRating extends StatelessWidget {
  final double rating; // 0.0 - 5.0

  const _StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    const totalStars = 5;
    final filledStars = rating.floor();
    final hasHalfStar = (rating - filledStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalStars, (index) {
        if (index < filledStars) {
          return const Icon(Icons.star, size: 18, color: Colors.amber);
        } else if (index == filledStars && hasHalfStar) {
          return const Icon(Icons.star_half, size: 18, color: Colors.amber);
        } else {
          return const Icon(Icons.star_border, size: 18, color: Colors.amber);
        }
      }),
    );
  }
}
