import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final double width;
  final double height;
  final double sizew;
  final double sizeh;
  const ServicesWidget({
    Key? key,
    required this.name,
    required this.image,
    required this.color,
    required this.width,
    required this.height,
    required this.sizew,
    required this.sizeh,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Image.asset(
                image,
                width: sizew,
                height: sizeh,
              )
            ],
          ),
        ),
      ),
    );
  }
}
