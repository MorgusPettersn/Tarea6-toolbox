import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NombreEdad extends StatefulWidget {
  @override
  _NombreEdadState createState() => _NombreEdadState();
}

class _NombreEdadState extends State<NombreEdad> {
  final _controller = TextEditingController();
  int _edad = 0;
  String _categoria = '';

  Future<void> _predecirEdad() async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=${_controller.text}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _edad = data['age'];
        if (_edad < 30) _categoria = 'joven';
        else if (_edad < 60) _categoria = 'adulto';
        else _categoria = 'anciano';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Predecir Edad')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ingrese un nombre'),
            ),
            ElevatedButton(
              child: Text('Predecir'),
              onPressed: _predecirEdad,
            ),
            Text('Edad: $_edad'),
            Text('Categoría: $_categoria'),
            Image.asset('assets/images/$_categoria.png'),
          ],
        ),
      ),
    );
  }
}