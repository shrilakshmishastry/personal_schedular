import 'dart:io';
import 'package:flutter/material.dart';
import 'package:personal_schedular/redux/actions/EventAction.dart';
import 'package:personal_schedular/redux/actions/profile_add.dart';
import 'package:meta/meta.dart';
import 'package:personal_schedular/redux/reducers/EventReducer.dart';
import 'package:personal_schedular/redux/reducers/profile_reducer.dart';
import 'package:personal_schedular/redux/schedular_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState store, dynamic action) {
  print(action);
  if (action is ProfileAddAction) {
    final nextState = profileReducer(store.appState, action);
    return store.copyWith(nextState);
  }
  if (action is EventAddAction) {
    final nextState = eventAddReducer(store.appState, action);
    return store.copyWith(nextState);
  }
  if (action is ProfileRemoveAction) {
    final nextState = profileRemoveReducer(store.appState);
    return store.copyWith(nextState);
  }
  if (action is EventRemoveAction) {
    final nextState = eventRemoveReducer(store.appState, action);
    return store.copyWith(nextState);
  }
  return store;
}

@immutable
class AppState {
  final SchedularState appState;
  AppState(this.appState);
  factory AppState.initial() => AppState(SchedularState.initial());

  AppState copyWith(SchedularState state) {
    return AppState(state);
  }

  static AppState fromJson(json) {
    if (json != null) {
      SchedularState app = SchedularState.fromJson(json);
      return AppState(app);
    } else {
      return AppState.initial();
    }
  }

  dynamic toJson() => this.appState.toJson();
}

class Redux {
  static var _store;
  static Future<void> init() async {
    // Future<Directory> path = getTemporaryDirectory();
    final appDocDir = await getApplicationDocumentsDirectory();
    // print(appDocDir.path.runtimeType);
    // final path = appDocDir;
    // print(appDocDir.path + "/store.json");
    final persistor = Persistor<AppState>(
      storage: FileStorage(File(appDocDir.path + "/store.json")),
      serializer: JsonSerializer<AppState>(AppState.fromJson),
      debug: true,
    );

    final appInitialState = await persistor.load();
    print(appInitialState?.appState);
    _store = Store<AppState>(appReducer,
        middleware: [
          thunkMiddleware,
          persistor.createMiddleware(),
        ],
        initialState: appInitialState ?? AppState(SchedularState.initial()));
  }

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("Store isn't initialized");
    } else {
      return _store;
    }
  }
}
