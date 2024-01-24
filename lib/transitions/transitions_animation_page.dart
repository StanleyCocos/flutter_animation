import 'package:flutter/material.dart';

class TransitionsAnimationPage extends StatefulWidget {
  const TransitionsAnimationPage({Key? key}) : super(key: key);

  @override
  State<TransitionsAnimationPage> createState() =>
      _TransitionsAnimationPageState();
}

class _TransitionsAnimationPageState extends State<TransitionsAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由动画'),
      ),
      body: const Center(
        child: Text(
          "这是过滤动画的着陆页",
          style:  TextStyle(
            fontSize: 32,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
