
import 'package:taller_flutter/uiModels/GastroBar.dart';

final List<GastroBar> gastroBarList = [
  GastroBar(
    id: '1',
    name: 'Bar La Esquina',
    imagePlace: 'https://firebasestorage.googleapis.com/v0/b/nocta-95b8c.firebasestorage.app/o/GastroBares%2Fgastrobarimg6.jpg?alt=media&token=7d3b50b1-7361-495c-8bab-e9020490b6c8',
    rating: 4.5,
    reviewCount: 27,
    address: 'Calle 123 #45-67, Bogotá',
    hours: 'Lunes a sábado, 5:00 pm - 2:00 am',
    cuisine: 'Cocteles, tapas y música en vivo',
    description:
        'Bar La Esquina ofrece un ambiente acogedor con buena música, cocteles de autor y una excelente selección de tapas para compartir.',
  ),
  GastroBar(
    id: '2',
    name: 'Café Central',
    imagePlace: 'https://firebasestorage.googleapis.com/v0/b/nocta-95b8c.firebasestorage.app/o/GastroBares%2Fgastrobarimg10.jpg?alt=media&token=623af3de-5fc7-4fac-b3a6-8a385290171d',
    rating: 4.2,
    reviewCount: 15,
    address: 'Cra 7 #20-15, Bogotá',
    hours: 'Todos los días, 8:00 am - 10:00 pm',
    cuisine: 'Cafetería, repostería y brunch',
    description:
        'Café Central es ideal para trabajar, estudiar o pasar el rato con amigos. Cuenta con excelente café, repostería artesanal y opciones de brunch.',
  ),
];
