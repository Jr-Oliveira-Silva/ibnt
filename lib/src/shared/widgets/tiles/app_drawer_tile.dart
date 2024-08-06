// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({
    Key? key,
    required this.tileName,
    required this.leadingIcon,
    required this.onTap,
  }) : super(key: key);

  final String tileName;
  final IconData leadingIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final verticalTilePadding = width * 0.045;
    final drawerTileFontSize = height * 0.024;
    final drawerIconSize = height * 0.042;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalTilePadding),
      child: ListTile(
        onTap: onTap,
        leading: Icon(leadingIcon, size: drawerIconSize),
        title: Text(
          tileName,
          style: TextStyle(
            fontSize: drawerTileFontSize,
          ),
        ),
      ),
    );
  }
}
