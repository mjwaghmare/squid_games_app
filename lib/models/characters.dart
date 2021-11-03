class CharacterModel {
  String characterName;
  String characterDetails;
  String characterImage;

  CharacterModel({
    this.characterName,
    this.characterDetails,
    this.characterImage,
  });

  CharacterModel.fromJson(Map<String, dynamic> json) {
    characterName = json['characterName'];
    characterDetails = json['characterDetails'];
    characterImage = json['characterImage'];
  }
}
