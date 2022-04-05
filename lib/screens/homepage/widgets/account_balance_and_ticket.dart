import "package:flutter/material.dart";
import 'package:software_engineering/widgets/custom_button.dart';



class AccountBalanceAndTicket extends StatefulWidget {
  const AccountBalanceAndTicket({Key? key}) : super(key: key);

  @override
  _AccountBalanceAndTicketState createState() => _AccountBalanceAndTicketState();
}

class _AccountBalanceAndTicketState extends State<AccountBalanceAndTicket> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(16),
      height: size.height * 0.3,
      width: size.width * 0.85,
      child: Column(
        children: [

          _CreditBalance(),
          _UnusedTickets()

        ],
      ),
    );
  }
}





class _CreditBalance extends StatelessWidget {
  const _CreditBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.zero,
      child:
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Ashesi Bus Credit Balance",
                      style: Theme.of(context).textTheme.titleSmall
                  ),
                  Text("GHC 0.00",
                    style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              CustomButton(
                  text: "TOP UP",
                  onPressed: (){},
                radius: 6,
              )
            ],
      ),
        ),
    );
  }
}




class _UnusedTickets extends StatelessWidget {
  const _UnusedTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child:
      Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text("Unused Tickets",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Ashesi",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          children:[
                            TextSpan(text: " to ",
                              style: Theme.of(context).textTheme.bodyText2
                            ),
                            TextSpan(
                              text: "Accra"
                            ),
                          ]
                        ),
                      ),

                      Text("Bus leaves today at 7:00"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("GHC 3.00",
                          style: Theme.of(context).textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Bought on ",
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: "22 Feb 2022",
                              style: Theme.of(context).textTheme.bodyLarge
                            )
                          ]
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
