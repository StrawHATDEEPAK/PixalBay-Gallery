import 'dart:convert';

class PixabayImage {
  final String webformatURL;
  final String largeImageURL;
  final int likes;
  final int views;

  PixabayImage(
    this.webformatURL,
    this.largeImageURL,
    this.likes,
    this.views,
  );

  Map<String, dynamic> toMap() {
    return {
      'webformatURL': webformatURL,
      'largeImageURL': largeImageURL,
      'likes': likes,
      'views': views,
    };
  }

  factory PixabayImage.fromMap(Map<String, dynamic> map) {
    return PixabayImage(
      map['webformatURL'] ?? '',
      map['largeImageURL'] ?? '',
      map['likes']?.toInt() ?? 0,
      map['views']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PixabayImage.fromJson(String source) =>
      PixabayImage.fromMap(json.decode(source));
}
