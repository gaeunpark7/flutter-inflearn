// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Note _$NoteFromJson(Map<String, dynamic> json) => _Note(
  title: json['title'] as String,
  content: json['content'] as String,
  color: (json['color'] as num).toInt(),
  timestamp: (json['timestamp'] as num).toInt(),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$NoteToJson(_Note instance) => <String, dynamic>{
  'title': instance.title,
  'content': instance.content,
  'color': instance.color,
  'timestamp': instance.timestamp,
  'id': instance.id,
};
