import 'package:flutter/material.dart';
import 'package:software_engineering/screens/bus_details/bus_details.dart';
import 'package:software_engineering/widgets/custom_button.dart';


class BusTile extends StatelessWidget {
  const BusTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: (){
        showDialog(
            context: context,
            builder: (context)=> BusDetails()
        );
      },
      child: Card(
        elevation: 6,
        child: SizedBox(
          height: size.height * 0.2,
          width: size.width * 0.95,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Placeholder(
                      fallbackWidth: size.width * 0.3,
                      fallbackHeight: size.height * 0.14,
                    ),
                    Text("No. GR 455 -17")
                  ],
                ),
                Column(
                  children: [
                    _DestinationWidget(),
                    Spacer(),
                    _DestinationWidget(),
                  ],
                ),
                Column(
                  children: [
                    CustomButton(text: "Book", onPressed: (){}),
                    Spacer(),
                    Text("GHC 3.00")
                  ],
                )
              ],
            ),
          ),
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
            Text("Accra"),
            Text("from"),
          ],
        ),
      ],
    );
  }
}
