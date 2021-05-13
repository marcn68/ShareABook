import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/utils/prefs_utils.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/pages/add_book.dart';
import 'package:share_a_book/ui/pages/get_started.dart';
import 'package:share_a_book/ui/pages/login.dart';
import 'package:share_a_book/ui/widgets/drawer.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final bool isFirstTime = await PrefsUtils.isFirstTime();
  runApp(MyApp(
    isFirstTime: isFirstTime,
  ));
}

class MyApp extends StatelessWidget {
  final AuthService _authService = serviceLocator<AuthService>();
  MyApp({this.isFirstTime});
  final bool isFirstTime;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: _authService.currentUser,
      child: MainPage(
        isFirstTime: isFirstTime,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({this.isFirstTime});
  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShareABook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isFirstTime ? GetStartedScreen() : AuthenticateWrapper(),
    );
  }
}

class AuthenticateWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppUser user = Provider.of<AppUser>(context);
    return Container(
      child: user == null
          ? LoginScreen()
          : MyHomePage(
              title: 'Home Page',
            ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Constants.PRIMARY_BLUE,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddBook()));
        },
        tooltip: 'Add Book',
        child: Icon(Icons.add),
      ),
    );
  }
}
