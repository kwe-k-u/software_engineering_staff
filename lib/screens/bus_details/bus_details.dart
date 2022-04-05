import 'package:flutter/material.dart';
import 'package:software_engineering/widgets/custom_button.dart';

class BusDetails extends StatefulWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  _BusDetailsState createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        padding: EdgeInsets.all(12),
        height: size.height * 0.7,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(
                fallbackWidth: size.width * 0.6,
                fallbackHeight: size.height * 0.25,
              ),
            ),


            Row(
              children: [
                Column(
                  children: [
                    Placeholder(
                      fallbackWidth: size.width * 0.09,
                      fallbackHeight: size.width * 0.15,
                    ),
                    const Text("Driver")
                  ],
                ),

                Column(
                  children: [
                    Text("Mr. Thomas"),
                    Text("Bus No. GT 545 21"),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.green,),
                        Text("+233 55 854 7888"),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.supervisor_account_rounded),
                Column(
                  children: [
                    Text("Capacity"),
                    Text("23/30")
                  ],
                )
              ],
            ),

            Spacer(),

            Row(
              children: [
                _DestinationWidget(),
                Spacer(),
                Icon(Icons.access_time),
                Column(
                  children: [
                    Text("Departure"),
                    Text("5.00 PM")
                  ],
                ),

              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),

            Row(
              children: [
                _DestinationWidget(),
                Spacer(),
                Icon(Icons.money),
                Text("GHC 3.00")
              ],
            ),

            CustomButton(
                text: "Book",
                onPressed: (){
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}



class _DestinationWidget extends StatelessWidget {
  const _DestinationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined),
        Column(
          children: [
            Text("from"),
            Text("Accra"),
          ],
        ),
      ],
    );
  }
}

