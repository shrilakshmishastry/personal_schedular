import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_schedular/Home/home.dart';
import 'package:personal_schedular/config/Theme/colors.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';
import 'package:personal_schedular/redux/actions/profile_add.dart';
import 'package:personal_schedular/redux/store.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = setHeight(context);
    double width = setWidth(context);
    AppState store = Redux.store.state;
    int index = store.appState.userInfo!.email!.indexOf("@");
    String name = store.appState.userInfo!.email!.substring(0, index);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          top: height * 0.05, left: width * 0.05, right: width * 0.05),
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              // email

              Text(
                "Hi ,",
                style: TextStyle(
                  color: ColorsSchedular.dark,
                  fontSize: ColorsSchedular.text_xxx_lg,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: ColorsSchedular.primary,
                  fontSize: ColorsSchedular.text_xxx_lg,
                ),
                softWrap: true,
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
                    Text(
                      "Joined",
                      style: TextStyle(
                        fontSize: ColorsSchedular.text_md,
                        color: ColorsSchedular.cement,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd()
                          .format(DateTime.parse(store
                              .appState.userInfo!.joinedDate
                              .toString()
                              .substring(0, 10)))
                          .toString(),
                      style: TextStyle(
                          fontSize: ColorsSchedular.text_lg,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.14,
              ),

              // upcoming events link

              ListTile(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return Home();
                  }));
                },
                horizontalTitleGap: width * 0.1,
                leading: Container(
                  padding: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                      color: ColorsSchedular.skinLight1,
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03))),
                  child: Icon(
                    Icons.alarm,
                    color: ColorsSchedular.skin,
                  ),
                ),
                title: Text("Upcoming"),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return Home();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: ColorsSchedular.primary,
                      size: height * 0.06,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),

              // past events

              ListTile(
                onTap: () {
                  print("past events");
                  // Navigator.push(context,
                  //     new MaterialPageRoute(builder: (BuildContext context) {
                  //   return Home();
                  // }));
                },
                horizontalTitleGap: width * 0.1,
                leading: Container(
                  padding: EdgeInsets.all(width * 0.02),
                  decoration: BoxDecoration(
                      color: ColorsSchedular.skinLight1,
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03))),
                  child: Icon(
                    Icons.watch_later,
                    color: ColorsSchedular.skin,
                  ),
                ),
                title: Text("Past Events"),
                trailing: TextButton(
                  onPressed: () {
                    print("Past events Pressed");
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: ColorsSchedular.primary,
                      size: height * 0.06,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),

              // logout button

              TextButton(
                  onPressed: () {
                    Redux.store.dispatch(ProfileRemoveAction());
                  },
                  child: Container(
                    padding: EdgeInsets.all(width * 0.02),
                    color: ColorsSchedular.primaryLight1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                  )),
            ],
          ))
        ],
      ),
    );
  }
}
