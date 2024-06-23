import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlagIconButton extends StatelessWidget {
  final BytesLoader icon;
  final VoidCallback onTap;
  const FlagIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
      width: 30.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Color(0xFFD9D9D9),
            )
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: SvgPicture(icon),
        ),
      ),
    );
  }
}
