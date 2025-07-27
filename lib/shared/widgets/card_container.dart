import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final double? height;

  const CardContainer({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: height,
        width: width * 0.9,
        decoration: _decoration(),
        child: child,
      ),
    );
  }
}

BoxDecoration _decoration() => BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Colors.white70,
  boxShadow: [
    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
  ],
);
