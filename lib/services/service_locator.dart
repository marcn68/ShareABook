import 'package:get_it/get_it.dart';
import 'package:share_a_book/business_logic/view_models/add_book_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/change_password_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/find_book_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/home_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/login_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/register_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/virtual_bookshelf_viewmodel.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/authentication/auth_service_firebase.dart';
import 'package:share_a_book/services/book_add/book_add_service.dart';
import 'package:share_a_book/services/user/user_service.dart';
import 'package:share_a_book/services/user/user_service_firebase.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';
import 'package:share_a_book/services/web_api/backend_api_implementation.dart';
import 'package:stacked_services/stacked_services.dart';
import 'book_add/book_add_service_implementation.dart';
import 'database/database_service.dart';
import 'database/database_service_firestore.dart';
import 'web_api/web_api.dart';
import 'web_api/web_api_implementation.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  //services registrations
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImplementation());
  serviceLocator
      .registerLazySingleton<NavigationService>(() => NavigationService());
  serviceLocator
      .registerLazySingleton<UserService>(() => UserServiceFirebase());
  serviceLocator
      .registerLazySingleton<AuthService>(() => AuthServiceFirebase());
  serviceLocator
      .registerLazySingleton<BackendApi>(() => BackendApiImplementation());
  serviceLocator.registerLazySingleton<BookAddService>(
      () => BookAddServiceImplementation());

  //view models registrations
  serviceLocator.registerFactory<AddBookViewModel>(() => AddBookViewModel());
  //serviceLocator.registerFactory<AddBookViewModel>(() => AddBookViewModel());

  serviceLocator.registerFactory<HomeViewModel>(() => HomeViewModel());

  serviceLocator.registerFactory<VirtualBookshelfViewModel>(
      () => VirtualBookshelfViewModel());

  serviceLocator.registerFactory<LoginViewModel>(() => LoginViewModel());

  serviceLocator.registerFactory<RegisterViewModel>(() => RegisterViewModel());
  serviceLocator.registerFactory<DatabaseService>(() => DatabaseServiceFirestore());

  serviceLocator.registerFactory<ChangePasswordViewModel>(
      () => ChangePasswordViewModel());
  serviceLocator.registerFactory<FindBookViewModel>(() => FindBookViewModel());
  serviceLocator.registerLazySingleton<DialogService>(() => DialogService());

}
