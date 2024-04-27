class CreateUserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? cover;
  String? image;
  String? bio;
  bool? isEmailVerified;

  CreateUserModel({
    this.name,
    this.phone,
    this.email,
    this.uId,
    this.cover,
    this.image,
    this.bio,
    this.isEmailVerified,
  });

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    uId = json['uId'];
    cover = json['cover'];
    image = json['image'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'uId': uId,
      'cover': cover,
      'image': image,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}
