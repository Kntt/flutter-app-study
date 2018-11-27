
import 'package:redux/redux.dart';

final tokenReducer = combineReducers<String>([
  TypedReducer<String, UpdateTokenAction>(_updateToken),
]);


String _updateToken(String token, action) {
  token = action.token;
  return token;
}

class UpdateTokenAction {
  final String token;
  UpdateTokenAction(this.token);
}
