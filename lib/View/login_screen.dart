import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:suntastic/View/home_screen.dart';
import 'package:suntastic/View/map_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = TextEditingController();
  LatLng? locationToSearch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2D974),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('images/sunlogo.png',scale: 1.5,),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: const Text(
                  'Welcomne To Suntastic',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.drive_file_rename_outline,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'User Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller,
                readOnly: true,
                onTap: () async {
                  final recievedData = await Navigator.push<LatLng>(
                      context, MaterialPageRoute(builder: (_) => MapScreen()));
                  if (recievedData == null) return;
                  controller.text =
                      '(${recievedData.latitude} , ${recievedData.longitude})';
                  locationToSearch = recievedData;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Location',
                  icon: const Icon(
                    Icons.edit_location_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  if (locationToSearch == null) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen(position: locationToSearch!);
                      },
                    ),
                  );
                },
                child: FittedBox(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 25,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "START ",
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
