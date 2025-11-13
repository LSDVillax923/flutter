import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 110, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo: Nombre del lugar
            const Text(
              "Nombre del lugar",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Escribe el nombre del lugar",
              ),
            ),

            const SizedBox(height: 20),

            // Calificar
            const Text(
              "Calificar",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star_border,
                  size: 32,
                  color: Colors.amber,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Imagen del lugar
            const Text(
              "Foto del lugar",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  if (i == 0) {
                    return Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Center(
                        child: Text("+", style: TextStyle(fontSize: 24)),
                      ),
                    );
                  } else {
                    return Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://via.placeholder.com/150",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),

            const SizedBox(height: 20),

            // Campo reseña
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Escribe tu reseña",
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 20),

            // Etiquetas
            const Text(
              "Etiquetas",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                _buildTag("Cocteles"),
                _buildTag("Ambiente"),
                _buildTag("Servicio"),
                _buildTag("Precio"),
              ],
            ),

            const SizedBox(height: 30),

            // Botón principal
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Publicar reseña",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}
