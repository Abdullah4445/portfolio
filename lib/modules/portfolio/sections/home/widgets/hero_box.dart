import 'package:flutter/material.dart';
import '../../../../widgets/new/heropainter.dart';

class HeroBox extends StatelessWidget {
  final ThemeMode themeMode;
  final double size;

  const HeroBox({Key? key, required this.themeMode, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroBoxWithAnimatedIcons(themeMode: themeMode, size: size);
  }
}
