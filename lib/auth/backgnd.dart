import 'package:flutter/material.dart';
class backgnd extends StatelessWidget {
  @override
  final Widget child;
  const backgnd({
    Key key, this.child
}):super (key:key);
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width: double.infinity  ,height: size.height,

        child: Stack(alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,right: 0,
          child: ClipRRect(child: Image.asset("assets/images/top1.png",width: size.width,fit: BoxFit.fill,),
          )
          ),
          Positioned(
            top: 0,left: 0,
            child: ClipRRect(child: Image.asset("assets/images/top2.png",width: size.width,fit: BoxFit.fill,)),
          ),
          Positioned(
            bottom: 0,right: 0,
            child: ClipRRect(child: Image.asset("assets/images/bottom1.png",width: size.width,fit: BoxFit.fill,)),
          ),
          Positioned(
            bottom: 0,right: 0,
            child: ClipRRect(child: Image.asset("assets/images/bottom2.png",width: size.width,fit: BoxFit.fill,)
            ),
          ),
          Positioned(
            bottom: 0,right: 0,
            child: Text("Developed by DHA SUFFA University Students",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),
            ),)
        ,
          child
        ],



        ),


    );
  }
}
