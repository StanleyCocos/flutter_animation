

import 'package:flutter/cupertino.dart';

class AnimationRoute extends PageRoute {

  Color? color;
  String? label;
  bool state;
  RoutePageBuilder builder;
  Duration duration;

  AnimationRoute({
    required this.builder,
    this.duration = const Duration(seconds: 3),
    this.color,
    this.label,
    this.state = false,
    super.settings,
});


  @override
  Color? get barrierColor => color;

  @override
  String? get barrierLabel => label;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context, animation, secondaryAnimation);
  }

  @override
  bool get maintainState => state;

  @override
  Duration get transitionDuration => duration;

  @override
  Duration get reverseTransitionDuration => duration;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero,).chain(CurveTween(curve: Curves.ease)).animate(animation),
      child: child,
    );
  }
}