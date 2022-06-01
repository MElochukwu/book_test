// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doc _$DocFromJson(Map<String, dynamic> json) => Doc(
      coverI: json['cover_i'] as int?,
      hasFulltext: json['has_fulltext'] as bool?,
      editionCount: json['edition_count'] as int?,
      title: json['title'] as String?,
      authorName: (json['author_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      firstPublishYear: json['first_publisher_year'] as int?,
      key: json['key'] as String?,
      ia: (json['ia'] as List<dynamic>?)?.map((e) => e as String).toList(),
      authorKey: (json['author_key'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      publicScanB: json['public_scan_b'] as bool?,
    );

Map<String, dynamic> _$DocToJson(Doc instance) => <String, dynamic>{
      'cover_i': instance.coverI,
      'has_fulltext': instance.hasFulltext,
      'edition_count': instance.editionCount,
      'title': instance.title,
      'author_name': instance.authorName,
      'first_publisher_year': instance.firstPublishYear,
      'key': instance.key,
      'ia': instance.ia,
      'author_key': instance.authorKey,
      'public_scan_b': instance.publicScanB,
    };
