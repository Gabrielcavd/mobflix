import 'package:flutter/material.dart';

class registrationScreen extends StatelessWidget {
  const registrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cadastre um vídeo',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 8),
              child: Text(
                'URL:',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueAccent,),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  //filled: true,
                  //fillColor: Colors.blueAccent,
                  //border: OutlineInputBorder(),
                  labelText: '  Ex: Kod3h2g_dIg',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 8),
              child: Text(
                'Categoria:',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueAccent,),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  //filled: true,
                  //fillColor: Colors.blueAccent,
                  //border: OutlineInputBorder(),
                  labelText: '  Ação, Terror...',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Preview',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  print('oi');
                },
                child: Text('Cadastrar Video'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
