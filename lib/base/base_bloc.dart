import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<T> extends BlocBase {
  final _stateController = StreamController.broadcast();
  late T _state;

  BaseBloc(state) : super(state);

  T get state => _state;
  Stream<T> get observableState => _stateController.stream.cast();

  @protected
  void changeState(T state) {
    _state = state;
    _stateController.sink.add(state);
  }

  void dispose() {
    _stateController.close();
  }
}
