import 'package:flutter/material.dart';

class TopRowWidget extends StatelessWidget {
  final String text;
  const TopRowWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(child: Image.asset('assets/design/images/arrowleft.png'),onTap: () {
          Navigator.pop(context);
        },),
         Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Image.asset('assets/design/images/cross.png'),
      ],
    );
  }
}
