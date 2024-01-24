import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../explicit/explicit_animation_page.dart';
import 'animation_popup_route.dart';
import 'animation_route.dart';
import 'transitions_animation_page.dart';

class TransitionsPage extends StatefulWidget {
  const TransitionsPage({Key? key}) : super(key: key);

  @override
  State<TransitionsPage> createState() => _TransitionsPageState();
}

class _TransitionsPageState extends State<TransitionsPage> {
  final List<String> _list = [
    'MaterialPageRoute',
    'CupertinoPageRoute',
    'PageRouteBuilder',
    'PageRoute',
    'PopupRoute',
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
    RouteSettings setting = RouteSettings(arguments: _list[index]);
    switch (index) {
      case 0:
        return MaterialPageRoute(
          builder: (context) => const TransitionsAnimationPage(),
          settings: setting,
        );
      case 1:
        return CupertinoPageRoute(
          builder: (context) => const TransitionsAnimationPage(),
          settings: setting,
        );
      case 2:
        return PageRouteBuilder(
          // 转场的动画时间
          transitionDuration: const Duration(seconds: 2),
          reverseTransitionDuration: const Duration(seconds: 2),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            // return FadeTransition(
            //   opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
            //   child: child,
            // );

            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero,).chain(CurveTween(curve: Curves.ease)).animate(animation),
              child: child,
            );
          },
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
           return const TransitionsAnimationPage();
          },
          settings: setting,
        );
      case 3:
        return AnimationRoute(
          builder: (context, _, __) => const TransitionsAnimationPage(),
          settings: setting,
        );
      case 4:
        return AnimationPopupRoute(
          builder: (context, _, __) => const TransitionsAnimationPage(),
          settings: setting,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const TransitionsAnimationPage(),
          settings: setting,
        );
    }
  }

  void _onTap(int index) {
    Navigator.push(context, _createPage(index));
  }
}
