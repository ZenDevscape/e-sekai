import '../../../domain/entities/checks/check_result.dart';

class CheckResultDto {
  static CheckResult fromJson(Map<Object?, Object?> json) {
    return CheckResult(
      ai: AICheckResultDto.fromJson(json['ai'] as Map<Object?, Object?>),
    );
  }

  static Map<String, dynamic> toJson(CheckResult checkResult) {
    return {
      'ai': AICheckResultDto.toJson(checkResult.ai),
    };
  }
}

class AICheckResultDto {
  static AICheckResult fromApiJson(Map<String, dynamic> json) {
    final String classification = json['class'] as String;

    return AICheckResult(
      classification: classification == 'very unlikely'
          ? AIClassification.veryUnlikely
          : classification == 'unlikely'
              ? AIClassification.unlikely
              : classification == 'unclear if it is'
                  ? AIClassification.unclear
                  : classification == 'possibly'
                      ? AIClassification.possibly
                      : AIClassification.likely,
      score: json['detect_probability'] as double,
    );
  }

  static AICheckResult fromJson(Map<Object?, Object?> json) {
    final String classification = json['classification'] as String;

    return AICheckResult(
      classification: classification == 'veryUnlikely'
          ? AIClassification.veryUnlikely
          : classification == 'unlikely'
              ? AIClassification.unlikely
              : classification == 'unclear'
                  ? AIClassification.unclear
                  : classification == 'possibly'
                      ? AIClassification.possibly
                      : AIClassification.likely,
      score: json['score'] as double,
    );
  }

  static Map<String, dynamic> toJson(AICheckResult checkResult) {
    return {
      'classification':
          checkResult.classification == AIClassification.veryUnlikely
              ? 'veryUnlikely'
              : checkResult.classification == AIClassification.unlikely
                  ? 'unlikely'
                  : checkResult.classification == AIClassification.unclear
                      ? 'unclear'
                      : checkResult.classification == AIClassification.possibly
                          ? 'possibly'
                          : 'likely',
      'score': checkResult.score,
    };
  }
}
