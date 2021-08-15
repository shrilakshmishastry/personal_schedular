import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:personal_schedular/config/Routes/bottomTab.dart';
import 'package:personal_schedular/config/Theme/custom_theme.dart';
import 'package:personal_schedular/config/Theme/configTheme.dart';
import 'package:personal_schedular/redux/schedular_state.dart';
import 'package:personal_schedular/redux/store.dart';
import 'LoginHandler/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Redux.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Redux.store.state.appState.userInfo?.email);
    return StoreProvider<AppState>(
        store: Redux.store,
        child: StoreConnector<AppState, SchedularState>(
          converter: (state) => state.state.appState,
          builder: (context, appState) {
            return MaterialApp(
              home: appState.userInfo?.email == null
                  ? LoginHandler()
                  : BottomTabSchedular(),
              title: 'Flutter Demo',
              theme: CustomTheme.lightTheme,
              darkTheme: CustomTheme.darkTheme,
              themeMode: currentTheme.currentTheme,
            );
          },
        ));
  }
}
