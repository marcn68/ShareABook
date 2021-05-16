import 'package:share_a_book/main.dart';
import 'package:share_a_book/ui/pages/add_book_detail.dart';
import 'package:share_a_book/ui/pages/change_password.dart';
import 'package:share_a_book/ui/pages/find_book.dart';
import 'package:share_a_book/ui/pages/login.dart';
import 'package:share_a_book/ui/pages/register.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: MyApp, initial: true),
  MaterialRoute(page: MyHomePage),
  MaterialRoute(page: AuthenticateWrapper),
  MaterialRoute(page: ChangePassword),
  MaterialRoute(page: AddBookDetail),
  MaterialRoute(page: FindBook),
  MaterialRoute(page: RegisterScreen),
])
class AppSetup {}
