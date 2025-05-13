import 'package:animation_3b/main.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  bool isSelected = false;

  Widget container1 = Container(
    width: 200,
    height: 100,
    color: Colors.blue,
    key: UniqueKey(),
    alignment: Alignment.center,
    child: Text('Tap me to see a surprise'),
  );
  // Widget container2 = Container(
  //   width: 200,
  //   height: 100,
  //   color: Colors.blue,
  //   key: UniqueKey(),
  // );
  Widget container2 = Text('Surprise!!!!');
  Widget? mainContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainContainer = container1;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: GestureDetector(
  //       onTap: () {
  //         setState(() {
  //           isSelected = !isSelected;
  //         });
  //       },
  //       // child: AnimatedContainer(
  //       //   duration: Duration(seconds: 2),
  //       //   curve: Curves.bounceInOut,
  //       //   decoration: BoxDecoration(
  //       //     borderRadius: BorderRadius.circular(isSelected ? 0 : 200),
  //       //     color: isSelected ? Colors.blue : Colors.red,
  //       //   ),
  //       //   width: 200,
  //       //   height: 200,
  //       //   // color: isSelected ? Colors.blue : Colors.red,
  //       // ),
  //       // child: GestureDetector(
  //       //   onTap: () {
  //       //     setState(() {
  //       //       mainContainer = container2;
  //       //     });
  //       //   },
  //       //   child: AnimatedSwitcher(
  //       //     duration: Duration(seconds: 2),
  //       //     switchInCurve: Curves.bounceIn,
  //       //     // switchOutCurve: Curves.bounceOut,
  //       //     child: mainContainer,
  //       //   ),
  //       // ),
  //       child: Stack(
  //         children: [
  //           Center(child: Text('Surprise!!!')),
  //           AnimatedPositioned(
  //             duration: Duration(seconds: 1),
  //             top:
  //                 isSelected
  //                     ? 200
  //                     : MediaQuery.of(context).size.height / 2 - 50,
  //             right: MediaQuery.of(context).size.width / 2 - 100,
  //             child: AnimatedOpacity(
  //               opacity: isSelected ? 0 : 1,
  //               duration: Duration(seconds: 1),
  //               child: Container(
  //                 width: 200,
  //                 height: 100,
  //                 color: Colors.blue,
  //                 alignment: Alignment.center,
  //                 child: Text('tap to see the surprise'),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return HeroScreen(index: index);
                  },
                ),
              );
              print('tap');
            },
            title: Text('${index + 1}'),
            leading: Hero(
              tag: 'flutter-img$index',
              child: Image.asset('assets/flutter.png'),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key, required this.index});
  final index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'flutter-img${index}',
        child: Image.asset('assets/flutter.png'),
      ),
    );
  }
}
