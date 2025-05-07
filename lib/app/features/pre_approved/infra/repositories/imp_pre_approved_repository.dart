import 'package:finan/app/features/pre_approved/domain/failures/pre_approved_failures.dart';
import 'package:finan/app/features/pre_approved/domain/repositories/i_pre_approved_repository.dart';
import 'package:finan/app/features/pre_approved/external/exceptions/pre_approved_exceptions.dart';
import 'package:finan/app/features/pre_approved/external/pre_approved_service/i_pre_approved_service.dart';
import 'package:finan/app/features/pre_approved/infra/models/banks_pre_approved.dart';
import 'package:finan/app/features/pre_approved/infra/models/client_pre_approved.dart';
import 'package:finan/app/features/pre_approved/infra/models/from_simulate.dart';
import 'package:finan/app/features/pre_approved/infra/models/to_simulate.dart';
import 'package:result_dart/result_dart.dart';
class ImpPreApprovedRepository implements IPreApprovedRepository {
  final IPreApprovedService _service;

  ImpPreApprovedRepository({required IPreApprovedService service})
      : _service = service;

  @override
  AsyncResult<FromSimulate, PreApprovedFailure> simulate(ToSimulate data) async {
    try {
      final FromSimulate response = await _service.simulate(data);
      return Success(response);
    } on NotFoundException {
      return Failure(PreApprovedNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    } on InvalidDataException {
      return Failure(InvalidData());
    }
  }

  @override
  AsyncResult<List<BanksPreApprovedModel>, PreApprovedFailure> getBanks() async {
    try {
      final List<BanksPreApprovedModel> response = await _service.getBanks();
      return Success(response);
    } on NotFoundException {
      return Failure(PreApprovedNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    } on InvalidDataException {
      return Failure(InvalidData());
    }
  }

  @override
  AsyncResult<bool, PreApprovedFailure> updateClient(ClientePreApprovedModel data) async {
    try {
      await _service.updateClient(data);
      return const Success(true);
    } on NotFoundException {
      return Failure(PreApprovedNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    } on InvalidDataException {
      return Failure(InvalidData());
    }
  }
}
