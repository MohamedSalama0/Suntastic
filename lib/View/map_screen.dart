import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool showBottomActions = true;
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  final LatLng _center = const LatLng(30.1356215, 31.2928607);
  late Marker marker = Marker(markerId: MarkerId('1'), position: _center);
  @override
  void initState() {
    super.initState();
    _markers.add(marker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select location'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: _showDailogInformation, icon: Icon(Icons.info))
          ],
        ),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildMap(),
              _buildSaveButton(),
            ],
          ),
        ));
  }

  void _showDailogInformation() async {
    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Information about the app'),
              content: Text(
                'To change the value of location :\n\tclick on the button then click at any area of map',
              ),
            ));
  }

  Widget _buildMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      markers: _markers,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 8.0,
      ),
      onCameraMove: (x) {
        setState(() {
          _markers.clear();
        });
        setState(() {
          _markers.add(Marker(markerId: MarkerId('1'), position: x.target));
        });
      },
      onCameraIdle: () => print('Idle'),
      onTap: _onMapTapped,
      mapToolbarEnabled: false,
      myLocationButtonEnabled: true,
    );
  }

  void _onMapTapped(LatLng position) {}

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop<LatLng>(context, _markers.first.position);
      },
      child: Text('Save location'),
      style: ButtonStyle(
          textStyle: materialProperty(
              TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          backgroundColor: materialProperty(Colors.amber)),
    );
  }

  MaterialStateProperty<T> materialProperty<T>(T prop) {
    return MaterialStateProperty.all(prop);
  }
}
