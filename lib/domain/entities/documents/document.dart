import 'package:const_date_time/const_date_time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../checks/check_result.dart';

part 'document.freezed.dart';

@freezed
class Document with _$Document {
  const factory Document({
    required String id,
    required String title,
    required String text,
    CheckResult? checkResult,
    DateTime? lastCheckedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Document;

  const factory Document.empty({
    @Default('') String id,
    @Default('') String title,
    @Default('') String text,
    CheckResult? checkResult,
    DateTime? lastCheckedAt,
    @Default(ConstDateTime.fromMillisecondsSinceEpoch(0)) DateTime createdAt,
    @Default(ConstDateTime.fromMillisecondsSinceEpoch(0)) DateTime updatedAt,
  }) = _Empty;
}
