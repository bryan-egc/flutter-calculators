import 'package:calculadora2parcial2/componentes.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora || Segundo Parcial",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var usuarioPregunta = '';
  var usuarioRespuesta = '0';
  final miEstiloTexto = TextStyle(fontSize: 1, color: Colors.grey[900]);
  final List<String> componentes = [
    'C',
    '<-',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: const Text("Segundo Parcial | Programación III"),
        actions: <Widget>[
          Image.asset(
            'assets/1.png',
            height: 10,
          ),
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[400],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    usuarioPregunta,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    usuarioRespuesta,
                    style: TextStyle(fontSize: 50),
                  ),
                )
              ],
            )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: GridView.builder(
                  itemCount: componentes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Componentes(
                        pressBoton: () {
                          setState(() {
                            usuarioPregunta = '';
                            usuarioRespuesta = '0';
                          });
                        },
                        botonTexto: componentes[index],
                        color: Colors.green,
                        colorTexto: Colors.white,
                      );
                    } else if (index == 1) {
                      return Componentes(
                        pressBoton: () {
                          setState(() {
                            usuarioPregunta = usuarioPregunta.substring(
                                0, usuarioPregunta.length - 1);
                          });
                        },
                        botonTexto: componentes[index],
                        color: Colors.blue,
                        colorTexto: Colors.white,
                      );
                    } else if (index == componentes.length - 1) {
                      return Componentes(
                        pressBoton: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        botonTexto: componentes[index],
                        color: Colors.blue,
                        colorTexto: Colors.white,
                      );
                    } else {
                      return Componentes(
                        pressBoton: () {
                          setState(() {
                            usuarioPregunta += componentes[index];
                          });
                        },
                        botonTexto: componentes[index],
                        color: isOperadores(componentes[index])
                            ? Colors.grey[900]
                            : Colors.grey[800],
                        colorTexto: isOperadores(componentes[index])
                            ? Colors.white
                            : Colors.grey,
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperadores(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String preguntaFinal = usuarioPregunta;
    preguntaFinal = preguntaFinal.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(preguntaFinal);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    usuarioRespuesta = eval.toString();
  }
}
