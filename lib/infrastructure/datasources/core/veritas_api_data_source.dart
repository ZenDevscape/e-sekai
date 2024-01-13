import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class EsekaiApiDataSource {
  Future<Map<String, dynamic>> checkAIClassification(String text);
}

@LazySingleton(as: EsekaiApiDataSource)
class EsekaiApiDataSourceImpl implements EsekaiApiDataSource {
  final Dio _dio;

  const EsekaiApiDataSourceImpl(
    this._dio,
  );

  @override
  Future<Map<String, dynamic>> checkAIClassification(String text) async {
    final Response<String> response = await _dio.post(
      Uri(
        scheme: 'https',
        host: 'openai-detector.niwabi.my.id',
        path: '/detect',
      ).toString(),
      data: {
        'text': text,
      },
    );

    return jsonDecode(response.data ?? '') as Map<String, dynamic>;
  }
}
