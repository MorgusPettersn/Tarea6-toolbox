import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaisUniversidades extends StatefulWidget {
  @override
  _PaisUniversidadesState createState() => _PaisUniversidadesState();
}

class _PaisUniversidadesState extends State<PaisUniversidades> {
  final _controller = TextEditingController();
  List<dynamic> _universidades = [];

  Future<void> _buscarUniversidades() async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=${_controller.text}'));
    if (response.statusCode == 200) {
      setState(() {
        _universidades = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Universidades por País')),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Ingrese un país en inglés'),
          ),
          ElevatedButton(
            child: Text('Buscar'),
            onPressed: _buscarUniversidades,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _universidades.length,
              itemBuilder: (context, index) {
                final uni = _universidades[index];
                return ListTile(
                  title: Text(uni['name']),
                  subtitle: Text(uni['domains'].join(', ')),
                  trailing: IconButton(
                    icon: Icon(Icons.language),
                    onPressed: () {
                      // Abre la página web de la universidad
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}