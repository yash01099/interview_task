import 'package:flutter/material.dart';

class CardWrapper extends StatelessWidget {
  final child;
  const CardWrapper({Key? key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.02, vertical: size.height * 0.01),
        child: child,
      ),
    );
  }
}
