import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squid_games_app/data/characters.dart';
import 'package:squid_games_app/data/games.dart';
import 'package:squid_games_app/data/viplist.dart';
import 'package:squid_games_app/models/characters.dart';
import 'package:squid_games_app/models/game_model.dart';
import 'package:squid_games_app/models/vips.dart';
import 'package:squid_games_app/pages/game_details.dart';
import 'package:squid_games_app/utils/app_colors.dart';
import 'package:squid_games_app/utils/widgets/custom_appbar.dart';

import 'characters_details.dart';
import 'vip_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          isProfilePic: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  delay: Duration(milliseconds: 300),
                  // duration: Duration(seconds: 2),
                  child: Text(
                    "Total Reward",
                    style: GoogleFonts.openSans(color: AppColors.yellowColor, fontSize: 15),
                  ),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 500),
                  // duration: Duration(seconds: 3),
                  child: Text(
                    "45.6 billion ₩",
                    style: GoogleFonts.openSans(
                        color: AppColors.yellowColor, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12),
                FadeInDown(
                  delay: Duration(milliseconds: 800),
                  child: Text(
                    "There are 7 games to be played in the total. The winner of the first game deserves to move on to the next. Every game you win, your money doubles. Only one person will win this game",
                    style: GoogleFonts.openSans(
                        color: AppColors.whiteColor.withOpacity(0.6),
                        fontSize: 14,
                        wordSpacing: 1.5,
                        height: 1.5),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 40,
                  child: TabBar(
                      labelStyle: GoogleFonts.orbitron(
                        color: AppColors.whiteColor,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: GoogleFonts.orbitron(
                        color: AppColors.blueGrey,
                        fontSize: 15,
                      ),
                      isScrollable: true,
                      tabs: [
                        Text("Games"),
                        Text("Characters"),
                        Text("Vips"),
                      ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(children: [
                    gamesListView(gamesList),
                    charactersListView(characters),
                    vipsListView(vips),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  gamesListView(List<GameModel> gamesList) {
    return ListView.builder(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 2,
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: gamesList.length,
        itemBuilder: (ctx, index) {
          GameModel game = gamesList[index];
          return GameCard(
            game: game,
            index: index,
          );
        });
  }

  charactersListView(List<CharacterModel> charactersList) {
    return ListView.builder(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 2,
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: charactersList.length,
        itemBuilder: (ctx, index) {
          CharacterModel character = charactersList[index];
          return CharacterCard(
            character: character,
            index: index,
          );
        });
  }

  vipsListView(List<VipModel> vipsList) {
    return ListView.builder(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 2,
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: vipsList.length,
        itemBuilder: (ctx, index) {
          VipModel vip = vipsList[index];
          return VipCard(
            vip: vip,
            index: index,
          );
        });
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
    return FadeInLeft(
      duration: Duration(milliseconds: (index + 1) * 250),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${index + 1}. ${game.gameName}",
              style: GoogleFonts.orbitron(
                  color: AppColors.whiteColor, fontSize: 17, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key key,
    @required this.character,
    this.index,
  }) : super(key: key);

  final CharacterModel character;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: Duration(milliseconds: (index + 1) * 250),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${index + 1}. ${character.characterName}",
              style: GoogleFonts.orbitron(
                  color: AppColors.whiteColor, fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                splashColor: AppColors.yellowColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => CharacterDetails(character),
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
                      tag: character.characterImage,
                      child: Image.asset(
                        character.characterImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VipCard extends StatelessWidget {
  const VipCard({
    Key key,
    @required this.vip,
    this.index,
  }) : super(key: key);

  final VipModel vip;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: Duration(milliseconds: (index + 1) * 250),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${index + 1}. ${vip.vipName}",
              style: GoogleFonts.orbitron(
                  color: AppColors.whiteColor, fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                splashColor: AppColors.yellowColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => VipDetails(vip),
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
                      tag: vip.vipImage,
                      child: Image.asset(
                        vip.vipImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
