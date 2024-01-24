
import 'package:flutter/material.dart';

import 'explicit_animation_page.dart';


class ExplicitPage extends StatefulWidget {

  const ExplicitPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExplicitPageState();
}

class _ExplicitPageState extends State<ExplicitPage> {

  final List<String> _list = [
    'FadeTransition',
    'RotationTransition',
    'ScaleTransition',
    'SlideTransition',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("显式动画"),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_list[index]),
            onTap: () => _onTap(index),
          );
        },
      ),
    );
  }

  Route _createPage(int index) {
    return MaterialPageRoute(
      builder: (_) => const ExplicitAnimationPage(),
      settings: RouteSettings(
        arguments: _list[index],
      ),
    );
  }

  void _onTap(int index) {
    Navigator.push(context, _createPage(index));
  }
}