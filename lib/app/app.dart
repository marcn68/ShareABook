import 'package:share_a_book/main.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: MyApp, initial: true),
  MaterialRoute(page: MyHomePage),
  MaterialRoute(page: AuthenticateWrapper),
])
class AppSetup {}
