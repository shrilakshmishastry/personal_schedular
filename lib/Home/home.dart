import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:personal_schedular/Home/Ui/listTileSchedule.dart';
import 'package:personal_schedular/config/Theme/colors.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';
import 'package:personal_schedular/redux/models/event_info.dart';
import 'package:personal_schedular/redux/store.dart';

class Home extends StatelessWidget {
  List<Color> _borderCardColor = [
    Color(0xff40E0D0),
    Color(0xff400E0D),
    Color(0xff545C65),
    Color(0xff800000),
    Color(0xff214680)
  ];
  List<Color> _bgCardColor = [
    Color(0xffD6FCF8),
    Color(0xffDACECE),
    Color(0xffEEF1F4),
    Color(0xffFFD1CE),
    Color(0xffDDE9FE)
  ];

  TextStyle headingStyle = TextStyle(
    color: ColorsSchedular.dark,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  List e = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 100; i++) {
      e.add(i);
    }
    dynamic height = setHeight(context);
    dynamic width = setWidth(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            top: height * 0.04, left: width * 0.05, right: width * 0.05),
        child: Column(children: [
          Expanded(
              child: ListView(
            children: [
              // title ans avatar

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Schedules",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(color: Colors.black),
                  ),
                  CircleAvatar(
                    backgroundColor: ColorsSchedular.primaryLight1,
                    child: Text(
                      Redux.store.state.appState.userInfo!.email![0].toString(),
                      style: TextStyle(color: ColorsSchedular.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),

              StoreConnector<AppState, List<EventInfo>?>(
                converter: (store) => store.state.appState.events,
                builder: (context, events) {
                  String? email = Redux.store.state.appState.userInfo?.email;
                  print(email);
                  List eTodayList = [];
                  List eUpcomingList = [];
                  if (events != null) {
                    for (int i = 0; i < events.length; i++) {
                      dynamic value = events[i]
                          .dateTime
                          .toString()
                          .substring(0, 10)
                          .compareTo(
                              DateTime.now().toString().substring(0, 10));
                      if (value == 1 && events[i].useremail == email) {
                        eUpcomingList.add(events[i]);
                      }
                      if (value == 0 && events[i].useremail == email) {
                        eTodayList.add(events[i]);
                      }
                    }
                  }
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Text(
                            "Today ," +
                                DateFormat.yMMMMEEEEd().format(DateTime.now()),
                            style: headingStyle,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),

                        // today's event list

                        Column(
                            children: eTodayList.length > 0
                                ? eTodayList.map((e) {
                                    return ListTileSchedule(
                                        e,
                                        _bgCardColor[eTodayList.indexOf(e) % 5],
                                        _borderCardColor[
                                            eTodayList.indexOf(e) % 5]);
                                  }).toList()
                                : [
                                    Center(
                                        child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                        Icon(
                                          Icons.event_busy,
                                          size: height * 0.09,
                                          color: ColorsSchedular.cement,
                                        ),
                                        SizedBox(
                                          height: height * 0.04,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.04),
                                          child: TextButton(
                                              onPressed: () {
                                                print("tapped");
                                              },
                                              child: Text(
                                                "No Activity ",
                                                style: TextStyle(
                                                    color:
                                                        ColorsSchedular.cement),
                                              )),
                                        ),
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                      ],
                                    ))
                                  ]),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Text(
                            "Upcoming Events",
                            style: headingStyle,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),

                        // upcoming event list

                        Column(
                            children: eUpcomingList.length > 0
                                ? eUpcomingList.map((e) {
                                    print(e);
                                    return ListTileSchedule(
                                        e,
                                        _bgCardColor[
                                            eUpcomingList.indexOf(e) % 5],
                                        _borderCardColor[
                                            eUpcomingList.indexOf(e) % 5]);
                                  }).toList()
                                : [
                                    Center(
                                        child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                        Icon(
                                          Icons.event_busy,
                                          size: height * 0.09,
                                          color: ColorsSchedular.cement,
                                        ),
                                        SizedBox(
                                          height: height * 0.04,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.04),
                                          child: TextButton(
                                              onPressed: () {
                                                print("tapped");
                                              },
                                              child: Text(
                                                "No Activity ",
                                                style: TextStyle(
                                                    color:
                                                        ColorsSchedular.cement),
                                              )),
                                        ),
                                        SizedBox(
                                          height: height * 0.05,
                                        ),
                                      ],
                                    ))
                                  ]),
                      ]);
                },
              ),
            ],
          )),
        ]),
      ),
    );
  }
}
