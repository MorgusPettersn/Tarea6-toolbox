import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToolBox App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/toolbox.png'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Predecir Género'),
              onPressed: () => Navigator.pushNamed(context, '/nombre_genero'),
            ),
            ElevatedButton(
              child: Text('Predecir Edad'),
              onPressed: () => Navigator.pushNamed(context, '/nombre_edad'),
            ),
            
          ],
        ),
      ),
    );
  }
}