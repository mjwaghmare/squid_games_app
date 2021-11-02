import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isProfilePic;
  CustomAppBar({
    Key key,
    this.isProfilePic = false,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blackColor,
      leading: Icon(
        Icons.menu,
      ),
      title: Image.asset(
        "assets/sq_name.png",
        fit: BoxFit.contain,
        height: 45,
      ),
      centerTitle: true,
      actions: [
        widget.isProfilePic == true
            ? CircleAvatar(
                backgroundImage: AssetImage("assets/camera_2.jpg"),
              )
            : Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: AppColors.blueGrey, shape: BoxShape.circle),
                child: Text(
                  "456",
                  style: GoogleFonts.orbitron(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
        SizedBox(width: 15)
      ],
    );
  }
}
