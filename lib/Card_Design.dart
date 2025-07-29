import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  final Gradients;
  final Texts;
  final FontSize;
  final IconSize;
  final Width;
  final Height;
  final Context;
  final IconName;
  final ShadeColor;


  CardDesign({
    Key? key,
    required this.Gradients,
    required this.Texts,
    required this.Width,
    required this.Height,
    required this.IconName,
    required this.FontSize,
     this.IconSize=24.0,
    required this.Context,
    required this.ShadeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(Context).size.height/100;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: Gradients,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
          boxShadow: [BoxShadow(
              color: ShadeColor,
              blurRadius: 15,
              offset: Offset(0, 10)
          )]
      ),
      width: Width,
      height: Height,
      child: Padding(
        padding: const EdgeInsets.only(top: 17,left: 17,right: 17,bottom: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                IconName,
                color: Colors.white,
                size: IconSize,
              ), //1.self_improvement, 2.balance 3.spa 4.blur_circular
              decoration: BoxDecoration(
                color: Color(0x34FFFFFF),
                border: Border.all(color: Color(0x4CFFFFFF), width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: size* 2.5),
            Text(
              Texts[0],
              style: TextStyle(
                fontSize: FontSize[0],
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size * 0.7),
            Text(
              Texts[1],
              style: TextStyle(color: Colors.white, fontSize: FontSize[1]),
            ),
            SizedBox(height:size * 0.8),
            Text(
              Texts[2],
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: FontSize[1],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
