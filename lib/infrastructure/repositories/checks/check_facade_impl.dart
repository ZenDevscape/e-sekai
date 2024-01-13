import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/checks/check_result.dart';
import '../../../domain/failures/checks/check_failure.dart';
import '../../../domain/repositories/checks/check_facade.dart';
import '../../datasources/core/esekai_api_data_source.dart';
import '../../dtos/checks/check_dto.dart';

@LazySingleton(as: CheckFacade)
class CheckFacadeImpl implements CheckFacade {
  final EsekaiApiDataSource _esekaiApiDataSource;

  const CheckFacadeImpl(
    this._esekaiApiDataSource,
  );

  @override
  Future<Either<CheckFailure, AICheckResult>> checkAIClassification(
    String text,
  ) async {
    try {
      final Map<String, dynamic> result =
          await _esekaiApiDataSource.checkAIClassification(text);

      return right(AICheckResultDto.fromApiJson(result));
    } catch (e) {
      return left(const CheckFailure.unexpected());
    }
  }
}
