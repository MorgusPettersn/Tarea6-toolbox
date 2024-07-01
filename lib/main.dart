import 'package:flutter/material.dart';
import 'views/wordpress_noticias.dart';  // Asegúrate de importar la nueva vista

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Toolbox RD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/mit-news': (context) => MITNews(),
        // Otras rutas aquí
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Toolbox RD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mit-news');
              },
              child: Text('Noticias de MIT'),
            ),
            // Otros botones aquí
          ],
        ),
      ),
    );
  }
}
