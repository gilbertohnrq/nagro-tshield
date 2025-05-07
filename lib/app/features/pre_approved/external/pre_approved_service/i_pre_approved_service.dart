// coverage:ignore-file

import 'package:finan/app/features/pre_approved/infra/models/banks_pre_approved.dart';
import 'package:finan/app/features/pre_approved/infra/models/client_pre_approved.dart';
import 'package:finan/app/features/pre_approved/infra/models/from_simulate.dart';
import 'package:finan/app/features/pre_approved/infra/models/to_simulate.dart';

abstract class IPreApprovedService {
  Future<FromSimulate> simulate(ToSimulate data);
  Future<bool> updateClient(ClientePreApprovedModel data);
  Future<List<BanksPreApprovedModel>> getBanks();
}
