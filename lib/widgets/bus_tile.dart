import 'package:flutter/material.dart';


class BusTile extends StatelessWidget {
  const BusTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Tomorrow at 3:45PM"),
                SizedBox(height: 12,),
                Text("Ashesi University to Aburi"),
                Text("Departure Time: 5:00 PM"),

              ],
            ),
            Column(
              children: [
                Text("Price"),
                Text("GHC 3.00"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
