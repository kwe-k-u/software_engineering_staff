


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:software_engineering/models/bus.dart';
import 'package:software_engineering/models/notification.dart';
import 'package:software_engineering/models/payment_receipt.dart';
import 'package:software_engineering/models/ticket.dart';

Future<List<Bus>> getAvailableBuses({DateTime? date}) async {
  List<Bus> buses = [];
  DateTime _date = DateTime.now();

  if (date == null){//if no bus date is given, check buses for today
    DateTime now = DateTime.now();
    _date = DateTime(now.year, now.month, now.day);
  } else {
    _date = DateTime(date.year, date.month, date.day);
  }


  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  QuerySnapshot<Map<String, dynamic>> results = await firestore.collection("public/bus_system/departure")
      .where("departureDate", isEqualTo: _date.toIso8601String(),).get();


  for (QueryDocumentSnapshot<Map<String,dynamic>> trip in results.docs) {
    Map<String,dynamic> data = {};
    // data["id"] = DateTime.parse(trip.id);
    data.addAll(trip.data());
    buses.add(Bus.fromJson(trip.data()));
  }

  return buses;
}

Future<List<Ticket>> getUserHistory(String id) async {
  List<Ticket> reciepts = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot<Map<String, dynamic>> results = await firestore.collection("public/bus_system/departure")
  .where("userId",isEqualTo: id).get();

  for (QueryDocumentSnapshot<Map<String,dynamic>> document in results.docs){
    reciepts.add(Ticket.fromJson(document.data()));
  }



  return reciepts;
}

Future<double> getAdvancePaymentBalance(String userId) async{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentSnapshot<Map<String, dynamic>> results = await firestore.doc("public/user_info/$userId/advance_balance").get();

  if (results.exists){
    return results.data()!["balance"];
  }

  return 0;
}

Future<void> recordPayment(PaymentReceipt receipt) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  DocumentReference<Map<String, dynamic>> doc =  firestore.collection("public/transactions/payments").doc(receipt.id);
  
  await doc.set(receipt.toJson());
  if (receipt.type == PaymentType.advance) {
    await recordAdvancedPayment(userId: receipt.userId, amount: receipt.amount);
  }
}


Future<List<PaymentReceipt>> getUserTransactions (String userId) async {
  List<PaymentReceipt> receipts = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> docs = await firestore.collection("public/transactions/payments").where("userId", isEqualTo: userId).get();

  for (DocumentSnapshot<Map<String,dynamic>> e in docs.docs){
    receipts.add(PaymentReceipt.fromJson(e.data()!));
  }
  return receipts;
}


Future<void> recordAdvancedPayment({required String userId, required double amount}) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentSnapshot<Map<String, dynamic>> balance = await firestore.doc("public/user_info/$userId/advance_balance").get();

  if (balance.exists) {
    double current = await balance.data()!["balance"];
    current += amount;
    await balance.reference.update({"balance" : current});
  } else {
    await balance.reference.set({"balance" : amount});
  }
}

Future<List<NotificationModel>> getNotifications() async {
  List<NotificationModel> notifications = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot<Map<String, dynamic>> results = await firestore.collection("public/communication/notifications").get();
  // print(results.toString());

  for (QueryDocumentSnapshot<Map<String,dynamic>> document in results.docs){
    // print(document.data()['actions'] ?? NotificationAction.indicateLateness);
    notifications.add(NotificationModel.fromJson(document.data()));
  }
  // print(notifications);
  return notifications;
}


Future<String> uploadImage({required String id, required File image}) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  TaskSnapshot upload = await storage.ref("users/profile/$id").putFile(image);
  return await upload.ref.getDownloadURL();
}

Future<Ticket?> getUnusedTicket(String userId) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot<Map<String, dynamic>> results = await firestore
      .collection("public/communication/notifications").where("userId",isEqualTo: "userId" )
      .where("status", isEqualTo: "active").get();
  // print(results.toString());

  if (results.docs.isNotEmpty){
    return Ticket.fromJson(results.docs.first.data());
  }

  return null;
}
