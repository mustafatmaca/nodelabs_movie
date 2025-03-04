import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String iconName;
  const SocialButton({
    super.key,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          color: Color(0x1AFFFFFF),
          border: Border.all(color: Colors.white54, width: 1.0),
          borderRadius: BorderRadius.circular(18)),
      child: Image.asset(
        iconName,
        scale: 0.8,
      ),
    );
  }
}
