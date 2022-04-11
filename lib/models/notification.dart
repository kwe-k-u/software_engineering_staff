enum NotificationSender {
  administrator,
  driver
}

enum NotificationAction{
  indicateLateness
}

class Notification{
  final NotificationSender sender;
  final String message;
  final DateTime dateSent;
  final List<NotificationAction>? actions;


  Notification({
    required this.sender,
    required this.message,
    required this.actions,
    required this.dateSent
});


  factory Notification.fromJson(Map<String,dynamic> map) => Notification(
    sender: NotificationSender.values.firstWhere((element) => element.name == map["sender"]),
    message: map["message"],
    dateSent: DateTime.parse(map["dateSent"]),
    actions: map['actions'] !?? NotificationAction.indicateLateness
  );

}