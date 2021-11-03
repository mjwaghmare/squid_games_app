// Circle wearing workers are the lowest ranking, they must answer to their superiors and can "only speak when spoken to".

// Triangles are placed on the middle rung of the Squid Game hierarchy – they act as armed soldiers.

// Squares are effectively the bosses within the worker's group, they keep their fellow triangles and circles in check and call the shots.

// Of course, all the pink suited workers answer to the Front Man!

import 'package:squid_games_app/models/characters.dart';

List<CharacterModel> characters = [
  CharacterModel(
    characterName: "Front Man",
    characterDetails:
        "One who ran the game from the very beginning. He kept in touch with the VIPs who sponsored the game's prize money and worked as a bridge between the host and the VIPs. Of Course, all the pink suited workers answer to the Front Man!",
    characterImage: "assets/mask.png",
  ),
  CharacterModel(
    characterName: "Square Mask Bosses",
    characterDetails:
        "Squares are effectively the bosses within the worker's group, they keep their fellow triangles and circles in check and call the shots.",
    characterImage: "assets/s.png",
  ),
  CharacterModel(
    characterName: "Triangles Masks Soldiers",
    characterDetails:
        "Triangles are placed on the middle rung of the Squid Game hierarchy – they act as armed soldiers.",
    characterImage: "assets/t.png",
  ),
  CharacterModel(
    characterName: "Circle Masks Workers",
    characterDetails:
        "Circle wearing workers are the lowest ranking, they must answer to their superiors and can only speak when spoken to.",
    characterImage: "assets/c.png",
  ),
];
