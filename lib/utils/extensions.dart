

import 'package:intl/intl.dart';

extension Capitalisation on String {
  String capitalise(){
    return this[0].toUpperCase() + substring(1);
  }
}


extension DateParse on DateTime{
  String asString(){
    return DateFormat.yMMMMd().format(this);
  }

  String asTime(){
    return "$hour : $minute ${hour < 12 ? "AM":"PM"}";
  }
}