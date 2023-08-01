class HomeStates {
  final int index;

  HomeStates({this.index = 0});

  HomeStates copyWith({int? index}) {
    return HomeStates(
      index: index ?? this.index,
    );
  }
}
