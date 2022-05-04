import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/models/payment_receipt.dart';
import 'package:software_engineering/utils/firestore_helper.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<PaymentReceipt>>(
          future: getUserTransactions(context.read<AppState>().auth!.currentUser!.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Text(index.toString()),
              );
            }
              return const Center(
                child: CircularProgressIndicator()
              );
      },
    ));
  }
}
