import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_schedular/config/Theme/colors.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';
import 'package:intl/intl.dart';
import 'package:personal_schedular/redux/actions/EventAction.dart';
import 'package:personal_schedular/redux/models/event_info.dart';
import 'package:personal_schedular/redux/reducers/EventReducer.dart';
import 'package:personal_schedular/redux/store.dart';

class AddEvent extends StatefulWidget {
  final String? title;
  final String? description;
  final String? meetLink;
  final String? address;
  final DateTime? date;
  final String? time;
  final String? newOrUpdate;
  AddEvent({
    this.time,
    this.address,
    this.date,
    this.title,
    this.description,
    this.meetLink,
    this.newOrUpdate,
  });
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _linkController = TextEditingController();
  final _addressController = TextEditingController();

  FocusNode? meet;
  FocusNode? date;
  FocusNode? description;
  FocusNode? link;
  FocusNode? address;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title == null ? "" : widget.title.toString();
    _descriptionController.text =
        widget.description == null ? "" : widget.description.toString();
    _linkController.text =
        widget.meetLink == null ? "" : widget.meetLink.toString();
    _addressController.text =
        widget.address == null ? "" : widget.address.toString();
    _dateController.text = widget.date == null
        ? ""
        : DateFormat.yMMMMEEEEd()
            .format(DateTime.parse(widget.date.toString().substring(0, 10)))
            .toString();
    _timeController.text = widget.time == null ? "" : widget.time.toString();

    setState(() {
      _date = widget.date;
      _time = widget.time;
    });

    meet = FocusNode();
    date = FocusNode();
    link = FocusNode();
    address = FocusNode();
    description = FocusNode();
  }

  @override
  void dispose() {
    meet?.dispose();
    date?.dispose();
    description?.dispose();
    address?.dispose();
    link?.dispose();
    super.dispose();
  }

  dynamic _time;
  dynamic _date;

  // DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  final snackBar = SnackBar(
      backgroundColor: ColorsSchedular.primary,
      content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Yay! That's a success!!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ]));

  // style for create meet
  ButtonStyle _setButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0xff1022d6)),
    );
  }

  // decoration for textInput

  InputDecoration _setDecoration(
      String title, BuildContext context, Color color) {
    return InputDecoration(
      hintText: title,
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(setHeight(context) * 0.02)),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: color,
    );
  }

// decoration for time and date

  InputDecoration _setTimeDateDecoration(
      BuildContext context, String text, IconData icon, Color color) {
    return InputDecoration(
      hintText: text,
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(setHeight(context) * 0.02)),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(
        icon,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.date.runtimeType);

    dynamic height = setHeight(context);
    dynamic width = setWidth(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            top: height * 0.04, left: width * 0.05, right: width * 0.05),
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.02,
            ),

            // title
            Text(
              "Create",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.black),
            ),
            Text(
              "New Meeting",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(height: height * 0.05),

            // form wrapper
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    // title input

                    TextFormField(
                      autofocus: true,
                      focusNode: meet,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        meet?.unfocus();
                        FocusScope.of(context).requestFocus(date);
                      },
                      style: TextStyle(color: Colors.black),
                      cursorColor: ColorsSchedular.primary,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter meeting title";
                        }
                        if (value.length < 4) {
                          return "Please enter atleast 4 letters";
                        }
                      },
                      controller: _titleController,
                      decoration: _setDecoration("Meeting Title", context,
                          ColorsSchedular.primaryLight1),
                    ),

                    // date picker

                    TextFormField(
                      focusNode: date,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select a date";
                        }
                      },
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _dateController,
                      // focusNode: FocusNode(canRequestFocus: false),
                      showCursor: false,
                      readOnly: true,
                      onTap: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        dynamic datePicked = await showDatePicker(
                            context: context,
                            initialDate: _date == null ? DateTime.now() : _date,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100));
                        if (datePicked != null) {
                          setState(() {
                            _date = datePicked;
                          });
                          _dateController.text =
                              DateFormat.yMMMMEEEEd().format(datePicked);
                        }
                      },
                      decoration: _setTimeDateDecoration(
                          context,
                          "Select a Date",
                          Icons.event_note,
                          ColorsSchedular.primary),
                    ),

                    // time picker

                    TextFormField(
                        validator: (value) {
                          // print(_time < TimeOfDay.now());
                          // validation add
                          if (value == null || value.isEmpty) {
                            return "Please select time";
                          }
                        },
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        // focusNode: FocusNode(canRequestFocus: false),
                        showCursor: false,
                        controller: _timeController,
                        readOnly: true,
                        onChanged: (value) {
                          FocusScope.of(context).requestFocus(description);
                        },
                        onTap: () async {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }

                          dynamic timePicked = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (timePicked != null) {
                            dynamic time = DateFormat("h:mm a").format(
                                DateFormat("hh:mm").parse(
                                    timePicked.hour.toString() +
                                        ":" +
                                        timePicked.minute.toString()));
                            setState(() {
                              _time = timePicked;
                            });
                            _timeController.text = time;
                          }
                          FocusScope.of(context).requestFocus(description);
                        },
                        decoration: _setTimeDateDecoration(context, "Set Time",
                            Icons.watch_later, ColorsSchedular.skin)),
                    SizedBox(
                      height: height * 0.02,
                    ),

                    // description input

                    TextFormField(
                      focusNode: description,
                      onEditingComplete: () {
                        description?.unfocus();
                        FocusScope.of(context).requestFocus(link);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return " Please enter Description ";
                        }
                        if (value.length < 4) {
                          return " Please enter atleast a word";
                        }
                      },

                      maxLines: 5,
                      minLines: 1,
                      maxLength: 250,
                      style: TextStyle(color: Colors.black),
                      cursorColor: ColorsSchedular.primary,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _descriptionController,
                      decoration: _setDecoration(
                          "Description", context, ColorsSchedular.skinLight1),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),

                    // meet input

                    TextFormField(
                      focusNode: link,
                      onEditingComplete: () {
                        link?.unfocus();
                        FocusScope.of(context).requestFocus(address);
                      },
                      validator: (value) {
                        if ((value == null ||
                                value.isEmpty ||
                                !Uri.parse(value).isAbsolute) &&
                            _addressController.text.isEmpty) {
                          if (!Uri.parse(value.toString()).isAbsolute) {
                            return "Please enter valid link";
                          }
                          return "Please enter either meeting link or address";
                        }
                        if (_addressController.text.isEmpty &&
                            value!.length < 4) {
                          return "Please enter atleast a word";
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      cursorColor: ColorsSchedular.primary,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _linkController,
                      decoration: _setDecoration(
                          "Meet Link", context, ColorsSchedular.light),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    // either one will be filled

                    Text("or"),

                    SizedBox(
                      height: height * 0.02,
                    ),

                    // address input

                    TextFormField(
                      focusNode: address,
                      onEditingComplete: () {
                        description?.unfocus();
                      },
                      textInputAction: TextInputAction.done,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if ((value == null || value.isEmpty) &&
                            _linkController.text.isEmpty) {
                          return "Please enter either meeting link or address";
                        }
                        if (_linkController.text.isEmpty && value!.length < 4) {
                          return "Please enter atleast a word";
                        }
                      },
                      controller: _addressController,
                      decoration: _setDecoration(
                          "Address", context, ColorsSchedular.skinLight2),
                    ),

                    // create meeting option

                    Container(
                      margin: EdgeInsets.only(top: getHeight(context) * 0.05),
                      child: SizedBox(
                        width: setWidth(context) * 0.9,
                        child: TextButton(
                            style: _setButtonStyle(context),
                            onPressed: () {
                              print(_titleController.text);
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                if (widget.newOrUpdate == "Update") {
                                  Redux.store.dispatch(updateEventFromList(
                                    Redux.store,
                                    EventInfo(
                                      time: _timeController.text,
                                      title: _titleController.text,
                                      meetLink: _linkController.text,
                                      address: _addressController.text,
                                      description: _descriptionController.text,
                                      dateTime: _date,
                                    ),
                                    widget.title.toString(),
                                  ));
                                  Navigator.pop(context);
                                } else {
                                  Redux.store.dispatch(createListOfEvents(
                                      Redux.store,
                                      EventInfo(
                                        time: _timeController.text,
                                        title: _titleController.text,
                                        meetLink: _linkController.text,
                                        address: _addressController.text,
                                        description:
                                            _descriptionController.text,
                                        dateTime: _date,
                                      )));
                                  _timeController.clear();
                                  _titleController.clear();
                                  _descriptionController.clear();
                                  _dateController.clear();
                                  _linkController.clear();
                                  _addressController.clear();
                                  FocusScope.of(context).requestFocus(meet);
                                }
                              }
                            },
                            child: Text(
                              widget.newOrUpdate == "Update"
                                  ? "Update Meeting Info"
                                  : "Create Meeting",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.09,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
