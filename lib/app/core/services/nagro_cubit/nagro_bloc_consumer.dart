// coverage:ignore-file
//coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NagroBlocConsumer<B extends Cubit<S>, S> extends StatelessWidget {
  final B bloc;
  final BlocWidgetBuilder<S> builder;
  final BlocWidgetListener<S> listener;
  final bool Function(S, S)? listenWhen;
  final bool Function(S, S)? buildWhen;

  const NagroBlocConsumer({
    super.key,
    required this.bloc,
    required this.builder,
    required this.listener,
    this.listenWhen,
    this.buildWhen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      bloc: bloc,
      builder: builder,
      listener: listener,
      listenWhen: listenWhen,
      buildWhen: buildWhen,
    );
  }
}
