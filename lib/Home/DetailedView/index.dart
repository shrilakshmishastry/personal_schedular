import 'package:flutter/material.dart';
import 'package:personal_schedular/Home/DetailedView/detailedView.dart';
import 'package:personal_schedular/config/Theme/colors.dart';
import 'package:personal_schedular/redux/actions/EventAction.dart';
import 'package:personal_schedular/redux/models/event_info.dart';
import 'package:personal_schedular/redux/store.dart';

class DetailedViewIndex extends StatelessWidget {
  final EventInfo _eventInfo;

  DetailedViewIndex(this._eventInfo);

  @override
  Widget build(BuildContext context) {
    print(_eventInfo);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsSchedular.primaryLight1,
        iconTheme: IconThemeData(color: ColorsSchedular.primary),
        elevation: 0,
        automaticallyImplyLeading: true,
        actions: [
          PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == "Delete") {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text("Confirm"),
                            content: const Text("Delete the schedule?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    print("no delete");
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No')),
                              TextButton(
                                  onPressed: () {
                                    print("delete");
                                    Redux.store.dispatch(removeEventFromList(
                                        Redux.store, _eventInfo.title));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'))
                            ],
                          ));
                }
                if (value == "Edit") {
                  print("edit");
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      child: Text("Delete"),
                      value: "Delete",
                    ),
                    const PopupMenuItem<String>(
                      child: Text("Edit"),
                      value: "Edit",
                    ),
                  ])
        ],
      ),
      body: DetailedView(this._eventInfo),
    ));
  }
}
