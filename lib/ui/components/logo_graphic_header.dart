import 'package:countryman_radar/controllers/controllers.dart';
import 'package:flutter/material.dart';

class LogoGraphicHeader extends StatelessWidget {
  final ThemeController themeController = ThemeController.to;

  final double size;

  LogoGraphicHeader({
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    String _imageLogo = 'assets/images/default_avatar.png';
    if (themeController.isDarkModeOn == true) {
      _imageLogo = 'assets/images/default_dark_avatar.png';
    }
    return Hero(
      tag: 'Фото профиля',
      child: CircleAvatar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.transparent,
          radius: size,
          child: ClipOval(
            child: Image.asset(
              _imageLogo,
              fit: BoxFit.cover,
              width: size * 2,
              height: size * 2,
            ),
          )),
    );
  }
}
