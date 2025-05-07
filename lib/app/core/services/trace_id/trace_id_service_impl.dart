// coverage:ignore-file
import 'package:finan/app/core/services/local_data/local_data_service.dart';
import 'package:finan/app/core/services/trace_id/trace_id_service.dart';
import 'package:uuid/uuid.dart';

class TraceIdServiceImpl implements ITraceIdService {
  final ILocalDataService _localDataService;

  TraceIdServiceImpl({required ILocalDataService localDataService})
      : _localDataService = localDataService;

  @override
  Future<void> generateHash() async {
    const uuid = Uuid();
    _localDataService.save('traceId', uuid.v4());
  }

  @override
  Future<String?> generateTraceid() async {
    return _localDataService.get('traceId');
  }
}
