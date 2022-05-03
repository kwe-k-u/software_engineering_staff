

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:flutterwave_standard/models/subaccount.dart';
import 'package:provider/provider.dart';
import 'package:software_engineering/environment.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/models/payment_receipt.dart';
import 'package:software_engineering/utils/constants.dart';

import 'firestore_helper.dart';

class PaymentHandler {

  static Future<void> initiatePayment({
    required BuildContext context,
    String currency = "GHS",
    required PaymentType type,
    required String amount,
    required String email,
    required String fullName,

  }) async {
    final Flutterwave flutterwave = Flutterwave(
      context: context,
      style: FlutterwaveStyle(
        appBarText: "Ashesi Bus System Payment",
        buttonText: "Proceed",
        appBarColor: ashesiRed,
        mainBackgroundColor: ashesiRedLight,
        dialogBackgroundColor: ashesiWhite,
        // buttonColor: ashesiRe
      ),
      publicKey: Environment.flutterwavePublicKey,
      currency: currency,
      amount: amount,
      txRef: "context",
      isTestMode: false,
      customer: Customer(
          name: fullName,
          email: email,
        phoneNumber: "0559582518"
      ),
        paymentOptions: "mobilemoneyghana",
        customization: Customization(),
    );

    try {
      ChargeResponse? response = await flutterwave.charge();
      if (response != null) {
        print(response.toJson());
        if (response.success == true){
          PaymentReceipt receipt = PaymentReceipt(
              id: response.transactionId!,
              userId: context.read<AppState>().auth!.currentUser!.uid,
              txtRef: response.txRef!,
              amount: double.parse(amount),
              method: PaymentMethod.momo,
              type:  type,
              paymentDate: DateTime.now()
          );

          await recordPayment(receipt);

          ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(content: Text(response.transactionId ?? ""), actions: [TextButton(child: Text(""),onPressed: (){},)]));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Transaction failed"),));
        }
      }

    } catch (e){
      print(e);
    }
  }
}