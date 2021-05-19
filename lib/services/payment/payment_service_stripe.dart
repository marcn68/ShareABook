import 'dart:convert';

import 'package:http/http.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/payment/payment_service.dart';
import 'package:stripe_payment/stripe_payment.dart';

import '../service_locator.dart';

class PaymentServiceStripe implements PaymentService {
  final AuthService _authService = serviceLocator<AuthService>();
  double costPrice = 10000;
  int amount = 0;
  String token;

  @override
  Future startDirectCharge(PaymentMethod paymentMethod) async {
    token = await _authService.getCurrentUserToken();

    var url = "https://share-a-book.herokuapp.com/payment";

    Map<String, String> _headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    final Response response = await get(
      Uri.parse(
        '$url?amount=$amount&currency=LBP&paym=${paymentMethod.id}',
      ),
      headers: _headers,
    );

    print(response.body);

    if (response.body != null) {
      final paymentIntent = jsonDecode(response.body);
      final status = paymentIntent['paymentIntent']['status'];
      final acct = paymentIntent['stripeAccount'];

      if (status == 'succeeded') {
        print('payment done');
      } else {
        StripePayment.setStripeAccount(acct);
        try {
          PaymentIntentResult paymentIntentResult =
              await StripePayment.confirmPaymentIntent(
            PaymentIntent(
              paymentMethodId: paymentIntent['paymentIntent']['payment_method'],
              clientSecret: paymentIntent['paymentIntent']['client_secret'],
            ),
          );
          final paymentStatus = paymentIntentResult.status;

          if (paymentStatus == 'succeeded') {
            print('payment done');
          }
        } catch (err) {
          print(err);
        }
      }
    }
  }

  @override
  Future startPayment({
    String cvc,
    int expMonth,
    int expYear,
    String number,
    String name,
  }) async {
    StripePayment.setStripeAccount(null);

    amount = (costPrice * 100).toInt();

    CreditCard card = CreditCard(
      number: number,
      expMonth: expMonth,
      expYear: expYear,
      cvc: cvc,
      currency: 'lbp',
      name: name,
    );

    PaymentMethod paymentMethod = PaymentMethod();

    try {
      paymentMethod =
          await StripePayment.createPaymentMethod(PaymentMethodRequest(
        card: card,
      ));
      // paymentMethod = await StripePayment.paymentRequestWithCardForm(
      //   CardFormPaymentRequest(),
      // );
      // paymentMethod;
    } catch (err) {
      print(err);
    }

    // print(paymentMethod.toString());

    startDirectCharge(paymentMethod);
  }
}
