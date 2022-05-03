import "package:flutter/material.dart";
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/models/ticket.dart';
import 'package:software_engineering/screens/ticket_history/widget/ticket_receipt_tile.dart';
import 'package:software_engineering/utils/constants.dart';
import 'package:software_engineering/utils/firestore_helper.dart';
import 'package:provider/provider.dart';


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
        title: const Text("History"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Ticket>>(
        future: getUserHistory(context.read<AppState>().auth!.currentUser!.uid),
        initialData: const [],
        builder: (context,snapshot){
          if (snapshot.hasData){
            if (snapshot.data!.isEmpty){
              return const Center(child: Text("You have no trip history. Book a trip to get one"),);
            }
            return ListView.builder(
                itemBuilder: (context,index)=>  TicketReceiptTile(ticket: snapshot.data![index],)
            );
          }

          return const Text("There seems to be some error");

        },
      ),
    );
  }
}
