import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyAnimatedPositioned());

/// This is the main application widget.
class MyAnimatedPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Implicit Animation')),
        body: Center(
          child: MyStatefulWidget1(),
        ),
      ),
    );
  }
}

class MyStatefulWidget1 extends StatefulWidget {
  const MyStatefulWidget1({Key key}) : super(key: key);

  @override
  _MyStatefulWidget1State createState() => _MyStatefulWidget1State();
}

class _MyStatefulWidget1State extends State<MyStatefulWidget1> {
  bool selected = false;

  List<Widget> widgetList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < 2; i++) {
      widgetList.add(ItemH(
        index: i,
        // key: UniqueKey(),
        onTap: (index) {
          widgetList.removeAt(i);
          setState(() {});
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Using AnimatedPositioned'),
        SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 300,
            height: 500,
            child: Stack(
              children: widgetList,
            ),
          ),
        ),
      ],
    );
  }
}

class ItemH extends StatefulWidget {
  final Function onTap;
  int index;

  ItemH({Key key, @required this.onTap, @required this.index})
      : super(key: key);

  @override
  _ItemHState createState() => _ItemHState();
}

class _ItemHState extends State<ItemH> {
  final double left = rramdom(100, 200);

  final double top = rramdom(100, 200);

  @override
  void initState() {
    super.initState();
  }

  static rramdom(int min, int max) {
    return (min + Random().nextInt(max - min)).toDouble();
  }

  @override
  void didUpdateWidget(covariant ItemH oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 50.0,
      height: 50.0,
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () {
          widget.onTap(widget.index);
        },
        child: Container(
          color: Colors.blue,
          child: Center(child: Text(widget.index.toString())),
        ),
      ),
    );
    ;
  }
}
