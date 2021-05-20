import 'package:stripe_payment/stripe_payment.dart';

abstract class PaymentService {
  Future startPayment({
    String cvc,
    int expMonth,
    int expYear,
    String number,
    String name,
  });
  // Future startPayment();
  Future startDirectCharge(PaymentMethod paymentMethod);
}
