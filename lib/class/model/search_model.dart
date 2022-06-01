import 'package:json_annotation/json_annotation.dart';

import 'document.dart';
part 'search_model.g.dart';

@JsonSerializable()
class SearchResult {
  final int? start;
  final int? numFound;
  @JsonKey(name: 'docs')
  final List<Doc>? docs;

  SearchResult({this.start, this.numFound, this.docs});

  factory SearchResult.empty() => SearchResult(docs: []);

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
