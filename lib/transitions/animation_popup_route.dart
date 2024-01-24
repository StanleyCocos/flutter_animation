

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationPopupRoute extends PopupRoute {


  Color? color;
  String? label;
  bool state;
  RoutePageBuilder builder;
  Duration duration;
  bool dismissible = false;

  AnimationPopupRoute({
    required this.builder,
    this.duration = const Duration(seconds: 3),
    this.color,
    this.label,
    this.state = false,
    this.dismissible = false,
    super.settings,
  });

  @override
  Color? get barrierColor => color;

  @override
  bool get barrierDismissible => dismissible;

  @override
  String? get barrierLabel => label;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context, animation, secondaryAnimation);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Scaffold(
          body: builder(context, animation, secondaryAnimation),
        ),
      ],
    );
  }

  @override
  Duration get transitionDuration => duration;


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).chain(CurveTween(curve: Curves.ease)).animate(animation),
      child: child,
    );
  }

}