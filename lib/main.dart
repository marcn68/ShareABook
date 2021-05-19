import 'package:algolia/algolia.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/ui/pages/get_started.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/utils/prefs_utils.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/pages/add_book.dart';
import 'package:share_a_book/ui/pages/home.dart';
import 'package:share_a_book/ui/pages/login.dart';
import 'package:share_a_book/ui/widgets/drawer.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stripe_payment/stripe_payment.dart';

class Application {
  static final Algolia algolia = Algolia.init(
    applicationId: '1YUUXA3N5F',
    apiKey: '33efaf6d1d792d5ac2af85530d43f9ef',
  );
}

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final bool isFirstTime = await PrefsUtils.isFirstTime();
  StripePayment.setOptions(
    StripeOptions(
      publishableKey:
          'pk_test_51IHJSxHUbkL4hqdbEuSW85X4CFx21U9chEdrqmFfefOwMJBKzPKl6ZoqTKci24h66lrwbcl9WQ6uqESKY4whRKAK00yUBUUkSE',
    ),
  );
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
      value: _authService.currentUserStream,
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
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      home: isFirstTime ? GetStartedScreen() : AuthenticateWrapper(),
    );
  }
}

class AuthenticateWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppUser user = Provider.of<AppUser>(context);
    return user == null
        ? LoginScreen()
        : MyHomePage(
            title: 'Share a Book',
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
        centerTitle: true,
        title: Text("Share A Book"),
        backgroundColor: Constants.PRIMARY_BLUE,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              serviceLocator<NavigationService>().navigateTo(Routes.findBook);
            },
          )
        ],
      ),
      body: HomeScreen(),
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
