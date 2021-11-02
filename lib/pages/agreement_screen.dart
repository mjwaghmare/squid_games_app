import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squid_games_app/utils/app_colors.dart';
import 'package:squid_games_app/utils/strings.dart';
import 'package:squid_games_app/utils/widgets/custom_button.dart';

import 'camera_screen.dart';

class AgreementScreen extends StatelessWidget {
  const AgreementScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AgreementCard(),
            const SizedBox(height: 20.0),
            CustomButton(
              label: "I Agree",
              onTap: () {
                Future.delayed(Duration(seconds: 1))
                    .whenComplete(() => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CameraScreen(),
                          ),
                        ));
              },
              primaryClr: AppColors.pink,
              textClr: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}

class AgreementCard extends StatelessWidget {
  const AgreementCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(6.0),
          height: 410,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "AGREEMENT",
                  style: GoogleFonts.orbitron(
                    color: AppColors.blueGrey,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  AppStrings.gameAgreement,
                  style: TextStyle(
                      height: 1.5, color: AppColors.blackColor, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
