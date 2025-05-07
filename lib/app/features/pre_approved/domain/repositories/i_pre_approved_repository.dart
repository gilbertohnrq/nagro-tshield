// coverage:ignore-file
import 'package:finan/app/features/pre_approved/domain/failures/pre_approved_failures.dart';
import 'package:finan/app/features/pre_approved/infra/models/banks_pre_approved.dart';
import 'package:finan/app/features/pre_approved/infra/models/client_pre_approved.dart';
import 'package:finan/app/features/pre_approved/infra/models/from_simulate.dart';
import 'package:finan/app/features/pre_approved/infra/models/to_simulate.dart';
import 'package:result_dart/result_dart.dart';

abstract class IPreApprovedRepository {
  AsyncResult<FromSimulate, PreApprovedFailure> simulate(ToSimulate data);
  AsyncResult<bool, PreApprovedFailure> updateClient(ClientePreApprovedModel data);
  AsyncResult<List<BanksPreApprovedModel>, PreApprovedFailure> getBanks();
}
