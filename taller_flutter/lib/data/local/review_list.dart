import 'package:taller_flutter/uiModels/Review.dart';

final List<Review> reviewList = [
  Review(
    id: 1,
    name: 'Juan Pérez',
    placeName: 'Bar La Esquina',
    reviewText: 'Excelente ambiente y atención.',
    placeImage: 'https://firebasestorage.googleapis.com/v0/b/nocta-95b8c.firebasestorage.app/o/GastroBares%2Fgastrobarimg6.jpg?alt=media&token=7d3b50b1-7361-495c-8bab-e9020490b6c8',
    gastroBarId: '1', // 👈 ID del Bar La Esquina
  ),
  Review(
    id: 2,
    name: 'María López',
    placeName: 'Café Central',
    reviewText: 'Los cocteles estaban increíbles!',
    placeImage: 'https://firebasestorage.googleapis.com/v0/b/nocta-95b8c.firebasestorage.app/o/GastroBares%2Fgastrobarimg10.jpg?alt=media&token=623af3de-5fc7-4fac-b3a6-8a385290171d',
    gastroBarId: '2', // 👈 ID del Café Central
  ),
  Review(
    id: 3,
    name: 'Carlos Díaz',
    placeName: 'Bar La Esquina',
    reviewText: 'Buen lugar, aunque algo costoso.',
    placeImage: 'https://firebasestorage.googleapis.com/v0/b/nocta-95b8c.firebasestorage.app/o/GastroBares%2Fgastrobarimg3.jpg?alt=media&token=76b61f04-1fbb-490f-aaf5-6ebe4336ca8c',
    gastroBarId: '1', // 👈 También de Bar La Esquina
  ),
];
