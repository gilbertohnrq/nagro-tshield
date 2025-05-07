// coverage:ignore-file
//coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NagroBlocBuilder<B extends Cubit<S>, S> extends StatelessWidget {
  final B bloc;
  final BlocWidgetBuilder<S> builder;

  const NagroBlocBuilder({
    super.key,
    required this.bloc,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      bloc: bloc,
      builder: builder,
    );
  }
}