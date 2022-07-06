import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
          center: controller.latLngList[0],
          bounds: LatLngBounds.fromPoints(controller.latLngList),
          zoom: controller.zoom,
          plugins: [
            MarkerClusterPlugin(),
          ],
          // onTap: (_) => controller.popupController.h,
        ),
        layers: [
          TileLayerOptions(
            minZoom: 2,
            maxZoom: 18,
            backgroundColor: Colors.black,
            // errorImage: ,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 190,
            disableClusteringAtZoom: 16,
            size: Size(50, 50),
            fitBoundsOptions: const FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: controller.markers,
            polygonOptions: const PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            popupOptions: PopupOptions(
                popupSnap: PopupSnap.mapTop,
                popupController: controller.popupController,
                popupBuilder: (_, marker) => Container(
                      color: Colors.amberAccent,
                      child: const Text('Popup'),
                    )),
            builder: (context, markers) {
              return Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.orange, shape: BoxShape.circle),
                child: Text('${markers.length}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
