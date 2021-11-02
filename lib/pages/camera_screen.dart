import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squid_games_app/utils/app_colors.dart';
import 'package:squid_games_app/utils/widgets/custom_appbar.dart';
import 'package:squid_games_app/utils/widgets/custom_button.dart';

import 'homescreen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool picApproved = false;

  void approved() {
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      setState(() {
        picApproved = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isProfilePic: !picApproved ? false : true,
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Icon(
                Icons.camera_alt,
                size: 30,
                color: !picApproved ? AppColors.whiteColor : AppColors.blueGrey,
              ),
              !picApproved
                  ? Container(
                      margin: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width - 50,
                      color: AppColors.blueGrey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LOOK AT THE CAMERA",
                            style: GoogleFonts.orbitron(
                              color: AppColors.whiteColor,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 15),
                          Image.asset(
                            "assets/camera_1.PNG",
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width - 50,
                      child: Image.asset(
                        "assets/camera_2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomButton(
                  label: !picApproved ? "Take a Photo" : "Approve",
                  primaryClr:
                      !picApproved ? AppColors.yellowColor : AppColors.pink,
                  textClr: AppColors.whiteColor,
                  onTap: () {
                    !picApproved
                        ? approved()
                        : Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => HomeScreen(),
                            ),
                          );
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomButton(
                  label: "Re-Take",
                  primaryClr: AppColors.yellowColor,
                  textClr: AppColors.whiteColor,
                  onTap: () {
                    setState(() {
                      picApproved = false;
                    });
                  },
                ),
              )
            ],
          )),
    );
  }
}
