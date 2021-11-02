import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squid_games_app/utils/app_colors.dart';
import 'package:squid_games_app/utils/strings.dart';
import 'package:squid_games_app/utils/widgets/custom_button.dart';

import 'call_screen.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 90,
            child: Image.asset(
              "assets/sq_name.png",
              fit: BoxFit.contain,
            ),
          ),
          Image.asset(
            "assets/card_hand.jpg",
            fit: BoxFit.cover,
          ),
          Text(
            "G A M E   S Y N O P S I S",
            style: TextStyle(color: AppColors.yellowColor, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              AppStrings.gameText,
              style: GoogleFonts.openSans(
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
              label: "📞  8650 4006",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CallScreen(),
                  ),
                );
              },
              primaryClr: AppColors.yellowColor,
              textClr: AppColors.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
