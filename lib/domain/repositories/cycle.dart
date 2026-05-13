import 'package:result_dart/result_dart.dart';

import 'package:woman_health/domain/models/cycle.dart';

abstract interface class CycleRepository {
  AsyncResult<MenstrualCycle> getCicleByUserId(String id);
}