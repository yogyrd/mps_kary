// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';

const LatLng SOURCE_LOCATION = LatLng(-7.349574, 112.783853);
const double CAMERA_ZOOM = 17;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 0;

class AbsenMasukScreen extends StatefulWidget {
  const AbsenMasukScreen({Key? key}) : super(key: key);

  @override
  State<AbsenMasukScreen> createState() => _AbsenMasukScreenState();
}

class _AbsenMasukScreenState extends State<AbsenMasukScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor markerIcon;
  Set<Marker> _marker = Set<Marker>();

  late LatLng currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.setInitialLocation();
    this.setSourceMarkerIcon();
  }

  void setSourceMarkerIcon() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2),
      'assets/images/pin.png'
    );
  }

  void setInitialLocation() {
    currentLocation = LatLng(
      SOURCE_LOCATION.latitude,
      SOURCE_LOCATION.longitude
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height - (size.height * 0.2);

    CameraPosition initialCameraPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: SOURCE_LOCATION
    );

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              myLocationEnabled: false,
              compassEnabled: false,
              tiltGesturesEnabled: false,
              markers: _marker,
              mapType: MapType.normal,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                
                showPinOnMap();
              }
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.only(right: 0, left: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset.zero
                  )
                ]
              ),
              child: Row(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                      )
                    ),
                    // decoration: BoxDecoration(
                    //   borderRadius: 
                    // ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showPinOnMap() {
    print(currentLocation);
    setState(() {
      _marker.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: currentLocation,
        icon: markerIcon
      ));
    });
  }
}