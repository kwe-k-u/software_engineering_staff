

import 'package:software_engineering/models/RouteLocation.dart';
import 'package:software_engineering/models/driver.dart';

class Bus{
  final String? id;
  final String imageUrl;
  final double fare;
  final String busRegistrationNumber;
  final DateTime departureDate; ///The day that this trip will take place
  final DateTime setOffTime; ///The time that the bus leaves
  final int maxCapacity;
  final int bookedSeats;
  final RouteLocation pickup;
  final RouteLocation dropOff;
  final Driver driver;

  bool get isFull => maxCapacity == bookedSeats;
  bool get hasDeparted => setOffTime.isAfter(DateTime.now());

  Bus({
     this.id,
    required this.imageUrl,
    required this.fare,
    required this.busRegistrationNumber,
    required this.driver,
    required this.departureDate,
    required this.maxCapacity,
    required this.bookedSeats,
    required this.pickup,
    required this.dropOff,
    required this.setOffTime,

});


  factory Bus.fromJson(Map<String,dynamic> map) => Bus(
    id: map["id"],
    imageUrl: map["imageUrl"],
    fare: map["fare"],
    busRegistrationNumber: map["busRegistrationNumber"],
    departureDate: DateTime.parse(map["departureDate"]),
    maxCapacity: map["maxCapacity"],
    bookedSeats: map["bookedSeats"],
    setOffTime: map["setOffTime"],
    driver: Driver.fromJson(map["driver"]),
    pickup: RouteLocation.fromJson(map["pickup"]),
    dropOff: RouteLocation.fromJson(map["dropOff"])
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "imageUrl" : imageUrl,
    "fare" : fare,
    "busRegistrationNumber" : busRegistrationNumber,
    "departureDate" : departureDate,
    "setOffTime" : setOffTime,
    "maxCapacity" : maxCapacity,
    "bookedSeats" : bookedSeats,
    "driver" : driver.toJson(),
    "pickup" : pickup.toJson(),
    "dropOff" : dropOff.toJson()
  };





}


