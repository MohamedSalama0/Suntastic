// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// import 'package:flutter_svg/svg.dart';

// class HushllssidanWidget extends StatelessWidget {
//           @override
//           Widget build(BuildContext context) {
//           // Figma Flutter Generator HushllssidanWidget - FRAME
//             return Container(
//       width: 375,
//       height: 946,
//       decoration: BoxDecoration(
//           color : Color.fromRGBO(255, 255, 255, 1),
//   ),
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//         top: -9,
//         left: -3,
//         child: Container(
//         width: 387,
//         height: 204,
//         decoration: BoxDecoration(
//           gradient : LinearGradient(
//           begin: Alignment(6.123234262925839e-17,1),
//           end: Alignment(-1,6.123234262925839e-17),
//           colors: [Color.fromRGBO(54, 210, 229, 1),Color.fromRGBO(0, 192, 216, 1)]
//         ),
//   )
//       )
//       ),Positioned(
//         top: -9,
//         left: -3,
//         child: Container(
//         width: 387,
//         height: 204,
//         decoration: BoxDecoration(
//           gradient : LinearGradient(
//           begin: Alignment(6.123234262925839e-17,1),
//           end: Alignment(-1,6.123234262925839e-17),
//           colors: [Color.fromRGBO(0, 192, 216, 1),Color.fromRGBO(175, 231, 239, 1)]
//         ),
//   )
//       )
//       ),Positioned(
//         top: 168,
//         left: 0,
//         child: Container(
//         width: 375,
//         height: 421,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(21),
//             topRight: Radius.circular(21),
//             bottomLeft: Radius.circular(21),
//             bottomRight: Radius.circular(21),
//           ),
//       color : Color.fromRGBO(255, 255, 255, 1),
//   )
//       )
//       ),Positioned(
//         top: 55,
//         left: 41,
//         child: Text('Sample St. 12', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(255, 255, 255, 1),
//         fontFamily: 'Poppins',
//         fontSize: 12,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 75,
//         left: 41,
//         child: Text('Hello John!', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(255, 255, 255, 1),
//         fontFamily: 'Poppins',
//         fontSize: 35,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),
//       const Positioned(
//         top: 195,
//         left: 115,
//         child: Text('DAY', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 14,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),
//       const Positioned(
//         top: 195,
//         left: 164,
//         child: Text('WK', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(0, 0, 0, 1),
//         fontFamily: 'Poppins',
//         fontSize: 14,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 195,
//         left: 207,
//         child: Text('MO', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 14,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 195,
//         left: 251,
//         child: Text('YR', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 14,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 391.5,
//         left: 41,
//         child: SvgPicture.asset(
//         'assets/images/vector15.svg',
//         semanticsLabel: 'vector15'
//       ),
//       ),Positioned(
//         top: 276,
//         left: 81,
//         child: SvgPicture.asset(
//         'assets/images/vector16.svg',
//         semanticsLabel: 'vector16'
//       ),
//       ),
//       const Positioned(
//         top: 230,
//         left: 131,
//         child: Text('Weekly production', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(0, 0, 0, 1),
//         fontFamily: 'Poppins',
//         fontSize: 13,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 267,
//         left: 37,
//         child: Text('20kWh', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 12,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 320,
//         left: 41,
//         child: Container(
//         width: 8,
//         height: 64,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(0, 192, 216, 1),
//   )
//       )
//       ),Positioned(
//         top: 330,
//         left: 51,
//         child: Container(
//         width: 8,
//         height: 54,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(254, 196, 11, 1),
//   )
//       )
//       ),Positioned(
//         top: 285,
//         left: 89,
//         child: Container(
//         width: 8,
//         height: 99,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(0, 192, 216, 1),
//   )
//       )
//       ),Positioned(
//         top: 300,
//         left: 99,
//         child: Container(
//         width: 8,
//         height: 84,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(254, 196, 11, 1),
//   )
//       )
//       ),Positioned(
//         top: 300,
//         left: 134,
//         child: Container(
//         width: 8,
//         height: 84,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(0, 192, 216, 1),
//   )
//       )
//       ),Positioned(
//         top: 326,
//         left: 180,
//         child: Container(
//         width: 8,
//         height: 58,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(0, 192, 216, 1),
//   )
//       )
//       ),Positioned(
//         top: 300,
//         left: 222,
//         child: Container(
//         width: 8,
//         height: 84,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(0, 192, 216, 1),
//   )
//       )
//       ),Positioned(
//         top: 326,
//         left: 265,
//         child: Container(
//         width: 8,
//         height: 58,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(0, 192, 216, 1),
//   )
//       )
//       ),Positioned(
//         top: 300,
//         left: 308,
//         child: Container(
//         width: 8,
//         height: 84,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(0, 192, 216, 1),
//   )
//       )
//       ),Positioned(
//         top: 309,
//         left: 144,
//         child: Container(
//         width: 8,
//         height: 75,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(254, 196, 11, 1),
//   )
//       )
//       ),Positioned(
//         top: 309,
//         left: 190,
//         child: Container(
//         width: 8,
//         height: 75,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(254, 196, 11, 1),
//   )
//       )
//       ),Positioned(
//         top: 337,
//         left: 232,
//         child: Container(
//         width: 8,
//         height: 47,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(254, 196, 11, 1),
//   )
//       )
//       ),Positioned(
//         top: 357,
//         left: 275,
//         child: Container(
//         width: 8,
//         height: 27,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(254, 196, 11, 1),
//   )
//       )
//       ),Positioned(
//         top: 320,
//         left: 318,
//         child: Container(
//         width: 8,
//         height: 64,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(10),
//             topRight: Radius.circular(10),
//             bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10),
//           ),
//       color : Color.fromRGBO(254, 196, 11, 1),
//   )
//       )
//       ),Positioned(
//         top: 393,
//         left: 47,
//         child: Text('M', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 13,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 393,
//         left: 94,
//         child: Text('T', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 13,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 393,
//         left: 137,
//         child: Text('W', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 13,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 393,
//         left: 185,
//         child: Text('T', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 13,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 393,
//         left: 228,
//         child: Text('F', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 13,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 393,
//         left: 270,
//         child: Text('S', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 13,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 394,
//         left: 313,
//         child: Text('S', textAlign: TextAlign.center, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 13,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 422,
//         left: 57,
//         child: Container(
//         width: 15,
//         height: 15,
//         decoration: BoxDecoration(
//           color : Color.fromRGBO(0, 192, 216, 1),
//       borderRadius : BorderRadius.all(Radius.elliptical(15, 15)),
//   )
//       )
//       ),Positioned(
//         top: 422,
//         left: 196,
//         child: Container(
//         width: 15,
//         height: 15,
//         decoration: BoxDecoration(
//           color : Color.fromRGBO(254, 196, 11, 1),
//       borderRadius : BorderRadius.all(Radius.elliptical(15, 15)),
//   )
//       )
//       ),Positioned(
//         top: 423,
//         left: 78,
//         child: Text('your production', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 9,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),
//       const Positioned(
//         top: 423,
//         left: 217,
//         child: Text('availible sunlight this week last year', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(196, 196, 196, 1),
//         fontFamily: 'Poppins',
//         fontSize: 9,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1.3333333333333333
//       ),),
//       ),Positioned(
//         top: 469,
//         left: 32,
//         child: Container(
//         width: 311,
//         height: 126,
//         decoration: const BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(15),
//             topRight: Radius.circular(15),
//             bottomLeft: Radius.circular(15),
//             bottomRight: Radius.circular(15),
//           ),
//       color : Color.fromRGBO(255, 243, 230, 1),
//   )
//       )
//       ),Positioned(
//         top: 515,
//         left: 127,
//         child: Text('16kWh', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(255, 139, 3, 1),
//         fontFamily: 'Poppins',
//         fontSize: 36,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 500,
//         left: 130,
//         child: Text('Current production', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(0, 0, 0, 1),
//         fontFamily: 'Poppins',
//         fontSize: 12,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 212,
//         left: 166,
//         child: Transform.rotate(
//         angle: 1.4033419209422001e-14 * (math.pi / 180),
//         child: SvgPicture.asset(
//         'assets/images/vector17.svg',
//         semanticsLabel: 'vector17'
//       ),
//       )
//       ),Positioned(
//         top: 606,
//         left: 32,
//         child: Container(
//         width: 311,
//         height: 97,
//         decoration: BoxDecoration(
//           borderRadius : BorderRadius.only(
//             topLeft: Radius.circular(15),
//             topRight: Radius.circular(15),
//             bottomLeft: Radius.circular(15),
//             bottomRight: Radius.circular(15),
//           ),
//       boxShadow : [BoxShadow(
//           color: Color.fromRGBO(0, 0, 0, 0.07000000029802322),
//           offset: Offset(0,2),
//           blurRadius: 10
//       )],
//       color : Color.fromRGBO(255, 255, 255, 1),
//   )
//       )
//       ),Positioned(
//         top: 636,
//         left: 67,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       ),
//       ),Positioned(
//         top: 629,
//         left: 109,
//         child: Text('Your panels are producing more than usual. Take the opportunity to do some laundry', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(0, 0, 0, 1),
//         fontFamily: 'Poppins',
//         fontSize: 12,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 57,
//         left: 251,
//         child:  //Mask holder Template
//     Container(
//       width: 83.31682586669922,
//       height: 85,
//       child: null
//     )
//       ),Positioned(
//         top: 53,
//         left: 141,
//         child: Container(
//       width: 21,
//       height: 21,
//       decoration: BoxDecoration(
//           color : Color.fromRGBO(255, 255, 255, 1),
//   ),
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//         top: 5.25,
//         left: 7.516269683837891,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       ),
//       ),Positioned(
//         top: 0,
//         left: 0,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       ),
//       ),
//         ]
//       )
//     )
//       ),Positioned(
//         top: 725,
//         left: 30,
//         child: Container(
//       width: 345,
//       height: 97,
//       decoration: BoxDecoration(
//           color : Color.fromRGBO(255, 255, 255, 1),
//   ),
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//         top: 0,
//         left: 640,
//         child: null
//       ),Positioned(
//         top: 0,
//         left: 320,
//         child: null
//       ),Positioned(
//         top: 0,
//         left: 0,
//         child: null,
//       ),
//         ]
//       )
//     )
//       ),Positioned(
//         top: 867,
//         left: -14,
//         child: Container(
//       width: 395,
//       height: 79,
      
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//         top: 0,
//         left: 0,
//         child: Container(
//         width: 395,
//         height: 79,
//         decoration: BoxDecoration(
//           boxShadow : [BoxShadow(
//           color: Color.fromRGBO(0, 0, 0, 0.07000000029802322),
//           offset: Offset(2,0),
//           blurRadius: 10
//       )],
//       color : Color.fromRGBO(255, 255, 255, 1),
//   )
//       )
//       ),Positioned(
//         top: 18,
//         left: 148,
//         child: Container(
//       width: 21.156707763671875,
//       height: 21.156707763671875,
      
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//         top: 13.752002716064453,
//         left: 3.17360520362854,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 12.693990707397461,
//         left: 3.17360520362854,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 14.80958366394043,
//         left: 0,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 17.98318862915039,
//         left: 0,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 10.049391746520996,
//         left: 9.5203857421875,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 0,
//         left: 14.80958366394043,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 2.0514583587646484,
//         left: 9.98525619506836,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 8.927675247192383,
//         left: 9.98525619506836,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 2.0514583587646484,
//         left: 17.39090919494629,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 8.928105354309082,
//         left: 17.39090919494629,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 3.702610969543457,
//         left: 11.636408805847168,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 6.875786304473877,
//         left: 8.462803840637207,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 6.875786304473877,
//         left: 17.98318862915039,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),
//         ]
//       )
//     )
//       ),Positioned(
//         top: 18,
//         left: 313,
//         child: Container(
//       width: 21.15688133239746,
//       height: 21.15657615661621,
      
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//         top: 0,
//         left: 10.578397750854492,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 3.406471014022827,
//         left: 3.4064712524414062,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 10.577966690063477,
//         left: 19.041200637817383,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 6.348502159118652,
//         left: 7.933797836303711,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 10.576244354248047,
//         left: 0,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 3.406471014022827,
//         left: 16.24810028076172,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),
//         ]
//       )
//     )
//       ),Positioned(
//         top: 21,
//         left: 231,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),Positioned(
//         top: 19,
//         left: 68,
//         child: Container(
//       width: 18,
//       height: 18.223817825317383,
      
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//         top: 0,
//         left: 0,
//         child: SvgPicture.asset(
//         'assets/images/vector.svg',
//         semanticsLabel: 'vector'
//       );
//       ),
//         ]
//       )
//     )
//       ),Positioned(
//         top: 42,
//         left: 57,
//         child: Text('overview', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(0, 192, 216, 1),
//         fontFamily: 'Poppins',
//         fontSize: 9,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 42,
//         left: 131,
//         child: Text('production', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(166, 166, 166, 1),
//         fontFamily: 'Poppins',
//         fontSize: 9,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 42,
//         left: 211,
//         child: Text('consumption', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(166, 166, 166, 1),
//         fontFamily: 'Poppins',
//         fontSize: 9,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),Positioned(
//         top: 42,
//         left: 294,
//         child: Text('weather data', textAlign: TextAlign.left, style: TextStyle(
//         color: Color.fromRGBO(166, 166, 166, 1),
//         fontFamily: 'Poppins',
//         fontSize: 9,
//         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//         fontWeight: FontWeight.normal,
//         height: 1
//       ),)
//       ),
//         ]
//       )
//     )
//       ),Positioned(
//         top: 907,
//         left: 0,
//         child: null
//       ),
//         ]
//       )
//     );
//           }
//         }
        