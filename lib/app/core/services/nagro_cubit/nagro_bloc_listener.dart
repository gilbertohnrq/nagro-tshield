// coverage:ignore-file
//coverage:ignore-file

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class NagroBlocListener<B extends Cubit<S>, S> extends StatelessWidget {
  final B bloc;
  final BlocWidgetListener<S> listener;
  final Widget child;

  const NagroBlocListener({
    super.key,
    required this.bloc,
    required this.listener,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      bloc: bloc,
      listener: listener,
      child: child,
    );
  }
}
