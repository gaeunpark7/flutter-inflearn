// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';
part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

@freezed
@JsonSerializable()
class PhotoModel with _$PhotoModel {
  int id;
  String tags;
  @JsonKey(name: 'previewURL')
  String previewUrl;

  PhotoModel({required this.id, required this.tags, required this.previewUrl});

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
  // static jsonSchema = $PhotoModelJsonSchema;d
}

  // int id;
  // String pageURL;
  // String type;
  // String tags;
  // String previewURL;
  // int previewWidth;
  // int previewHeight;
  // String webformatURL;
  // int webformatWidth;
  // int webformatHeight;
  // String largeImageURL;
  // int imageWidth;
  // int imageHeight;
  // int imageSize;
  // int views;
  // int downloads;
  // int collections;
  // int likes;
  // int comments;
  // int userId;
  // String user;
  // String userImageURL;
  // bool noAiTraining;
  // bool isAiGenerated;
  // bool isGRated;
  // bool isLowQuality;
  // String userURL;
  // String name;

  // PhotoModel({
  //   required this.id,
  //   required this.pageURL,
  //   required this.type,
  //   required this.tags,
  //   required this.previewURL,
  //   required this.previewWidth,
  //   required this.previewHeight,
  //   required this.webformatURL,
  //   required this.webformatWidth,
  //   required this.webformatHeight,
  //   required this.largeImageURL,
  //   required this.imageWidth,
  //   required this.imageHeight,
  //   required this.imageSize,
  //   required this.views,
  //   required this.downloads,
  //   required this.collections,
  //   required this.likes,
  //   required this.comments,
  //   required this.userId,
  //   required this.user,
  //   required this.userImageURL,
  //   required this.noAiTraining,
  //   required this.isAiGenerated,
  //   required this.isGRated,
  //   required this.isLowQuality,
  //   required this.userURL,
  //   required this.name,
  // });

  // factory PhotoModel.fromJson(Map<String, dynamic> json) {
  //   return PhotoModel(
  //     id: json['id'],
  //     pageURL: json['pageURL'],
  //     type: json['type'],
  //     tags: json['tags'],
  //     previewURL: json['previewURL'],
  //     previewWidth: json['previewWidth'],
  //     previewHeight: json['previewHeight'],
  //     webformatURL: json['webformatURL'],
  //     webformatWidth: json['webformatWidth'],
  //     webformatHeight: json['webformatHeight'],
  //     largeImageURL: json['largeImageURL'],
  //     imageWidth: json['imageWidth'],
  //     imageHeight: json['imageHeight'],
  //     imageSize: json['imageSize'],
  //     views: json['views'],
  //     downloads: json['downloads'],
  //     collections: json['collections'],
  //     likes: json['likes'],
  //     comments: json['comments'],
  //     userId: json['user_id'],
  //     user: json['user'],
  //     userImageURL: json['userImageURL'],
  //     noAiTraining: json['noAiTraining'],
  //     isAiGenerated: json['isAiGenerated'],
  //     isGRated: json['isGRated'],
  //     isLowQuality: json['isLowQuality'],
  //     userURL: json['userURL'],
  //     name: json['name'],
  //   );
  // }