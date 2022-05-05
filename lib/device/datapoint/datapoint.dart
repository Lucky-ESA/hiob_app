import 'dart:async';

import 'package:smart_home/device/datapoint/datapointTypes/datapoint_types.dart';
import 'package:smart_home/device/iobroker_device.dart';

import '../device.dart';

class DataPoint {
  dynamic value;
  String name;
  String id;
  Device? device;
  DataPointType? type;
  String? role;
  String? valueType;

  StreamController valueStreamController = StreamController.broadcast();

  DataPoint({required this.name, required this.device, required this.id,  this.role, this.type});

  factory DataPoint.fromJSON(Map<String, dynamic> json, Device? device)  {
    return DataPoint(name: json["name"], device: device, id: json["id"], role: json["role"], type: json["valueType"]);
  }


  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "type": type,
        "role": role,
        "valueType": valueType,
      };
  set setValue(dynamic value) {
    this.value = value;
    valueStreamController.add(value);
  }
  get isIoBrokerDataPoint => device is IoBrokerDevice;




}