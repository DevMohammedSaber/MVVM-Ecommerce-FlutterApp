class BannerModel {
  int? id;
  String? image;
  BannerModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    image = data['image'];
  }
}
