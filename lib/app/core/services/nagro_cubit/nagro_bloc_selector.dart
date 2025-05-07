// coverage:ignore_file

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NagroBlocSelector<B extends Cubit<S>, S, T> extends StatelessWidget {
  final B bloc;
  final Widget Function(BuildContext, T) builder;
  final T Function(S) selector;

  const NagroBlocSelector({
    super.key,
    required this.bloc,
    required this.builder,
    required this.selector,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<B, S, T>(
      bloc: bloc,
      builder: builder,
      selector: selector,
    );
  }
}
