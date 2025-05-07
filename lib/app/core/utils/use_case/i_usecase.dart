// coverage:ignore-file
//coverage:ignore-file

import 'package:result_dart/result_dart.dart';

abstract class IUsecase<Output extends AsyncResult, Input> {
  Output call(Input params);
}
