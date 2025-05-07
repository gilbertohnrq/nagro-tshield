import 'package:dio/dio.dart';
import 'package:finan/app/features/pre_approved/external/exceptions/pre_approved_exceptions.dart';
import 'package:finan/app/features/pre_approved/external/pre_approved_service/i_pre_approved_service.dart';
import 'package:finan/app/features/pre_approved/infra/models/banks_pre_approved.dart';
import 'package:finan/app/features/pre_approved/infra/models/client_pre_approved.dart';
import 'package:finan/app/features/pre_approved/infra/models/from_simulate.dart';
import 'package:finan/app/features/pre_approved/infra/models/to_simulate.dart';

class PreApprovedService extends IPreApprovedService {
  PreApprovedService();

  Map<int, PreApprovedException> exceptions = {
    404: NotFoundException(),
    500: InternalServerException(),
    403: ForbiddenException(),
    503: ServiceUnavailableException()
  };

  @override
  Future<FromSimulate> simulate(ToSimulate data) async {
    try {
      return FromSimulate.mocked();
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    } catch (e) {
      throw InvalidDataException();
    }
  }

  @override
  Future<bool> updateClient(ClientePreApprovedModel data) async {
    try {
      return true;
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    } catch (e) {
      throw InvalidDataException();
    }
  }

  @override
  Future<List<BanksPreApprovedModel>> getBanks() async {
    try {
      return BanksPreApprovedModel.listMocked();
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    } catch (e) {
      throw InvalidDataException();
    }
  }
}
