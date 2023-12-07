class CategoryModel {
  int? id;
  String? name, image;

  CategoryModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
  }
}
