import 'package:flutter/material.dart';
import 'package:software_engineering/models/payment_receipt.dart';
import 'package:software_engineering/screens/login_screen/login_screen.dart';
import 'package:software_engineering/utils/payment_handler.dart';
import 'package:software_engineering/widgets/curved_background.dart';
import 'package:software_engineering/widgets/custom_button.dart';
import 'package:software_engineering/widgets/custom_text_field.dart';
import 'package:software_engineering/widgets/heading_text.dart';
import 'package:software_engineering/widgets/input_section.dart';

class PaymentInfo extends StatefulWidget {
  String name = "";
  String email = "";
  PaymentType type;

  PaymentInfo({
    Key? key,
    required this.type,
    required this.email,
    required this.name,
  }) : super(key: key);

  @override
  _PaymentInfoState createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  void initState() {
    super.initState();
    name.text = widget.name;
    email.text = widget.email;
    amount.text = "6.00";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CurvedBackground(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeadingText("Advanced Payment"),
                const Spacer(flex: 3,),
                InputSection(
                  labels: const [
                    "Full Name",
                    "Email",
                    "Amount to transfer"
                  ],
                    inputs: [
                      CustomTextField(
                        controller: name,
                        hintText: "Full Name",
                      ),


                      CustomTextField(
                        controller: email,
                        hintText: "someone@ashesi.edu.gh",
                      ),



                      CustomTextField(
                        controller: amount,
                        hintText: "GHS",
                        inputType: TextInputType.number,
                      ),

                    ]),

                const Spacer(),

                CustomButton(text: "Begin Payment", onPressed: (){

                  PaymentHandler.initiatePayment(
                      context: context,
                      type: widget.type,
                      amount: amount.text,
                      fullName: name.text,
                      email: email.text
                  );
                }),

              ],
            ),
          ),
        )
    );
  }
}
