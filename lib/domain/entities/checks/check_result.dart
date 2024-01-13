import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_result.freezed.dart';

@freezed
class CheckResult with _$CheckResult {
  const factory CheckResult({
    required AICheckResult ai,
  }) = _CheckResult;
}

enum AIClassification {
  veryUnlikely,
  unlikely,
  unclear,
  possibly,
  likely,
}

@freezed
class AICheckResult with _$AICheckResult {
  const factory AICheckResult({
    required AIClassification classification,
    required double score,
  }) = _AICheckResult;
}
