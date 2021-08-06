import 'package:personal_schedular/redux/actions/profile_add.dart';
import 'package:personal_schedular/redux/models/user_info.dart';
import 'package:personal_schedular/redux/schedular_state.dart';

profileReducer(SchedularState previousState, ProfileAddAction action) {
  final payload = action.userProfile;
  return previousState.copyWith(
      userInfo: payload,
      events: null,
    );
}

profileRemoveReducer(SchedularState previusState) {
  return previusState.copyWith(
      userInfo: UserInfo(),
      events: null,
     );
}
