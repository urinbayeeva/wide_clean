import 'dart:convert';

class VideoRecModel {
  List<Category> categories;

  VideoRecModel({
    required this.categories,
  });

  factory VideoRecModel.fromRawJson(String str) =>
      VideoRecModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoRecModel.fromJson(Map<String, dynamic> json) => VideoRecModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  String name;
  List<Video> videos;

  Category({
    required this.name,
    required this.videos,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}

class Video {
  String description;
  List<String> sources;
  Subtitle subtitle;
  String thumb;
  String title;

  Video({
    required this.description,
    required this.sources,
    required this.subtitle,
    required this.thumb,
    required this.title,
  });

  factory Video.fromRawJson(String str) => Video.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        description: json["description"],
        sources: List<String>.from(json["sources"].map((x) => x)),
        subtitle: subtitleValues.map[json["subtitle"]]!,
        thumb: json["thumb"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "sources": List<dynamic>.from(sources.map((x) => x)),
        "subtitle": subtitleValues.reverse[subtitle],
        "thumb": thumb,
        "title": title,
      };
}

enum Subtitle { BY_BLENDER_FOUNDATION, BY_GARAGE419, BY_GOOGLE }

final subtitleValues = EnumValues({
  "By Blender Foundation": Subtitle.BY_BLENDER_FOUNDATION,
  "By Garage419": Subtitle.BY_GARAGE419,
  "By Google": Subtitle.BY_GOOGLE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
