import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NombreGenero extends StatefulWidget {
  @override
  _NombreGeneroState createState() => _NombreGeneroState();
}

class _NombreGeneroState extends State<NombreGenero> {
  final _controller = TextEditingController();
  String _genero = '';

  Future<void> _predecirGenero() async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=${_controller.text}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _genero = data['gender'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Predecir Género')),
      body: Container(
        color: _genero == 'male' ? Colors.blue : Colors.pink,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Ingrese un nombre'),
              ),
              ElevatedButton(
                child: Text('Predecir'),
                onPressed: _predecirGenero,
              ),
              Text('Género: $_genero'),
            ],
          ),
        ),
      ),
    );
  }
}