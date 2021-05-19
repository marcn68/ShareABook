import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/models/order.dart';
import 'package:share_a_book/services/order/order_service.dart';
import 'package:share_a_book/services/payment/payment_service.dart';
import 'package:share_a_book/services/payment/payment_service_stripe.dart';
import 'package:share_a_book/services/service_locator.dart';

class CheckoutViewModel extends ChangeNotifier {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BookDocument bookDocument;

  Future pay() async {
    // var expMonth = int.parse(expiryDate.split('/')[0]);
    // var expYear = int.parse(expiryDate.split('/')[1]);
    await serviceLocator<PaymentService>().startPayment();
    notifyListeners();
  }
}
