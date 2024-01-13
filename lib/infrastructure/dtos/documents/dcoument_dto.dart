import '../../../domain/entities/documents/document.dart';
import '../checks/check_dto.dart';

class DocumentDto {
  static Document fromJson(String id, Map<Object?, Object?> json) {
    return Document(
      id: id,
      title: json['title'] as String,
      text: json['text'] as String,
      checkResult: json['checkResult'] != null
          ? CheckResultDto.fromJson(
              json['checkResult'] as Map<Object?, Object?>)
          : null,
      lastCheckedAt: json['lastCheckedAt'] != null
          ? DateTime.parse(json['lastCheckedAt'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  static Map<String, dynamic> toJson(Document document) {
    return {
      'title': document.title,
      'text': document.text,
      'checkResult': document.checkResult != null
          ? CheckResultDto.toJson(document.checkResult!)
          : null,
      'lastCheckedAt': document.lastCheckedAt?.toIso8601String(),
      'createdAt': document.createdAt.toIso8601String(),
      'updatedAt': document.updatedAt.toIso8601String(),
    };
  }
}
