import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jazzpowertoolsapp/app/data/constant/image_string.dart';

class ImageButton extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color color;
  const ImageButton({Key? key,
    required this.text,
  required this.icon, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ElevatedButton.icon(
      //   onPressed: () {
      //     // Add your button press logic here
      //   },
      //   icon: Icon(icon),
      //   label:  Text(
      //     text,
      //     style: TextStyle(
      //       fontSize: 18,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   style: ElevatedButton.styleFrom(
      //     primary: color,
      //     onPrimary: Colors.white,
      //     elevation: 6,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(16),
      //     ),
      //     padding: EdgeInsets.only(right: 10, left: 10),
      //   ),
      // )
      //
    child: GestureDetector(
      onTap: (){},

      child: Image(
        image: ImageString.game,
      ),
    )
    ,
    );
  }
}
