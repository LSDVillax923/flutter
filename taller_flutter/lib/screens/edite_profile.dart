import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 110, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen de perfil
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/149/149071.png",
              ),
              backgroundColor: Colors.grey,
            ),

            const SizedBox(height: 8),

            // Botón cambiar foto
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text(
                "Cambiar foto",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Campos de texto
            const TextField(
              decoration: InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            const TextField(
              decoration: InputDecoration(
                labelText: "Usuario",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            const TextField(
              decoration: InputDecoration(
                labelText: "Fecha de nacimiento",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            // Botón guardar
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  "Guardar cambios",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
