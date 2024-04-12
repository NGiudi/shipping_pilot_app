import 'dart:convert';

import 'package:shipping_pilot/models/models.dart';

List<Travel> routeFromJson(String str) => List<Travel>.from(json.decode(str).map((x) => Travel.fromJson(x)));

String routeToJson(List<Travel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Travel {
  User driver;
  int price;
  TravelStats stats;
  String status;
  Vehicle vehicle;
  List<Visit> visits;

  Travel({
    required this.driver,
    required this.price,
    required this.stats,
    required this.status,
    required this.vehicle,
    required this.visits,
  });

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
    driver: User.fromJson(json['driver']),
    price: json['price'],
    stats: TravelStats.fromJson(json['stats']),
    status: json['status'],
    vehicle: Vehicle.fromJson(json['vehicle']),
    visits: List<Visit>.from(json['visits'].map((x) => Visit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'driver': driver.toJson(),
    'price': price,
    'stats': stats,
    'status': status,
    'vehicle': vehicle.toJson(),
    'visits': List<dynamic>.from(visits.map((x) => x.toJson())),
  };
}






