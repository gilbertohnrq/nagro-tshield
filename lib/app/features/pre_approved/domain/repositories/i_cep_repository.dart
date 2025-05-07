// coverage:ignore-file
import 'package:finan/app/features/pre_approved/domain/failures/cep_failures.dart';
import 'package:finan/app/features/pre_approved/infra/models/get_address/get_address_request.dart';
import 'package:finan/app/features/pre_approved/infra/models/get_address/get_address_response.dart';
import 'package:result_dart/result_dart.dart';

abstract class ICepRepository {
  AsyncResult<GetAddressResponse, CepFailure> getAddress(GetAddressRequest getAddressRequest);
}
