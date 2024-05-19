import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const Labels(
      {required this.titulo, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.titulo,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontWeight: FontWeight.w300)),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          child: Text(
            this.subtitulo,
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          
        )
      ],
    );
  }
}