import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({super.key});

  @override
  State<StatefulWidget> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  String _type = "";

  bool _flag = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _type = ModalRoute.of(context)?.settings.arguments as String;
    print(_type);
    return Scaffold(
      appBar: AppBar(
        title: Text(_type),
      ),
      body: _animationWidget,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _flag = !_flag;
          });
        },
        child: const Icon(Icons.start),
      ),
    );
  }

  Widget get _animationWidget {
    switch (_type) {
      case 'AnimatedContainer':
        return _animatedContainer;
      case 'AnimatedOpacity':
        return _animatedOpacity;
      case 'AnimatedPositioned':
        return _animatedPositioned;
      case 'AnimatedPadding':
        return _animatedPadding;
      case 'AnimatedAlign':
        return _animatedAlign;
      case 'AnimatedDefaultTextStyle':
        return _animatedDefaultTextStyle;
      default:
        return Container();
    }
  }

  Widget get _animatedContainer {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
        borderRadius:
            _flag ? BorderRadius.circular(100) : BorderRadius.circular(0),
        color: _flag ? Colors.red : Colors.blue,
      ),
      width: _flag ? 200 : 300,
      height: _flag ? 200 : 300,
      transform: _flag ? Matrix4.rotationZ(0.25) : Matrix4.rotationZ(0),
      alignment: _flag ? Alignment.center : Alignment.topLeft,
      // 文字大小不是AnimatedContainer的属性 所以改变不会有动画
      child: Text(
        "这是文字内容",
        style: TextStyle(fontSize: _flag ? 16 : 72),
      ),
    );
  }

  Widget get _animatedOpacity {
    return AnimatedOpacity(
      opacity: _flag ? 0 : 1,
      duration: const Duration(seconds: 1),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }

  Widget get _animatedPositioned {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        ),
        AnimatedPositioned(
          duration: const Duration(seconds: 1),
          left: _flag ? 100 : 0,
          top: _flag ? 100 : 0,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        )
      ],
    );
  }

  Widget get _animatedPadding {
    return AnimatedPadding(
      duration: const Duration(seconds: 1),
      padding: _flag ? EdgeInsets.all(100) : EdgeInsets.all(0),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }

  Widget get _animatedAlign {
    return AnimatedAlign(
      duration: const Duration(seconds: 1),
      alignment: _flag ? Alignment.center : Alignment.topLeft,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
        child: Text("文字内容"),
      ),
    );
  }

  Widget get _animatedDefaultTextStyle {
    return AnimatedDefaultTextStyle(
      duration: const Duration(seconds: 1),
      style: _flag
          ? TextStyle(fontSize: 72, color: Colors.red)
          : TextStyle(fontSize: 16, color: Colors.blue),
      child: Text("文字内容"),
    );
  }
}
