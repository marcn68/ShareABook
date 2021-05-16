// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../business_logic/models/book.dart';
import '../business_logic/models/book_document.dart';
import '../main.dart';
import '../ui/pages/add_book_detail.dart';
import '../ui/pages/book_detail.dart';
import '../ui/pages/change_password.dart';
import '../ui/pages/find_book.dart';
import '../ui/pages/home.dart';
import '../ui/pages/register.dart';
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
static const all = <String>{
myApp,myHomePage,authenticateWrapper,changePassword,addBookDetail,findBook,registerScreen,bookDetail,homeScreen,};}

class StackedRouter extends RouterBase {
     @override
     List<RouteDef> get routes => _routes;
     final _routes = <RouteDef>[
     

RouteDef(Routes.myApp
,page: MyApp
),
RouteDef(Routes.myHomePage
,page: MyHomePage
),
RouteDef(Routes.authenticateWrapper
,page: AuthenticateWrapper
),
RouteDef(Routes.changePassword
,page: ChangePassword
),
RouteDef(Routes.addBookDetail
,page: AddBookDetail
),
RouteDef(Routes.findBook
,page: FindBook
),
RouteDef(Routes.registerScreen
,page: RegisterScreen
),
RouteDef(Routes.bookDetail
,page: BookDetail
),
RouteDef(Routes.homeScreen
,page: HomeScreen
),
];       @override
       Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
        final _pagesMap = <Type, StackedRouteFactory>{
        

MyApp: (data) {
var args = data.getArgs<MyAppArguments>(
orElse: ()=> MyAppArguments(),);return MaterialPageRoute<dynamic>(builder: (context) =>   MyApp(isFirstTime:args.isFirstTime), settings: data,);
},MyHomePage: (data) {
var args = data.getArgs<MyHomePageArguments>(
orElse: ()=> MyHomePageArguments(),);return MaterialPageRoute<dynamic>(builder: (context) =>   MyHomePage(key:args.key,title:args.title,), settings: data,);
},AuthenticateWrapper: (data) {
return MaterialPageRoute<dynamic>(builder: (context) =>   AuthenticateWrapper(), settings: data,);
},ChangePassword: (data) {
return MaterialPageRoute<dynamic>(builder: (context) =>   ChangePassword(), settings: data,);
},AddBookDetail: (data) {
var args = data.getArgs<AddBookDetailArguments>(
orElse: ()=> AddBookDetailArguments(),);return MaterialPageRoute<dynamic>(builder: (context) =>   AddBookDetail(key:args.key,book:args.book,), settings: data,);
},FindBook: (data) {
return MaterialPageRoute<dynamic>(builder: (context) =>   FindBook(), settings: data,);
},RegisterScreen: (data) {
return MaterialPageRoute<dynamic>(builder: (context) =>   RegisterScreen(), settings: data,);
},BookDetail: (data) {
var args = data.getArgs<BookDetailArguments>(
orElse: ()=> BookDetailArguments(),);return MaterialPageRoute<dynamic>(builder: (context) =>   BookDetail(key:args.key,bookDocument:args.bookDocument,), settings: data,);
},HomeScreen: (data) {
return MaterialPageRoute<dynamic>(builder: (context) =>   HomeScreen(), settings: data,);
},};}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MyApp arguments holder class
class MyAppArguments{
final bool isFirstTime;
MyAppArguments({
this.isFirstTime});
}
/// MyHomePage arguments holder class
class MyHomePageArguments{
final Key key;
final String title;
MyHomePageArguments({
this.key,this.title});
}
/// AddBookDetail arguments holder class
class AddBookDetailArguments{
final Key key;
final Book book;
AddBookDetailArguments({
this.key,this.book});
}
/// BookDetail arguments holder class
class BookDetailArguments{
final Key key;
final BookDocument bookDocument;
BookDetailArguments({
this.key,this.bookDocument});
}
