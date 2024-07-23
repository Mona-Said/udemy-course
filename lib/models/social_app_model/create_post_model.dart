class CreatePostModel {
  String? name;
  String? dateTime;
  String? text;
  String? uId;
  String? postImage;
  String? image;

  CreatePostModel({
    this.name,
    this.text,
    this.postImage,
    this.uId,
    this.dateTime,
    this.image,
  });

  CreatePostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
    postImage = json['postImage'];
    uId = json['uId'];
    dateTime = json['dateTime'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'text': text,
      'dateTime': dateTime,
      'uId': uId,
      'postImage': postImage,
      'image': image,
    };
  }
}
