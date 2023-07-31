class AppStates {
  final int index;

  const AppStates({this.index = 0});

  AppStates reload(i) {
    return AppStates(index: i);
  }
}
