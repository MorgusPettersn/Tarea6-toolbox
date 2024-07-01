import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class MITNews extends StatefulWidget {
  @override
  _MITNewsState createState() => _MITNewsState();
}

class _MITNewsState extends State<MITNews> {
  List<Map<String, String>> _noticias = [];

  @override
  void initState() {
    super.initState();
    _obtenerNoticias();
  }

  Future<void> _obtenerNoticias() async {
    final response = await http.get(Uri.parse('https://news.mit.edu/rss/feed'));
    if (response.statusCode == 200) {
      final document = xml.XmlDocument.parse(response.body);
      final items = document.findAllElements('item');

      setState(() {
        _noticias = items.take(3).map((item) {
          return {
            'title': item.findElements('title').first.text,
            'description': item.findElements('description').first.text,
            'link': item.findElements('link').first.text,
          };
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias de MIT'),
      ),
      body: ListView.builder(
        itemCount: _noticias.length,
        itemBuilder: (context, index) {
          final noticia = _noticias[index];
          return ListTile(
            title: Text(noticia['title'] ?? ''),
            subtitle: Text(noticia['description'] ?? ''),
            onTap: () {
              if (noticia['link'] != null) {
                _abrirEnlace(noticia['link']!);
              }
            },
          );
        },
      ),
    );
  }

  void _abrirEnlace(String url) {
    // Código para abrir el enlace en el navegador
  }
}
