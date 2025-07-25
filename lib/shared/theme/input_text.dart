import 'package:flutter/material.dart';

class InputTexts {
  static Text requiredInput({required String inputName}) {
    return Text.rich(
      TextSpan(
        text: inputName,
        style: TextStyle(color: Colors.black, fontSize: 18),
        children: [
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
