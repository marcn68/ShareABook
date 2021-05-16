import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/view_models/change_password_viewmodel.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:path/path.dart' as path;
import 'package:stacked_services/stacked_services.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final AuthService _authService = serviceLocator<AuthService>();

  File _pickedImage;

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;

    return Container(
      color: Constants.SAFEAREA_COLOR,
      child: SafeArea(
        child: Drawer(
          child: Container(
            color: Constants.SECONDARY_BLUE,
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: _pickedImage != null
                              ? ClipOval(
                                  //borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    _pickedImage,
                                    width: 200,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey[800],
                                    size: 50,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.fullName,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        user.email,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Constants.PRIMARY_BLUE,
                  ),
                ),
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onTap: () async {
                    await serviceLocator<NavigationService>()
                    .navigateTo(Routes.myApp);
                  },
                ),
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.library_books,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Bookshelf',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => PromotionsPage()));
                  },
                ),
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.receipt,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Orders',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Change Your Password',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onTap: () async {
                    await serviceLocator<NavigationService>()
                        .navigateTo(Routes.changePassword);
                  },
                ),
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onTap: _authService.signOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    // ignore: deprecated_member_use
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);

    File _image = File(image.path);
    // String dir = path.dirname(image.path);
    // String newPath = path.join(dir, widget.contact.id.toString() + '.jpg');
    // File file = new File(newPath);
    // if (file.existsSync()) {
    //   file.deleteSync();
    // }
    // image.renameSync(newPath);

    setState(() {
      _pickedImage = _image;
    });
  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    File _image = File(image.path);

    //String dir = path.dirname(image.path);
    // String newPath = path.join(dir, widget.contact.id.toString() + '.jpg');
    // image.renameSync(newPath);

    // File file = new File(newPath);

    setState(() {
      _pickedImage = _image;
    });
  }
}
