import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/checks/check_result.dart';
import '../../domain/failures/checks/check_failure.dart';
import '../../domain/repositories/checks/check_facade.dart';
import '../../injection.dart';

part 'check_document.g.dart';

@riverpod
CheckDocument checkDocumentUseCase(
  CheckDocumentUseCaseRef ref,
) {
  return getIt<CheckDocument>();
}

@lazySingleton
class CheckDocument {
  final CheckFacade _checkFacade;

  CheckDocument(
    this._checkFacade,
  );

  Future<Either<CheckFailure, CheckResult>> call(
    String text,
  ) async {
    final aiCheckResultOrFailure = await _checkFacade.checkAIClassification(
      text,
    );

    return aiCheckResultOrFailure.fold(
      (failure) => left(failure),
      (aiCheckResult) => right(CheckResult(ai: aiCheckResult)),
    );
  }
}
