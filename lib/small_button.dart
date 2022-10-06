import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  SmallButton({required this.text,required this.onPressed});
  final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
    fixedSize: Size(150, 45),
    backgroundColor: Color(0xFF2D4990),
  );

  late String text;
  late void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:ElevatedButton(
          style: flatButtonStyle,
          onPressed: onPressed,
          child:Text(
            text,
          ) ,
        )
    );
  }
}