import 'package:flutter/material.dart';

class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage>
    with SingleTickerProviderStateMixin {
  String _type = "";
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.3,
      upperBound: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    _type = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(_type),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          _animationWidget,
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _controller.repeat(reverse: true);
                  },
                  child: const Text('Repeat')),
              ElevatedButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: const Text('Forward')),
              ElevatedButton(
                  onPressed: () {
                    _controller.reverse();
                  },
                  child: const Text('Reverse')),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _animationWidget {
    switch (_type) {
      case 'FadeTransition':
        return _fadeTransition;
      case 'RotationTransition':
        return _rotationTransition;
      case 'ScaleTransition':
        return _scaleTransition;
      case 'SlideTransition':
        return _slideTransition;
      default:
        return Container();
    }
  }

  Widget get _fadeTransition {
    return FadeTransition(
      opacity: _controller,
      child: const FlutterLogo(
        size: 120,
      ),
    );
  }

  Widget get _rotationTransition {
    return RotationTransition(
      turns: _controller,
      child: const FlutterLogo(
        size: 60,
      ),
    );
  }

  Widget get _scaleTransition {
    return ScaleTransition(
      scale: _controller,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }

  Widget get _slideTransition {
    return SlideTransition(  //Tween配置运动的参数
      position: _controller.drive(Tween(begin: const Offset(0,0),end: const Offset(0.5,0.5))),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
