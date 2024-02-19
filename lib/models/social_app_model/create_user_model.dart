class CreateUserModel
{
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerified;

  CreateUserModel({
    this.name,
    this.phone,
    this.email,
    this.uId,
    this.isEmailVerified,
  });

  CreateUserModel.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'name' : name,
        'phone' : phone,
        'email' : email,
        'uId' : uId,
        'isEmailVerified' : isEmailVerified,

    };
  }

}