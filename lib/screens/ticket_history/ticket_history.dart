import "package:flutter/material.dart";
import 'package:software_engineering/screens/ticket_history/widget/ticket_receipt_tile.dart';


class TicketHistory extends StatefulWidget {
  const TicketHistory({Key? key}) : super(key: key);

  @override
  _TicketHistoryState createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index)=> TicketReceiptTile());
  }
}
