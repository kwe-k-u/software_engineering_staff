import "package:flutter/material.dart";
import 'package:software_engineering/screens/ticket_history/widget/ticket_receipt_tile.dart';
import 'package:software_engineering/utils/constants.dart';


class TicketHistory extends StatefulWidget {
  const TicketHistory({Key? key}) : super(key: key);

  @override
  _TicketHistoryState createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ashesiRed,
        title: Text("History"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (context,index)=> const TicketReceiptTile()
      ),
    );
  }
}
