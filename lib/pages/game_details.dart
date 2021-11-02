import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squid_games_app/models/game_model.dart';
import 'package:squid_games_app/utils/app_colors.dart';
import 'package:squid_games_app/utils/widgets/custom_appbar.dart';
import 'package:squid_games_app/utils/widgets/custom_button.dart';

class GameDetails extends StatelessWidget {
  final GameModel game;

  const GameDetails(this.game, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isProfilePic: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50),
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInLeft(
                delay: Duration(milliseconds: 600),
                child: Text(
                  game.gameName,
                  style: GoogleFonts.orbitron(
                      color: AppColors.whiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 2),
              FadeInLeft(
                  delay: Duration(milliseconds: 620),
                  child: Divider(color: AppColors.yellowColor, thickness: 2)),
              const SizedBox(height: 5),
              FadeInLeft(
                delay: Duration(milliseconds: 650),
                child: Text(
                  game.gameDetails,
                  style: GoogleFonts.openSans(
                      color: AppColors.whiteColor, fontSize: 17),
                ),
              ),
              const SizedBox(height: 15),
              FadeIn(
                delay: Duration(milliseconds: 670),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Hero(
                      tag: game.gameImage,
                      child: Image.asset(
                        game.gameImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              FadeInUp(
                delay: Duration(milliseconds: 650),
                child: CustomButton(
                  label: "Participate Now",
                  textClr: AppColors.whiteColor,
                  primaryClr: AppColors.yellowColor,
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
