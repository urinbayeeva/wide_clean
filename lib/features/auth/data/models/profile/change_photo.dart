
class ChangePhoto {
  static late ChangePhoto changePhoto;

  String picture;

  ChangePhoto({
    required this.picture,
  });

  ChangePhoto copyWith({
    String? picture,
  }) =>
      ChangePhoto(
        picture: picture ?? this.picture,
      );

  factory ChangePhoto.fromJson(Map<String, dynamic> json) => ChangePhoto(
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "picture": picture,
      };

  static void initialize(String picture) {
    changePhoto = ChangePhoto(picture: picture);
  }
}
