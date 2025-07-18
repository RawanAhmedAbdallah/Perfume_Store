import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  const IconWidget({
    Key? key,
    required this.icon,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
    => Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black,),
    );
  }
