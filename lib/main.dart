import 'package:animation_3b/implicit_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ImplicitAnimationScreen());
  }
}

class ExplicitAnimationScreen extends StatefulWidget {
  const ExplicitAnimationScreen({super.key});

  @override
  State<ExplicitAnimationScreen> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController exitController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      // lowerBound: 50,
      // upperBound: 200,
    );
    exitController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explicit Animation'),
        actions: [
          IconButton(
            onPressed: () {
              animationController.forward().then((_) {
                // animationController.reverse();
                exitController.forward();
              });
              // setState(() {});
            },
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, childWidget) {
          // return Opacity(opacity: animationController.value, child: child!);
          // return Container(
          //   color: Colors.red,
          //   height: animationController.value,
          //   width: animationController.value,
          // );
          // return FadeTransition(
          //   opacity: Tween<double>(begin: 0, end: 1).animate(
          //     CurvedAnimation(
          //       parent: animationController,
          //       curve: Curves.bounceIn,
          //     ),
          //   ),
          //   child: childWidget!,
          // );
          // return SlideTransition(
          //   position: Tween<Offset>(
          //     begin: Offset(-1, 0),
          //     end: Offset(0, 0),
          //   ).animate(
          //     CurvedAnimation(
          //       parent: animationController,
          //       curve: Curves.easeInBack,
          //     ),
          //   ),
          //   child: childWidget,
          // );
          // return Center(
          //   child: SizeTransition(
          //     sizeFactor: Tween<double>(begin: 0, end: 1).animate(
          //       CurvedAnimation(
          //         parent: animationController,
          //         curve: Curves.fastOutSlowIn,
          //       ),
          //     ),
          //     axis: Axis.horizontal,
          //     child: childWidget,
          //   ),
          // );
          // return ScaleTransition(
          //   scale: Tween<double>(begin: 0, end: 1).animate(
          //     CurvedAnimation(
          //       parent: animationController,
          //       curve: Curves.slowMiddle,
          //     ),
          //   ),
          //   alignment: Alignment.bottomRight,
          //   child: childWidget,
          // );
          // return RotationTransition(
          //   turns: Tween<double>(begin: 0, end: 5).animate(
          //     CurvedAnimation(
          //       parent: animationController,
          //       curve: Curves.linear,
          //     ),
          //   ),
          //   alignment: Alignment.bottomRight,
          //   child: childWidget,
          // );
          return RotationTransition(
            turns: Tween<double>(begin: 0, end: 5).animate(
              CurvedAnimation(
                parent: animationController,
                curve: Curves.linear,
              ),
            ),
            // alignment: Alignment.bottomRight,
            child: ScaleTransition(
              scale: Tween<double>(begin: 1, end: 0).animate(exitController),
              child: childWidget,
            ),
          );
        },
        child: Center(child: Image.asset('assets/flutter.png')),
      ),
    );
  }
}
