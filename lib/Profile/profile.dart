import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_schedular/Profile/PastEvent/index.dart';
import 'package:personal_schedular/config/Theme/colors.dart';
import 'package:personal_schedular/config/Theme/configTheme.dart';
import 'package:personal_schedular/config/Theme/custom_theme.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';
import 'package:personal_schedular/redux/actions/profile_add.dart';
import 'package:personal_schedular/redux/store.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color iconColor = theme.primaryColorDark;
    Color iconBg = theme.primaryColorLight;
    double height = setHeight(context);
    double width = setWidth(context);
    AppState store = Redux.store.state;
    int index = store.appState.userInfo!.email!.indexOf("@");
    String name = store.appState.userInfo!.email!.substring(0, index);

    return Container(
      padding: EdgeInsets.only(
          top: height * 0.05, left: width * 0.05, right: width * 0.05),
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              // email

              Text(
                "Hi ,\t" + name,
                style: Theme.of(context).textTheme.headline2,
              ),

              SizedBox(
                height: height * 0.09,
              ),

              // avtar and joined date

              Container(
                padding:
                    EdgeInsets.only(left: width * 0.09, right: width * 0.1),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        width: width * 0.01,
                        color: ColorsSchedular.primaryLight2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Joined", style: theme.textTheme.bodyText1),
                    Text(
                        DateFormat.yMMMMEEEEd()
                            .format(DateTime.parse(store
                                .appState.userInfo!.joinedDate
                                .toString()
                                .substring(0, 10)))
                            .toString(),
                        style: theme.textTheme.headline6),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.14,
              ),

              // Theme

              ListTile(
                horizontalTitleGap: width * 0.1,
                leading: Container(
                  padding: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03))),
                  child: Icon(
                    Icons.dark_mode,
                    color: iconColor,
                  ),
                ),
                title: Text("Dark Mode", style: theme.textTheme.headline6),
                trailing: Switch(
                    activeColor: theme.primaryColorDark,
                    activeTrackColor: theme.primaryColorLight,
                    inactiveTrackColor: theme.primaryColorLight,
                    inactiveThumbColor: Colors.white,
                    value: CustomTheme.isDarkTheme,
                    onChanged: (valu) => currentTheme.toggleTheme()),
              ),
              SizedBox(
                height: height * 0.03,
              ),

              // Notification sound select

              ListTile(
                horizontalTitleGap: width * 0.1,
                leading: Container(
                  padding: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03))),
                  child: Icon(
                    Icons.notifications_active,
                    color: iconColor,
                  ),
                ),
                title: Text("Notification Sound",
                    style: theme.textTheme.headline6),
              ),
              SizedBox(
                height: height * 0.03,
              ),

              // about

              ListTile(
                horizontalTitleGap: width * 0.1,
                leading: Container(
                  padding: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03))),
                  child: Icon(Icons.info, color: iconColor),
                ),
                title: Text("About", style: theme.textTheme.headline6),
              ),
              SizedBox(
                height: height * 0.03,
              ),

              // past events

              ListTile(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return PastEventIndex();
                  }));
                },
                horizontalTitleGap: width * 0.1,
                leading: Container(
                  padding: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03))),
                  child: Icon(
                    Icons.watch_later,
                    color: iconColor,
                  ),
                ),
                title: Text("Past Events", style: theme.textTheme.headline6),
              ),

              SizedBox(
                height: height * 0.03,
              ),

              // logout button

              TextButton(
                onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title:
                              Text("Logout", style: theme.textTheme.headline6),
                          content:
                              const Text("Are you sure , you want to logout?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style:
                                      TextStyle(color: ColorsSchedular.primary),
                                )),
                            TextButton(
                                onPressed: () {
                                  Redux.store.dispatch(ProfileRemoveAction());
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Yes",
                                  style:
                                      TextStyle(color: ColorsSchedular.primary),
                                ))
                          ],
                        )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Icon(
                      Icons.logout,
                      color: ColorsSchedular.primary,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(color: ColorsSchedular.primary),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
