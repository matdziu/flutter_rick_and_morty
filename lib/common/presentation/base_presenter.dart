import 'dart:async';

import 'package:rick_and_morty/common/presentation/base_event.dart';
import 'package:rick_and_morty/common/presentation/base_state.dart';

abstract class BasePresenter {
  final StreamController<BaseEvent> _eventsStreamController =
      StreamController.broadcast();

  final StreamController<BaseState> _statesStreamController =
      StreamController.broadcast();

  Stream<BaseState> get statesStream => _statesStreamController.stream;

  final BaseState initialState;

  BasePresenter({required this.initialState}) {
    _startListeningForEvents();
  }

  void _startListeningForEvents() {
    _eventsStreamController.stream
        .asyncExpand((event) => mapEventToState(event))
        .listen((state) {
      _statesStreamController.add(state);
    });
  }

  void pushEvent(BaseEvent event) {
    _eventsStreamController.add(event);
  }

  Stream<BaseState> mapEventToState(BaseEvent event);

  void dispose() {
    _eventsStreamController.close();
    _statesStreamController.close();
  }
}
