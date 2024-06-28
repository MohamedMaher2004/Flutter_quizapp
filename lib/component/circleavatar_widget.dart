import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  double raduis;
  Color backgroundcolor;

  CircleAvatarWidget({required this.raduis, required this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: raduis,
      backgroundColor: backgroundcolor,
    );
  }
}
