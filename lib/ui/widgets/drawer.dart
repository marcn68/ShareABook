import 'package:flutter/material.dart';
import 'package:share_a_book/shared/constants.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        radius: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "example@gmail.com",
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
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => PrimaryPage()));
                  },
                ),
                ListTile(
                  dense: true,
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  title: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SocialPage()));
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
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
