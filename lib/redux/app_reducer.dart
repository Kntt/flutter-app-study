
import 'package:xiaofaner/redux/app_state.dart';
import 'package:xiaofaner/redux/reducers/TokenReducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    token: tokenReducer(state.token, action),
  );
}