import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suntastic/screens/graph.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Suntastic',
          style: TextStyle(color: Colors.black),
        ),
        leading: Image.asset('images/19343422541551682371-128.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const ListTile(
              contentPadding: EdgeInsets.only(left: 60.0),
              title: Text('Selected Year: 2020'),
              leading: Icon(Icons.lock),
            ),

            ///Space
            const SizedBox(
              height: 10.0,
            ),
             TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: 'Weekly average sunshine: example:100KJ',
              ),
            ),

            ///Space
            const SizedBox(
              height: 15.0,
            ),
             TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: 'Temporal Resolution: example 65 F/M',
              ),
            ),

            ///Space
            const SizedBox(
              height: 15.0,
            ),

            ///Click Button
            ElevatedButton(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              onPressed: () {},
              child: const Text('Click to show Graph'),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                ),
                elevation: 3.0,
                shadowColor: Colors.cyan,
                primary: Colors.grey,
                padding: const EdgeInsets.all(15.0),
              ),
            ),

            GraphScreen(),
          ],
        ),
      ),
    );
  }
}
