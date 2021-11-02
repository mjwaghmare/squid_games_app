class GameModel {
  String gameName;
  String gameDetails;
  String gameImage;

  GameModel({
    this.gameName,
    this.gameDetails,
    this.gameImage,
  });

  GameModel.fromJson(Map<String, dynamic> json) {
    gameName = json['gameName'];
    gameDetails = json['gameDetails'];
    gameImage = json['gameImage'];
  }
}
