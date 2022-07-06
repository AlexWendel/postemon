import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends GetxController {
  final PopupController popupController = PopupController();
  MapController mapController = MapController();
  double zoom = 7;
  final List<LatLng> latLngList = [
    LatLng(-5.3375373, -49.136),
    LatLng(-5.3601298, -49.0854036),
    LatLng(-5.3602171, -49.0835898),
    LatLng(-5.3611305, -49.0841511)
  ];
  List<Marker> markers = [];

  @override
  void onInit() {
    markers = latLngList
        .map((point) => Marker(
              point: point,
              width: 60,
              height: 60,
              builder: (context) => const Icon(
                Icons.pin_drop,
                size: 40,
                color: Colors.blueAccent,
              ),
            ))
        .toList();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
