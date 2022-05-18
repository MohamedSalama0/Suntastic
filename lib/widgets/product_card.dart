import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductCard extends StatelessWidget {
  var productImage;
  String productTitle;
  String productPrice;
  var urlLink;

   ProductCard({Key? key,required this.urlLink, this.productImage, required this.productTitle, required this.productPrice})
      : super(key: key);

  Future<void> _openLink (String link)async{
    var urlLink =link;
    if(await canLaunch(urlLink))
    {
      await launch(urlLink);
    }else{
      throw 'Could not launch====>> $urlLink';
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        print('this is the URL===>$urlLink');
        _openLink("$urlLink");
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  productImage,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: Text(
                  productTitle.toLowerCase(),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
              ),
               Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Price:$productPrice\$',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
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
