class UserModel {
  String? name, email, phone, image, token;

  UserModel(this.name, this.email, this.image, this.phone, this.token);

  UserModel.fromJson({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    image = data['image'];
    phone = data['phone'];
    token = data['token'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'phone': phone,
      'token': token,
    };
  }
}
