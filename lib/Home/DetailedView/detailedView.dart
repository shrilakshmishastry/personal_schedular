import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_schedular/Home/DetailedView/UI/listTileDetail.dart';
import 'package:personal_schedular/config/Theme/colors.dart';
import 'package:personal_schedular/config/Theme/custom_theme.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';
import 'package:personal_schedular/redux/models/event_info.dart';

class DetailedView extends StatelessWidget {
  final EventInfo _eventInfo;
  DetailedView(this._eventInfo);

  List<Color> _borderLightModeCardColor = [
    Color(0xff0C8078),
    Color(0xff400E0D),
    Color(0xff545C65),
    Color(0xff800000),
    Color(0xff214680)
  ];
  List<Color> _bgLightModeCardColor = [
    Color(0xffD6FCF8),
    Color(0xffDACECE),
    Color(0xffEEF1F4),
    Color(0xffFFD1CE),
    Color(0xffDDE9FE)
  ];

  @override
  Widget build(BuildContext context) {
    List<Color> _borderCardColor = CustomTheme.isDarkTheme
        ? _bgLightModeCardColor
        : _borderLightModeCardColor;

    List<Color> _bgCardColor = CustomTheme.isDarkTheme
        ? _borderLightModeCardColor
        : _bgLightModeCardColor;

    ThemeData theme = Theme.of(context);
    double width = setWidth(context);
    double height = setHeight(context);
    Color iconColor = theme.primaryColorDark;
    Color iconBg = theme.primaryColorLight;

    Color textColor =
        CustomTheme.isDarkTheme ? Colors.white : ColorsSchedular.dark;

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
                    color: iconBg,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30.0)),
                  ),
                  padding:
                      EdgeInsets.only(top: width * 0.09, bottom: width * 0.09),
                  child: ListTileDetail(
                    Icons.title,
                    _eventInfo.title,
                    22.0,
                    iconColor,
                    iconBg,
                    iconColor,
                  ),
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
                  textColor,
                  _borderCardColor[1],
                  _bgCardColor[1]),

              SizedBox(
                height: height * 0.04,
              ),
              // time
              ListTileDetail(Icons.watch_later, _eventInfo.time.toString(),
                  16.0, textColor, _borderCardColor[0], _bgCardColor[0]),

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
                      textColor,
                      _borderCardColor[2],
                      _bgCardColor[2]),

              SizedBox(
                height: height * 0.04,
              ),
              // description

              ListTileDetail(Icons.subject, _eventInfo.description.toString(),
                  16.0, textColor, _borderCardColor[3], _bgCardColor[3]),
            ],
          ))
        ],
      ),
    );
  }
}
