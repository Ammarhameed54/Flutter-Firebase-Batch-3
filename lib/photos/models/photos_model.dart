// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhotosModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  PhotosModel copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return PhotosModel(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory PhotosModel.fromMap(Map<String, dynamic> map) {
    return PhotosModel(
      albumId: map['albumId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotosModel.fromJson(String source) => PhotosModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PhotosModel(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(covariant PhotosModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.albumId == albumId &&
      other.id == id &&
      other.title == title &&
      other.url == url &&
      other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      url.hashCode ^
      thumbnailUrl.hashCode;
  }
}
