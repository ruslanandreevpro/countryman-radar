import 'package:countryman_radar/ui/components/components.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String photoUrl;
  final double size;

  Avatar({
    required this.photoUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (photoUrl == '') {
      return LogoGraphicHeader(size: size);
    }
    return Hero(
      tag: 'Фото профиля',
      child: CircleAvatar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          radius: size,
          child: ClipOval(
            child: Image.network(
              photoUrl,
              fit: BoxFit.cover,
              width: size * 2,
              height: size * 2,
            ),
          )),
    );
  }
}
