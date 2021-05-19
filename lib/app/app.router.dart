// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../business_logic/models/book.dart';
import '../business_logic/models/book_document.dart';
import '../business_logic/models/user.dart';
import '../main.dart';
import '../ui/pages/about_us.dart';
import '../ui/pages/add_book_detail.dart';
import '../ui/pages/book_detail.dart';
import '../ui/pages/change_password.dart';
import '../ui/pages/chat_page.dart';
import '../ui/pages/checkout.dart';
import '../ui/pages/conversation_list_page.dart';
import '../ui/pages/find_book.dart';
import '../ui/pages/home.dart';
import '../ui/pages/orders.dart';
import '../ui/pages/register.dart';
import '../ui/pages/user_detail.dart';
import '../ui/pages/virtual_bookshelf.dart';

class Routes {
  static const String myApp = '/';
  static const String myHomePage = '/my-home-page';
  static const String authenticateWrapper = '/authenticate-wrapper';
  static const String changePassword = '/change-password';
  static const String addBookDetail = '/add-book-detail';
  static const String findBook = '/find-book';
  static const String registerScreen = '/register-screen';
  static const String bookDetail = '/book-detail';
  static const String homeScreen = '/home-screen';
  static const String virtualBookshelfScreen = '/virtual-bookshelf-screen';
  static const String userDetail = '/user-detail';
  static const String aboutUsScreen = '/about-us-screen';
  static const String ordersScreen = '/orders-screen';
  static const String checkoutScreen = '/checkout-screen';
  static const String chat = '/Chat';
  static const String conversationList = '/conversation-list';
  static const String conversationsWrapper = '/conversations-wrapper';
  static const all = <String>{
    myApp,
    myHomePage,
    authenticateWrapper,
    changePassword,
    addBookDetail,
    findBook,
    registerScreen,
    bookDetail,
    homeScreen,
    virtualBookshelfScreen,
    userDetail,
    aboutUsScreen,
    ordersScreen,
    checkoutScreen,
    chat,
    conversationList,
    conversationsWrapper,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.myApp, page: MyApp),
    RouteDef(Routes.myHomePage, page: MyHomePage),
    RouteDef(Routes.authenticateWrapper, page: AuthenticateWrapper),
    RouteDef(Routes.changePassword, page: ChangePassword),
    RouteDef(Routes.addBookDetail, page: AddBookDetail),
    RouteDef(Routes.findBook, page: FindBook),
    RouteDef(Routes.registerScreen, page: RegisterScreen),
    RouteDef(Routes.bookDetail, page: BookDetail),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.virtualBookshelfScreen, page: VirtualBookshelfScreen),
    RouteDef(Routes.userDetail, page: UserDetail),
    RouteDef(Routes.aboutUsScreen, page: AboutUsScreen),
    RouteDef(Routes.ordersScreen, page: OrdersScreen),
    RouteDef(Routes.checkoutScreen, page: CheckoutScreen),
    RouteDef(Routes.chat, page: Chat),
    RouteDef(Routes.conversationList, page: ConversationList),
    RouteDef(Routes.conversationsWrapper, page: ConversationsWrapper),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MyApp: (data) {
      var args = data.getArgs<MyAppArguments>(
        orElse: () => MyAppArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyApp(isFirstTime: args.isFirstTime),
        settings: data,
      );
    },
    MyHomePage: (data) {
      var args = data.getArgs<MyHomePageArguments>(
        orElse: () => MyHomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyHomePage(
          key: args.key,
          title: args.title,
        ),
        settings: data,
      );
    },
    AuthenticateWrapper: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthenticateWrapper(),
        settings: data,
      );
    },
    ChangePassword: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChangePassword(),
        settings: data,
      );
    },
    AddBookDetail: (data) {
      var args = data.getArgs<AddBookDetailArguments>(
        orElse: () => AddBookDetailArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddBookDetail(
          key: args.key,
          book: args.book,
        ),
        settings: data,
      );
    },
    FindBook: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FindBook(),
        settings: data,
      );
    },
    RegisterScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterScreen(),
        settings: data,
      );
    },
    BookDetail: (data) {
      var args = data.getArgs<BookDetailArguments>(
        orElse: () => BookDetailArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => BookDetail(
          key: args.key,
          bookDocument: args.bookDocument,
        ),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },
    VirtualBookshelfScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VirtualBookshelfScreen(),
        settings: data,
      );
    },
    UserDetail: (data) {
      var args = data.getArgs<UserDetailArguments>(
        orElse: () => UserDetailArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserDetail(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    AboutUsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AboutUsScreen(),
        settings: data,
      );
    },
    OrdersScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OrdersScreen(),
        settings: data,
      );
    },
    CheckoutScreen: (data) {
      var args = data.getArgs<CheckoutScreenArguments>(
        orElse: () => CheckoutScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CheckoutScreen(
          key: args.key,
          bookDocument: args.bookDocument,
        ),
        settings: data,
      );
    },
    Chat: (data) {
      var args = data.getArgs<ChatArguments>(
        orElse: () => ChatArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Chat(
          uid: args.uid,
          contact: args.contact,
          convoID: args.convoID,
        ),
        settings: data,
      );
    },
    ConversationList: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ConversationList(),
        settings: data,
      );
    },
    ConversationsWrapper: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ConversationsWrapper(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MyApp arguments holder class
class MyAppArguments {
  final bool isFirstTime;
  MyAppArguments({this.isFirstTime});
}

/// MyHomePage arguments holder class
class MyHomePageArguments {
  final Key key;
  final String title;
  MyHomePageArguments({this.key, this.title});
}

/// AddBookDetail arguments holder class
class AddBookDetailArguments {
  final Key key;
  final Book book;
  AddBookDetailArguments({this.key, this.book});
}

/// BookDetail arguments holder class
class BookDetailArguments {
  final Key key;
  final BookDocument bookDocument;
  BookDetailArguments({this.key, this.bookDocument});
}

/// UserDetail arguments holder class
class UserDetailArguments {
  final Key key;
  final AppUser user;
  UserDetailArguments({this.key, this.user});
}

/// CheckoutScreen arguments holder class
class CheckoutScreenArguments {
  final Key key;
  final BookDocument bookDocument;
  CheckoutScreenArguments({this.key, this.bookDocument});
}

/// Chat arguments holder class
class ChatArguments {
  final String uid;
  final AppUser contact;
  final String convoID;
  ChatArguments({this.uid, this.contact, this.convoID});
}
