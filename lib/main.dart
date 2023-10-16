import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Children',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Children'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/child.png'),
            ElevatedButton(
              child: const Text('Siguiente'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isMale = false;
  bool isFemale = false;
  bool enMeses = false;
  bool enAnos = false;
  int edad = 0;
  double estatura = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Datos Personales"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text("Sexo:"),
                  Checkbox(
                    value: isMale,
                    onChanged: (value) {
                      setState(() {
                        isMale = value!;
                        if (isMale) {
                          isFemale = false;
                        }
                      });
                    },
                  ),
                  const Text("Masculino"),
                  Checkbox(
                    value: isFemale,
                    onChanged: (value) {
                      setState(() {
                        isFemale = value!;
                        if (isFemale) {
                          isMale = false;
                        }
                      });
                    },
                  ),
                  const Text("Femenino"),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Edad: "),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          edad = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                  Text("en"),
                  Checkbox(
                    value: enMeses,
                    onChanged: (value) {
                      setState(() {
                        enMeses = value!;
                        if (enMeses) {
                          enAnos = false;
                        }
                      });
                    },
                  ),
                  Text("meses"),
                  Checkbox(
                    value: enAnos,
                    onChanged: (value) {
                      setState(() {
                        enAnos = value!;
                        if (enAnos) {
                          enMeses = false;
                        }
                      });
                    },
                  ),
                  const Text("años"),
                ],
              ),
              Row(
                children: <Widget>[
                  const Text("Estatura (cm): "),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          estatura = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Puedes utilizar los valores de isMale, isFemale, edad y estatura como desees.
                  // Por ejemplo, puedes imprimirlos en la consola.
                  if (kDebugMode) {
                    print(
                        "Sexo: ${isMale ? 'Masculino' : isFemale ? 'Femenino' : 'No seleccionado'}");
                  }
                  if (kDebugMode) {
                    print("Edad: $edad");
                  }
                  if (kDebugMode) {
                    print("Estatura: $estatura cm");
                  }
                  // Luego, puedes volver a la pantalla anterior si lo deseas.
                  Navigator.pop(context);
                },
                child: const Text('Guardar Datos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
