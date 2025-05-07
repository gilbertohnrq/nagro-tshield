// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:finan/app/features/pre_approved/external/cep_service/i_cep_service.dart';
import 'package:finan/app/features/pre_approved/external/exceptions/cep_exceptions.dart';
import 'package:finan/app/features/pre_approved/infra/models/get_address/get_address_request.dart';
import 'package:finan/app/features/pre_approved/infra/models/get_address/get_address_response.dart';

class CepService extends ICepService {
  Map<int, CepException> exceptions = {
    404: NotFoundException(),
    500: InternalServerException(),
    403: ForbiddenException(),
    503: ServiceUnavailableException()
  };

  @override
  Future<GetAddressResponse> getAddress(
      GetAddressRequest getAddressRequest) async {
    try {
      return GetAddressResponse.mocked();
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
