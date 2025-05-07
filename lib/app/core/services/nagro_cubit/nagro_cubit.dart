// coverage:ignore-file
//coverage:ignore-file

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NagroCubit<State> extends Cubit<State> {
  NagroCubit(super.initialState);

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
