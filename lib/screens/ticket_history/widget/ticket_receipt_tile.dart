import 'package:flutter/material.dart';
import 'package:software_engineering/models/payment_receipt.dart';
import 'package:software_engineering/models/ticket.dart';
import 'package:software_engineering/utils/constants.dart';
import 'package:software_engineering/utils/extensions.dart';
import 'package:software_engineering/widgets/ticket_reciept.dart';


class TicketReceiptTile extends StatelessWidget {
  final Ticket ticket;

  const TicketReceiptTile({
    required this.ticket,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 2),
      child: InkWell(
        onTap: (){
          showDialog(context: context, builder: (context)=> TicketReciept());
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.check_circle_rounded, color: Colors.green,),
                  title: Text("TicketID: ${ticket.id}"),
                  trailing: Text("GHC ${ticket.amountPaid}", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("from", style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),),
                        Text(ticket.bus.pickup.name),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.access_time, color: ashesiRed, size: 28,),
                        Text("Today at ${ticket.bus.setOffTime.asTime()}")//todo implement time for setOffTime
                      ],
                    ),
                    Column(
                      children: [
                        Text("To", style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.grey),),
                        Text(ticket.bus.dropOff.name),
                      ],
                    ),
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
