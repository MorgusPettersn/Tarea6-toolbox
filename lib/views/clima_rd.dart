import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClimaRD extends StatefulWidget {
  @override
  _ClimaRDState createState() => _ClimaRDState();
}

class _ClimaRDState extends State<ClimaRD> {
  Map<String, dynamic> _clima = {};

  @override
  void initState() {
    super.initState();
    _obtenerClima();
  }

  Future<void> _obtenerClima() async {
    
    final apiKey = 'TU_API_KEY';
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Santo Domingo,DO&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      setState(() {
        _clima = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clima en RD')),
      body: Center(
        child: _clima.isEmpty
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Temperatura: ${_clima['main']['temp']}°C'),
                  Text('Descripción: ${_clima['weather'][0]['description']}'),
                ],
              ),
      ),
    );
  }
}