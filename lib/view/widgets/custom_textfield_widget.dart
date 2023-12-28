import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/view/auth/login/login_first_view.dart';
bool see = false;
class CustomTextFieldWidget extends StatefulWidget {
  final controller;
  final text;
  final password;
  var onChange;
  CustomTextFieldWidget({super.key,required this.controller, required this.text, required this.password, this.onChange});

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
         controller: widget.controller,
      onChanged: widget.onChange,
      decoration: InputDecoration(

        hintStyle: const TextStyle(
          color: Color(
            0xFFCBCBCB,
          ),
        ),
        hintText: widget.text,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: widget.password == true ? IconButton(onPressed: () {
          see  = !see;
          setState(() {
          });
        }, icon: SvgPicture.asset(
          see == true
              ? 'assets/svg/eye_off.svg'
              : 'assets/svg/eye_on.svg',
          fit: BoxFit.scaleDown,
        ) ) : null,
      ),
      obscureText: widget.password == true ? true && see == true : false ,
    );
  }
}
