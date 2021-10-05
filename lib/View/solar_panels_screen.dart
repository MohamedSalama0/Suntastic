import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suntastic/widgets/product_card.dart';
import 'package:url_launcher/url_launcher.dart';

class SolarPanelsScreen extends StatelessWidget {
  const SolarPanelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Solar Panels',
          style: TextStyle(
            color: Color(0xffFFC947),
            fontSize: 22.0,
            fontFamily: 'neue',
          ),
        ),
        backgroundColor: const Color(0xff45526C),
      ),
      backgroundColor: const Color(0xff45526C),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: [
                ProductCard(
                  productTitle:
                      'WEIZE 200 Watt 12 Volt Monocrystalline Solar Panel',
                  productImage: 'assets/images/product1.jpg',
                  productPrice: '199.99',
                  urlLink: 'https://www.amazon.com/WEIZE-Watt-Monocrystalline-Solar-Panel/dp/B08721CBST/ref=sr_1_3?_encoding=UTF8&c=ts&dchild=1&keywords=Solar+Panels&qid=1633392869&s=lawn-garden&sr=1-3&ts_id=2236628011',
                ),
                ProductCard(
                  productTitle:
                      'Jackery SolarSaga 60W Solar Panel as Portable Solar Generator',
                  productImage: 'assets/images/product2.jpg',
                  productPrice: '179.99',
                  urlLink: 'https://www.amazon.com/Jackery-SolarSaga-Explorer-Portable-Generator/dp/B07PGS2WN8/ref=sr_1_13?_encoding=UTF8&c=ts&dchild=1&keywords=Solar+Panels&qid=1633392869&s=lawn-garden&sr=1-13&ts_id=2236628011',
                ),
                ProductCard(
                  productTitle:
                      'BLUETTI SP200 200w Solar Panel for Power Station',
                  productImage: 'assets/images/product3.jpg',
                  productPrice: '499.99',
                  urlLink: 'https://www.amazon.com/BLUETTI-Station-Portable-Foldable-Outdoor/dp/B08XB4FW2H/ref=sr_1_9?_encoding=UTF8&c=ts&dchild=1&keywords=Solar+Panels&qid=1633392869&s=lawn-garden&sr=1-9&ts_id=2236628011',
                ),
                ProductCard(
                  productTitle:
                      '120W Solar Charger, Portable Solar Panels for Jackery/Rockpals',
                  productImage: 'assets/images/product4.jpg',
                  productPrice: '188.99',
                  urlLink: 'https://www.amazon.com/Portable-Rockpals-Generator-Foldable-Kickstand/dp/B09BMTMG5M/ref=sr_1_2_sspa?_encoding=UTF8&c=ts&dchild=1&keywords=Solar%2BPanels&qid=1633392869&s=lawn-garden&sr=1-2-spons&ts_id=2236628011&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFHUEVHS1VQUk9CSEkmZW5jcnlwdGVkSWQ9QTA5ODAwMzcxNjU5TVBFRlNQWEJNJmVuY3J5cHRlZEFkSWQ9QTAyMTUwMzYxRElKVERMMEhNWURMJndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ&th=1',
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                'Buy Them Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontFamily: 'neue',
                ),
              ),
              Image.asset(
                'assets/images/pngegg.png',
                scale: 7.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
