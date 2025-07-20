import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final int? height;

  const CardContainer({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: width * 0.9,
          decoration: _decoration(),
          child: child,
        ),
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
