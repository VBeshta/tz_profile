import 'package:flutter/material.dart';
import 'package:tz_profile/colors/colors.dart';

class RedButton extends StatelessWidget {
  final onTap;
  final String text;
  RedButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: red,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
