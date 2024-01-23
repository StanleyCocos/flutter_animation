import 'package:flutter/material.dart';

import 'implicit_animation_page.dart';

class ImplicitPage extends StatefulWidget {
  const ImplicitPage({Key? key}) : super(key: key);

  @override
  State<ImplicitPage> createState() => _ImplicitPageState();
}

class _ImplicitPageState extends State<ImplicitPage> {
  final List<String> _list = [
    'AnimatedContainer',
    'AnimatedOpacity',
    'AnimatedPositioned',
    'AnimatedPadding',
    'AnimatedAlign',
    'AnimatedDefaultTextStyle',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("隐式动画"),
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
      builder: (_) => const ImplicitAnimationPage(),
      settings: RouteSettings(
        arguments: _list[index],
      ),
    );
  }

  void _onTap(int index) {
    Navigator.push(context, _createPage(index));
  }
}
