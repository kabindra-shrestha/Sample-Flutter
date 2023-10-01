import 'package:freezed_annotation/freezed_annotation.dart';

part 'catfact.freezed.dart';
part 'catfact.g.dart';

/// CatFact data parsed from the API response (not used directly in the UI)
@freezed
class CatFact with _$CatFact {
  factory CatFact({
    @JsonKey(name: 'fact') required String fact,
    @JsonKey(name: 'length') required int length,
  }) = _CatFact;

  factory CatFact.fromJson(Map<String, dynamic> json) =>
      _$CatFactFromJson(json);
}
