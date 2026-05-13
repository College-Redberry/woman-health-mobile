import 'package:result_dart/result_dart.dart';

import 'package:woman_health/domain/models/cycle.dart';
import 'package:woman_health/domain/repositories/cycle.dart';

class HttpCycleRepository implements CycleRepository {
  HttpCycleRepository();

  @override
  AsyncResult<MenstrualCycle> getCicleByUserId(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(MenstrualCycle(avarageDuration: 20, avaragePeriodDuration: 5, lastCicle: DateTime.now(), regularity: "Regular"));
  }
}