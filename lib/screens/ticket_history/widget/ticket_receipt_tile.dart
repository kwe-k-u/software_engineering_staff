import 'package:flutter/material.dart';


class TicketReceiptTile extends StatelessWidget {
  const TicketReceiptTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4,horizontal: 2),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.check_circle_rounded, color: Colors.green,),
                title: Text("TicketID: NX-265-6584"),
                subtitle: Text("Paid with Momo"),
                trailing: Text("GHC 3.00"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Christ The King"),
                      Text("Accra")
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.access_time),
                      Text("Today at 7:45 AM")
                    ],
                  ),
                  Column(
                    children: [
                      Text("Ashesi University"),
                      Text("Berekusu")
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
