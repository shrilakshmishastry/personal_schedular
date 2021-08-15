import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_schedular/Home/DetailedView/index.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';
import 'package:personal_schedular/redux/actions/EventAction.dart';
import 'package:personal_schedular/redux/models/event_info.dart';
import 'package:personal_schedular/redux/store.dart';

class ListTileSchedule extends StatelessWidget {
  final EventInfo eventInfo;
  final Color _bgColor;
  final Color _borderColor;
  ListTileSchedule(this.eventInfo, this._bgColor, this._borderColor);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    int _showDate = eventInfo.dateTime
        .toString()
        .substring(0, 10)
        .compareTo(DateTime.now().toString().substring(0, 10));
    dynamic height = setHeight(context);
    return Card(
        color: _bgColor,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new DetailedViewIndex(eventInfo)));
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: _borderColor, width: setWidth(context) * 0.02))),
            child: ListTile(
              minVerticalPadding: height * 0.02,
              trailing: Column(children: [
                SizedBox(
                  height: height * 0.009,
                ),
                TextButton(
                  onPressed: () {
                    Redux.store.dispatch(
                        removeEventFromList(Redux.store, eventInfo.title));
                  },
                  child: Icon(
                    Icons.delete_forever,
                    color: _borderColor,
                    size: height * 0.04,
                  ),
                )
              ]),
              title: Text(
                eventInfo.title.toString(),
                style: theme.textTheme.bodyText1,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _showDate == 0
                      ? SizedBox.shrink()
                      : Text(DateFormat.yMMMMEEEEd()
                              .format(DateTime.parse(eventInfo.dateTime
                                  .toString()
                                  .substring(0, 10)))
                              .toString() +
                          "\t\tat\t"),
                  Text(
                    eventInfo.time.toString(),
                    style: theme.textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: height * 0.009,
                  ),
                  Text(
                    eventInfo.meetLink == null || eventInfo.meetLink!.isEmpty
                        ? eventInfo.address.toString()
                        : eventInfo.meetLink.toString(),
                    style: TextStyle(color: _borderColor),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          ),
        ));
  }
}
