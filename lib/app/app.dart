import 'package:share_a_book/main.dart';
import 'package:share_a_book/ui/pages/about_us.dart';
import 'package:share_a_book/ui/pages/add_book_detail.dart';
import 'package:share_a_book/ui/pages/book_detail.dart';
import 'package:share_a_book/ui/pages/change_password.dart';
import 'package:share_a_book/ui/pages/checkout.dart';
import 'package:share_a_book/ui/pages/find_book.dart';
import 'package:share_a_book/ui/pages/home.dart';
import 'package:share_a_book/ui/pages/orders.dart';
import 'package:share_a_book/ui/pages/register.dart';
import 'package:share_a_book/ui/pages/user_detail.dart';
import 'package:share_a_book/ui/pages/virtual_bookshelf.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: MyApp, initial: true),
  MaterialRoute(page: MyHomePage),
  MaterialRoute(page: AuthenticateWrapper),
  MaterialRoute(page: ChangePassword),
  MaterialRoute(page: AddBookDetail),
  MaterialRoute(page: FindBook),
  MaterialRoute(page: RegisterScreen),
  MaterialRoute(page: BookDetail),
  MaterialRoute(page: HomeScreen),
  MaterialRoute(page: VirtualBookshelfScreen),
  MaterialRoute(page: UserDetail),
  MaterialRoute(page: AboutUsScreen),
  MaterialRoute(page: OrdersScreen),
  MaterialRoute(page: CheckoutScreen)
])
class AppSetup {}
