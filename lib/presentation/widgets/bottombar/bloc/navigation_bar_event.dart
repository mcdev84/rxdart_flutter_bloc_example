part of 'navigation_bar_bloc.dart';

@immutable
sealed class NavigationBarEvent {}

class NavigationBarEventSelectedIndex extends NavigationBarEvent {
  final int newSelectedIndex;

  NavigationBarEventSelectedIndex(this.newSelectedIndex);
}
