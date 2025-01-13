import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;

  const AppBarActions({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2.0,
          ),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
