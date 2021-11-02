import 'package:flutter/material.dart';
import 'package:squid_games_app/utils/app_colors.dart';

import 'agreement_screen.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key key}) : super(key: key);

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
                      "8650  4006",
                      style:
                          TextStyle(color: AppColors.yellowColor, fontSize: 25),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "DIALLING...",
                      style: TextStyle(color: AppColors.blueGrey, fontSize: 18),
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
      height: 180,
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
