import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'navigation_bar_event.dart';

part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(const NavigationBarState()) {
    on<NavigationBarEventSelectedIndex>((event, emit) {
      emit(state.copyWith(newSelectedIndex: event.newSelectedIndex));
    });
  }
}
