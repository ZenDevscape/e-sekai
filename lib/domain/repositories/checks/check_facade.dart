import 'package:dartz/dartz.dart';

import '../../entities/checks/check_result.dart';
import '../../failures/checks/check_failure.dart';

abstract class CheckFacade {
  Future<Either<CheckFailure, AICheckResult>> checkAIClassification(
    String text,
  );
}
