// coverage:ignore-file
import 'package:finan/app/features/pre_approved/domain/failures/cep_failures.dart';
import 'package:finan/app/features/pre_approved/domain/repositories/i_cep_repository.dart';
import 'package:finan/app/features/pre_approved/external/cep_service/i_cep_service.dart';
import 'package:finan/app/features/pre_approved/external/exceptions/cep_exceptions.dart';
import 'package:finan/app/features/pre_approved/infra/models/get_address/get_address_request.dart';
import 'package:finan/app/features/pre_approved/infra/models/get_address/get_address_response.dart';
import 'package:result_dart/result_dart.dart';

class ImpCepRepository implements ICepRepository {
  final ICepService _service;

  ImpCepRepository({required ICepService service})
      : _service = service;

  @override
  AsyncResult<GetAddressResponse, CepFailure> getAddress(GetAddressRequest getAddressRequest) async {
    try {
      final GetAddressResponse response = await _service.getAddress(getAddressRequest);
      return Success(response);
    } on NotFoundException {
      return Failure(CepNotFound());
    } on InternalServerException {
      return Failure(NotAuthorized());
    } on InvalidDataException {
      return Failure(InvalidData());
    }
  }
}
