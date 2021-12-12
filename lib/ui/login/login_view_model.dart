import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_sample/ui/util/event.dart';
import 'package:mvvm_sample/ui/util/state.dart';

class LoginViewModel extends ChangeNotifier {

  var _uiState = UiState.Idle;

  UiState get uiState => _uiState;

  bool get isLogging => uiState == UiState.Loading;

  final _loginSuccessAction = StreamController<Event>();

  StreamController<Event> get loginSuccessAction => _loginSuccessAction;

  void login() {
    _uiState = UiState.Loading;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 1500)).then((_) {
      _uiState = UiState.Loaded;
      notifyListeners();

      _loginSuccessAction.sink.add(Event());
    });
  }

  @override
  void dispose() {
    _loginSuccessAction.close();
    super.dispose();
  }
}
