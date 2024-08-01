/// albumId : 1
/// id : 1
/// title : "accusamus beatae ad facilis cum similique qui sunt"
/// url : "https://via.placeholder.com/600/92c952"
/// thumbnailUrl : "https://via.placeholder.com/150/92c952"

class PhotoModel {
  PhotoModel({
      this.albumId, 
      this.id, 
      this.title, 
      this.url, 
      this.thumbnailUrl,});

  PhotoModel.fromJson(dynamic json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
  num? albumId;
  num? id;
  String? title;
  String? url;
  String? thumbnailUrl;
PhotoModel copyWith({  num? albumId,
  num? id,
  String? title,
  String? url,
  String? thumbnailUrl,
}) => PhotoModel(  albumId: albumId ?? this.albumId,
  id: id ?? this.id,
  title: title ?? this.title,
  url: url ?? this.url,
  thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['albumId'] = albumId;
    map['id'] = id;
    map['title'] = title;
    map['url'] = url;
    map['thumbnailUrl'] = thumbnailUrl;
    return map;
  }

}