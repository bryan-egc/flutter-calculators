import 'package:flutter/material.dart';

class Componentes extends StatelessWidget {
  final color;
  final colorTexto;
  final String botonTexto;
  final pressBoton;

  const Componentes(
      {this.color, this.colorTexto, required this.botonTexto, this.pressBoton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressBoton,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                botonTexto,
                style: TextStyle(color: colorTexto),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
