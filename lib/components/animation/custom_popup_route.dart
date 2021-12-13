import 'package:flutter/cupertino.dart';
import 'package:socialapp/models/transition_type.dart';

class CustomPopupRoute extends PopupRoute {
  
  CustomPopupRoute({
    required this.builder,
    required this.dismissible,
    required this.color,
    required this.label,
    required this.transitionType,
    required this.duration
  });

  final WidgetBuilder builder;
  final bool dismissible;
  final Color color;
  final String label;
  final int duration;
  final TransitionType transitionType;

  @override
  Color get barrierColor => color;

  @override
  bool get barrierDismissible => dismissible;

  @override
  String get barrierLabel => '';

  @override
  Duration get transitionDuration => Duration(milliseconds: duration);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    
    switch (transitionType) {
        case TransitionType.none:
          return child;

        case TransitionType.size:
          return Align(
            child: SizeTransition(
              sizeFactor: animation, //CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve),
              child: child,
            ),
          );

        case TransitionType.scale:
          return ScaleTransition(
            scale: animation,
            // alignment: Alignment.topRight,
            child: child,
          );
          
        case TransitionType.fade:
          return FadeTransition(
            opacity: animation,
            child: child,
          );
          
        case TransitionType.rotate:
          return RotationTransition(
            alignment: Alignment.center,
            turns: animation,
            child: ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          );
          
        // SlideTransition position is an Animation<Offset> not Animation<double>
        // Use Tween<Offset>().animate(animation)
        case TransitionType.slideDown:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
          
        case TransitionType.slideUp:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            //).animate(CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve)),
            child: child,
          );
          
        case TransitionType.slideLeft:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            //).animate(CurvedAnimation(parent: animation,curve: curve, reverseCurve: reverseCurve)),
            child: child,
          );
          
        case TransitionType.slideRight:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
          
        default:
          return FadeTransition(opacity: animation, child: child);
      }
    
  }
}