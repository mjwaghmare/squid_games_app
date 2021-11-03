import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squid_games_app/utils/app_colors.dart';

import 'agreement_screen.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  int seconds = 0;
  Timer timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        seconds++;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CallerImage(),
              Container(
                child: Column(
                  children: [
                    Text(
                      "0456  0456",
                      style: GoogleFonts.orbitron(
                          color: AppColors.whiteColor, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "00 : $seconds",
                      style: GoogleFonts.orbitron(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CallButtonWidget(
                    icon: Icons.mic,
                    color: AppColors.blueGrey.withOpacity(0.5),
                  ),
                  CallButtonWidget(
                    icon: Icons.video_call_rounded,
                    color: AppColors.blueGrey.withOpacity(0.5),
                  ),
                  CallButtonWidget(
                    icon: Icons.volume_mute,
                    color: AppColors.blueGrey.withOpacity(0.5),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  timer.cancel();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => AgreementScreen(),
                    ),
                  );
                },
                child: CallButtonWidget(
                  icon: Icons.call_end,
                  color: Colors.red,
                  height: 75,
                  width: 75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CallButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double height;
  final double width;

  const CallButtonWidget({
    Key key,
    @required this.icon,
    @required this.color,
    this.height = 66,
    this.width = 66,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        icon,
        size: 35,
        color: AppColors.whiteColor,
      ),
    );
  }
}

class CallerImage extends StatelessWidget {
  const CallerImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.yellowColor.withOpacity(0.4),
      ),
      child: Image.asset(
        "assets/sq_logo.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
