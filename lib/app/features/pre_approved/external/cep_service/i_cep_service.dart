// coverage:ignore-file

import 'package:finan/app/features/pre_approved/infra/models/get_address/get_address_request.dart';
import 'package:finan/app/features/pre_approved/infra/models/get_address/get_address_response.dart';

abstract class ICepService {
  Future<GetAddressResponse> getAddress(GetAddressRequest getAddressRequest);
}
