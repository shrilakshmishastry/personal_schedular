import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_schedular/config/Routes/bottomTab.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';
import 'package:personal_schedular/redux/actions/profile_add.dart';
import 'package:personal_schedular/redux/models/user_info.dart';
import 'package:personal_schedular/redux/store.dart';

class LoginHandler extends StatelessWidget {
  GlobalKey<FormState> _formController = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  ButtonStyle _setButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0xff1022d6)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFoucs = FocusScope.of(context);
            if (!currentFoucs.hasPrimaryFocus) {
              currentFoucs.unfocus();
            }
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(setWidth(context) * 0.09),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: setHeight(context) * 0.01,
                      left: setWidth(context) * 0.05,
                      right: setWidth(context) * 0.05),
                  child: Image.asset(
                    'assets/images/undraw_time_management_30iu.png',
                    height: setHeight(context) * 0.3,
                    width: setWidth(context) * 0.5,
                  ),
                ),
                Center(
                  child: Text(
                    "Valise",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Form(
                    key: _formController,
                    child: Column(
                      children: [
                        SizedBox(
                          height: setHeight(context) * 0.04,
                        ),
                        TextFormField(
                          autofocus: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if ((value == null || value.isEmpty) ||
                                !(RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value.toString()))) {
                              if (!(RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value.toString()))) {
                                return "Please enter valid email";
                              }
                              return 'Please enter your email';
                            }
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.green,
                            labelText: "Email",
                            hintText: "Please enter your email here",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        TextFormField(
                          autofocus: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 4) {
                              return 'Please enter atleast 4 letters';
                            }
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: "Please enter your password here",
                            labelText: "Password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: getHeight(context) * 0.05),
                          child: SizedBox(
                            width: setWidth(context) * 0.9,
                            child: TextButton(
                                style: _setButtonStyle(context),
                                onPressed: () {
                                  if (_formController.currentState!
                                      .validate()) {
                                    Redux.store.dispatch(ProfileAddAction(
                                        UserInfo(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                            joinedDate: DateTime.now())));
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
