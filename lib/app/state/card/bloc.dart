import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class CardStackBloc extends Bloc<CardStackEvent, CardStackState> {
  CardStackBloc() : super(CardStackState()) {
    on<InitializeStack>((event, emit) => _onInitializeStack(event, emit));
    on<ToggleCardRotation>((event, emit) => _onToggleCardRotation(event, emit));
    on<ToggleScrollBar>((event, emit) => _onToggleScrollBar(event, emit));
  }

  void _onInitializeStack(InitializeStack event, Emitter<CardStackState> emit) {
    // Initialize the stack with some cards
    emit(state.copyWith(numberOfCards: 6));
  }

  void _onToggleCardRotation(
      ToggleCardRotation event, Emitter<CardStackState> emit) {
    // Toggle the rotation state
    emit(state.copyWith(isRotated: !state.isRotated));
  }

  void _onToggleScrollBar(ToggleScrollBar event, Emitter<CardStackState> emit) {
    // Toggle the scroll bar visibility
    emit(state.copyWith(showScrollBar: !state.showScrollBar));
  }
}
