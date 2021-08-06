import 'package:flutter/material.dart';
import 'package:personal_schedular/redux/models/event_info.dart';
import 'package:personal_schedular/redux/schedular_state.dart';
import 'package:personal_schedular/redux/store.dart';
import 'package:redux/redux.dart';

// class to give action for  event list add
@immutable
class EventAddAction {
  final List<EventInfo>? event;
  EventAddAction(this.event);
}

Future<void> createListOfEvents(Store<AppState> state, EventInfo event) async {
  SchedularState newState = state.state.appState;
  newState.events!.add(event);
  await state.dispatch(EventAddAction(newState.events));
}

@immutable
class EventRemoveAction {
  final List<EventInfo>? event;
  EventRemoveAction(this.event);
}

Future<void> removeEventFromList(Store<AppState> state, String title) async {
  SchedularState newState = state.state.appState;
  dynamic eList;
  for (int i = 0; i < newState.events!.length; i++) {
    if (newState.events?[i].title == title) {
      eList = i;
    }
  }
  newState.events?.removeAt(eList);
  await state.dispatch(EventRemoveAction(newState.events));
}
