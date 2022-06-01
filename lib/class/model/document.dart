import 'package:json_annotation/json_annotation.dart';

import '../../constant/const.dart';

part 'document.g.dart';

@JsonSerializable()
class Doc {
  Doc({
    this.coverI,
    this.hasFulltext,
    this.editionCount,
    this.title,
    this.authorName,
    this.firstPublishYear,
    this.key,
    this.ia,
    this.authorKey,
    this.publicScanB,
  });
  @JsonKey(name: "cover_i")
  final int? coverI;
  @JsonKey(name: "has_fulltext")
  final bool? hasFulltext;
  @JsonKey(name: "edition_count")
  final int? editionCount;
  final String? title;
  @JsonKey(name: "author_name")
  final List<String>? authorName;
  @JsonKey(name: "first_publisher_year")
  final int? firstPublishYear;
  final String? key;
  final List<String>? ia;
  @JsonKey(name: "author_key")
  final List<String>? authorKey;
  @JsonKey(name: "public_scan_b")
  final bool? publicScanB;

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);
  Map<String, dynamic> toJson() => _$DocToJson(this);

  String getBookCover() {
    if (coverI != null) {
      return "${Const.coverUrl}/b/id/$coverI.jpg";
    } else {
      return "";
    }
  }
}
