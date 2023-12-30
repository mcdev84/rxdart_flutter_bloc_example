import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'single_product_event.dart';
part 'single_product_state.dart';

class SingleProductBloc extends Bloc<SingleProductEvent, SingleProductState> {
  SingleProductBloc() : super(SingleProductInitial()) {
    on<SingleProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
