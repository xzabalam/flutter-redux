import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter demo',
    theme: ThemeData(primarySwatch: Colors.blue),
    debugShowCheckedModeBanner: false,
    home: const SecondPage(),
  ));
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: const Center(
        child: Text('Flutter Redux app'),
      ),
    );
  }
}
