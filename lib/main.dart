import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/pages/add_book.dart';
import 'package:share_a_book/ui/pages/login.dart';
import 'package:share_a_book/ui/widgets/drawer.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthService _authService = serviceLocator<AuthService>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: _authService.currentUser,
      child: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppUser user = Provider.of<AppUser>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user == null ? LoginScreen() : MyHomePage(title: 'Testing'),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
