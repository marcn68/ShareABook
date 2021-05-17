import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/view_models/change_password_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  ChangePasswordViewModel model = serviceLocator<ChangePasswordViewModel>();

  @override
  void initState() {
    model.oldPassController = TextEditingController();
    model.newPassController = TextEditingController();
    model.confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangePasswordViewModel>(
        create: (context) => model,
        child: Consumer<ChangePasswordViewModel>(
          builder: (context, model, child) => Scaffold(
            backgroundColor: Constants.SECONDARY_BLUE,
            appBar: AppBar(
              title: Text(
                "Change Your Password",
                style: Constants.AppBarText,
              ),
              centerTitle: true,
              backgroundColor: Constants.PRIMARY_BLUE,
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 170),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 18.0),
                      obscureText: true,
                      controller: model.oldPassController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3.0, color: Constants.PRIMARY_ORANGE),
                            borderRadius: BorderRadius.circular(20.0)),
                        labelStyle: TextStyle(fontSize: 18.0),
                        labelText: "Old Password",
                      ),
                      //onSubmitted: () async {},
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 18.0),
                      obscureText: true,
                      controller: model.newPassController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3.0, color: Constants.PRIMARY_ORANGE),
                            borderRadius: BorderRadius.circular(20.0)),
                        labelStyle: TextStyle(fontSize: 18.0),
                        labelText: "New Password",
                      ),
                      //onSubmitted: () async {},
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 18.0),
                      obscureText: true,
                      controller: model.confirmPassController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3.0, color: Constants.PRIMARY_ORANGE),
                            borderRadius: BorderRadius.circular(20.0)),
                        labelStyle: TextStyle(fontSize: 18.0),
                        labelText: "Confirm Password",
                      ),
                      //onSubmitted: () async {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text(
                        "CHANGE PASSWORD",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      onPressed: () {
                        model.checkPassword();
                        // model.snackBar = SnackBar(content: Text(model.msg));
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(model.snackBar);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
