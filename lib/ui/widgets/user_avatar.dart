
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String avatarUrl;

  UserAvatar({required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(avatarUrl),
      radius: 30.0,
    );
  }
}
