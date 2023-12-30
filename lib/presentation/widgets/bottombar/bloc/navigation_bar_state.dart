part of 'navigation_bar_bloc.dart';

final class NavigationBarState extends Equatable {
  final int selectedIndex;

  const NavigationBarState({this.selectedIndex = 0});

  NavigationBarState copyWith({int? newSelectedIndex}) =>
      NavigationBarState(selectedIndex: newSelectedIndex ?? selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}
