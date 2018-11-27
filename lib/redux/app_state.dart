class AppState {
  final String token;
  
  AppState({
    this.token,
  });

  factory AppState.initial() {
    return AppState(
      token: null,
    );
  }
  @override
  String toString() {
    return "token: $token";
  }
}