import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/view_models/checkout_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/custom_button.dart';

class CheckoutScreen extends StatefulWidget {
  BookDocument bookDocument;

  CheckoutScreen({Key key, this.bookDocument}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CheckoutViewModel checkoutViewModel = serviceLocator<CheckoutViewModel>();

  @override
  void initState() {
    checkoutViewModel.bookDocument = widget.bookDocument;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckoutViewModel>(
        create: (context) => checkoutViewModel,
        child: Consumer<CheckoutViewModel>(
            builder: (context, model, child) => Scaffold(
                backgroundColor: Constants.SECONDARY_BLUE,
                appBar: AppBar(
                  title: Text(
                    "Checkout",
                    style: Constants.AppBarText,
                  ),
                  centerTitle: true,
                  backgroundColor: Constants.PRIMARY_BLUE,
                ),
                body: Column(
                  children: <Widget>[
                    CreditCardWidget(
                      cardNumber: checkoutViewModel.cardNumber,
                      expiryDate: checkoutViewModel.expiryDate,
                      cardHolderName: checkoutViewModel.cardHolderName,
                      cvvCode: checkoutViewModel.cvvCode,
                      showBackView: checkoutViewModel.isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CreditCardForm(
                              formKey: checkoutViewModel.formKey,
                              obscureCvv: true,
                              obscureNumber: true,
                              cardNumber: checkoutViewModel.cardNumber,
                              cvvCode: checkoutViewModel.cvvCode,
                              cardHolderName: checkoutViewModel.cardHolderName,
                              expiryDate: checkoutViewModel.expiryDate,
                              themeColor: Colors.blue,
                              cardNumberDecoration: buildInputDecoration(
                                  labelText: 'Number',
                                  hintText: 'XXXX XXXX XXXX XXXX'),
                              expiryDateDecoration: buildInputDecoration(
                                  labelText: 'Expired Date', hintText: 'XX/XX'),
                              cvvCodeDecoration: buildInputDecoration(
                                  labelText: 'CVV', hintText: 'XXX'),
                              cardHolderDecoration: buildInputDecoration(
                                  labelText: 'Card Holder', hintText: ''),
                              onCreditCardModelChange: onCreditCardModelChange,
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                height: 42.0,
                                child: CustomButton(
                                    text: "Buy",
                                    onPressed: () {
                                      if (checkoutViewModel.formKey.currentState
                                          .validate()) {
                                        print('valid!');
                                        print(checkoutViewModel.cardNumber);
                                      } else {
                                        print('invalid!');
                                      }
                                    }))
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  InputDecoration buildInputDecoration({labelText, hintText}) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.PRIMARY_ORANGE, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.PRIMARY_ORANGE, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(fontSize: 14.0));
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      checkoutViewModel.cardNumber = creditCardModel.cardNumber;
      checkoutViewModel.expiryDate = creditCardModel.expiryDate;
      checkoutViewModel.cardHolderName = creditCardModel.cardHolderName;
      checkoutViewModel.cvvCode = creditCardModel.cvvCode;
      checkoutViewModel.isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
