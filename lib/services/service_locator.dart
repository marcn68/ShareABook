import 'package:get_it/get_it.dart';
import 'package:share_a_book/business_logic/view_models/add_book_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/book_detail_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/change_password_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/chat_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/checkout_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/conversation_list_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/find_book_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/home_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/login_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/orders_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/register_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/user_detail_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/virtual_bookshelf_viewmodel.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/authentication/auth_service_firebase.dart';
import 'package:share_a_book/services/book/book_service.dart';
import 'package:share_a_book/services/chat/chat_service.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/order/order_service.dart';
import 'package:share_a_book/services/order/order_service_implementation.dart';
import 'package:share_a_book/services/payment/payment_service.dart';
import 'package:share_a_book/services/payment/payment_service_stripe.dart';
import 'package:share_a_book/services/user/user_service.dart';
import 'package:share_a_book/services/user/user_service_firebase.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';
import 'package:share_a_book/services/web_api/backend_api_implementation.dart';
import 'package:stacked_services/stacked_services.dart';
import 'chat/chat_service_implementation.dart';
import 'database/database_service.dart';
import 'book/book_service_implementation.dart';
import 'database/database_service_firestore.dart';
import 'web_api/web_api.dart';
import 'web_api/web_api_implementation.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  //services registrations
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImplementation());
  serviceLocator
      .registerLazySingleton<PaymentService>(() => PaymentServiceStripe());
  serviceLocator
      .registerLazySingleton<NavigationService>(() => NavigationService());
  serviceLocator
      .registerLazySingleton<UserService>(() => UserServiceFirebase());
  serviceLocator
      .registerLazySingleton<AuthService>(() => AuthServiceFirebase());
  serviceLocator
      .registerLazySingleton<BackendApi>(() => BackendApiImplementation());
  serviceLocator
      .registerLazySingleton<BookService>(() => BookServiceImplementation());
  serviceLocator
      .registerLazySingleton<DatabaseService>(() => DatabaseServiceFirestore());
  serviceLocator
      .registerLazySingleton<SnackbarService>(() => SnackbarService());

  serviceLocator
      .registerLazySingleton<OrderService>(() => OrderServiceImplementation());
  serviceLocator
      .registerLazySingleton<ChatService>(() => ChatServiceImplementation());

  //view models registrations
  serviceLocator.registerFactory<AddBookViewModel>(() => AddBookViewModel());
  //serviceLocator.registerFactory<AddBookViewModel>(() => AddBookViewModel());

  serviceLocator.registerFactory<HomeViewModel>(() => HomeViewModel());

  serviceLocator.registerFactory<VirtualBookshelfViewModel>(
      () => VirtualBookshelfViewModel());

  serviceLocator.registerFactory<LoginViewModel>(() => LoginViewModel());

  serviceLocator.registerFactory<RegisterViewModel>(() => RegisterViewModel());

  serviceLocator.registerFactory<ChangePasswordViewModel>(
      () => ChangePasswordViewModel());
  serviceLocator.registerFactory<FindBookViewModel>(() => FindBookViewModel());

  serviceLocator.registerLazySingleton<DialogService>(() => DialogService());

  serviceLocator
      .registerFactory<BookDetailViewModel>(() => BookDetailViewModel());
  serviceLocator
      .registerLazySingleton<UserDetailViewModel>(() => UserDetailViewModel());

  serviceLocator.registerFactory<OrdersViewModel>(() => OrdersViewModel());
  serviceLocator.registerFactory<CheckoutViewModel>(() => CheckoutViewModel());
  serviceLocator.registerFactory<ChatViewModel>(() => ChatViewModel());
  serviceLocator.registerFactory<ConversationListViewModel>(
      () => ConversationListViewModel());
}
