import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squid_games_app/data/games.dart';
import 'package:squid_games_app/models/game_model.dart';
import 'package:squid_games_app/pages/game_details.dart';
import 'package:squid_games_app/utils/app_colors.dart';
import 'package:squid_games_app/utils/widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isProfilePic: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Reward",
              style: GoogleFonts.openSans(
                  color: AppColors.yellowColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "45.6 billion ₩",
              style: GoogleFonts.openSans(
                  color: AppColors.yellowColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "There are 7 games to be played in the total. The winner of the first game deserves to move on to the next. Every game you win, your money doubles. Only one person will win this game",
              style: GoogleFonts.openSans(
                  color: AppColors.whiteColor.withOpacity(0.6),
                  fontSize: 14,
                  wordSpacing: 1.5,
                  height: 1.5),
            ),
            SizedBox(height: 15),
            Text(
              "Games",
              style: GoogleFonts.orbitron(
                  color: AppColors.whiteColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Flexible(
              child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: gamesList.length,
                  itemBuilder: (ctx, index) {
                    GameModel game = gamesList[index];
                    return GameCard(
                      game: game,
                      index: index,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  const GameCard({
    Key key,
    @required this.game,
    this.index,
  }) : super(key: key);

  final GameModel game;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${index + 1}. ${game.gameName}",
            style: GoogleFonts.orbitron(
                color: AppColors.whiteColor,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(
              splashColor: AppColors.yellowColor,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => GameDetails(game),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                height: MediaQuery.of(context).size.height * 0.21,
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
          )
        ],
      ),
    );
  }
}
