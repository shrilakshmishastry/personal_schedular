import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_schedular/Home/DetailedView/UI/listTileDetail.dart';
import 'package:personal_schedular/config/Theme/colors.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';
import 'package:personal_schedular/redux/models/event_info.dart';

class DetailedView extends StatelessWidget {
  final EventInfo _eventInfo;
  DetailedView(this._eventInfo);

  @override
  Widget build(BuildContext context) {
    double width = setWidth(context);
    double height = setHeight(context);
    return Container(
      padding: EdgeInsets.only(),
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsSchedular.primaryLight1,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30.0)),
                  ),
                  padding:
                      EdgeInsets.only(top: width * 0.09, bottom: width * 0.09),
                  child: ListTileDetail(
                      Icons.title,
                      _eventInfo.title,
                      22.0,
                      ColorsSchedular.primary,
                      Colors.white,
                      ColorsSchedular.primary),
                ),
              ),

              SizedBox(
                height: height * 0.05,
              ),

              // date

              ListTileDetail(
                  Icons.calendar_today,
                  DateFormat.yMMMMEEEEd()
                      .format(DateTime.parse(
                          _eventInfo.dateTime.toString().substring(0, 10)))
                      .toString(),
                  16.0,
                  Colors.black,
                  Color(0xff400E0D),
                  Color(0xffDACECE)),

              SizedBox(
                height: height * 0.04,
              ),
              // time
              ListTileDetail(
                  Icons.watch_later,
                  _eventInfo.time.toString(),
                  16.0,
                  Colors.black,
                  ColorsSchedular.skin,
                  ColorsSchedular.skinLight2),

              SizedBox(
                height: height * 0.04,
              ),
              // meetlink or address

              _eventInfo.meetLink!.isEmpty || _eventInfo.meetLink == null
                  ? ListTileDetail(Icons.room, _eventInfo.address.toString(),
                      16.0, Colors.black, Color(0xff40E0D0), Color(0xffD6FCF8))
                  : ListTileDetail(
                      Icons.call_to_action,
                      _eventInfo.meetLink.toString(),
                      16.0,
                      Colors.black,
                      Color(0xff40E0D0),
                      Color(0xffD6FCF8)),

              SizedBox(
                height: height * 0.04,
              ),
              // description

              ListTileDetail(Icons.subject, _eventInfo.description.toString(),
                  16.0, Colors.black, Color(0xff214680), Color(0xffDDE9FE)),
            ],
          ))
        ],
      ),
    );
  }
}
