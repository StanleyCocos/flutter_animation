import 'package:flutter/material.dart';
import 'package:flutter_animation/explicit/explicit_page.dart';

import 'implicit/implicit_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Animation Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _list = [
    '隐式动画',
    '显示动画',
    '过渡动画',
    '手势动画',
    '自定义动画',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_list[index]),
            onTap: ()=> _onTap(index),
          );
        },
      ),
    );
  }


  Route _createPage(int index) {
    Widget page;
    switch(index){
      case 0:
        page = const ImplicitPage();
        break;
      default:
        page = const ExplicitPage();
        break;
    }
    return MaterialPageRoute(builder: (_) => page);
  }

  void _onTap(int index){
    Navigator.push(context, _createPage(index));
  }
}

