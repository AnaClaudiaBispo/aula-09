import 'package:flutter/material.dart';

void main() {
  runApp(IMCCalculator());
}

class IMCCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      home: IMCCalculatorHome(),
    );
  }
}

class IMCCalculatorHome extends StatefulWidget {
  @override
  _IMCCalculatorHomeState createState() => _IMCCalculatorHomeState();
}

class _IMCCalculatorHomeState extends State<IMCCalculatorHome> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = '';

  void _calculateIMC() {
    if (_formKey.currentState!.validate()) {
      double weight = double.parse(_weightController.text);
      double height =
          double.parse(_heightController.text) / 100; // altura em metros
      double imc = weight / (height * height);
      setState(() {
        _result = 'Seu IMC é: ${imc.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _weightController,
                decoration: InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o peso.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _heightController,
                decoration: InputDecoration(labelText: 'Altura (cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a altura.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateIMC,
                child: Text('Calcular IMC'),
              ),
              SizedBox(height: 20),
              Text(
                _result,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
