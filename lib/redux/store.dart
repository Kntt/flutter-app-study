import 'dart:async';

import 'package:xiaofaner/redux/app_reducer.dart';
import 'package:xiaofaner/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [new LoggingMiddleware.printer()],
  );
}