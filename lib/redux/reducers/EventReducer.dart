import 'package:personal_schedular/redux/actions/EventAction.dart';
import 'package:personal_schedular/redux/schedular_state.dart';

eventAddReducer(SchedularState prevState, EventAddAction action) {
  return prevState.copyWith(
    userInfo: null,
    events: action.event,
  );
}

eventRemoveReducer(SchedularState prevState, EventRemoveAction action) {
  return prevState.copyWith(
    userInfo: null,
    events: action.event,
  );
}

eventUpdateReducer(SchedularState prevState, EventUpdateAction action) {
  return prevState.copyWith(userInfo: null, events: action.event);
}
