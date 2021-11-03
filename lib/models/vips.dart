class VipModel {
  String vipName;
  String vipDetails;
  String vipImage;

  VipModel({
    this.vipName,
    this.vipDetails,
    this.vipImage,
  });

  VipModel.fromJson(Map<String, dynamic> json) {
    vipName = json['vipName'];
    vipDetails = json['vipDetails'];
    vipImage = json['vipImage'];
  }
}
