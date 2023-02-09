import 'package:flutter/material.dart';
import 'componentes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculadora || Segundo Parcial",
      home: new HomePage(),
    );
  }
}
