import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Bodyy extends StatefulWidget {
  const Bodyy({super.key});

  @override
  State<Bodyy> createState() => _BodyyState();
}

class _BodyyState extends State<Bodyy> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller_;//for tick
  late Animation<double> animation;//for circle
  late Animation<double> animation_;

  @override
  void initState() {
    super.initState();
    controller_ = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2)
    )..repeat(reverse: true);
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    animation_ =CurvedAnimation(parent: controller_, curve: Curves.fastOutSlowIn);
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
   
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    controller_.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: 200,
                  child: RotationTransition(
                    turns: animation,
                    child: const Image(
                      image : AssetImage("imagee/circle.png"),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  right: 50,
                  top: 80,
                  child: Container(
                    height: 50,
                    width: 30,
                    child: ScaleTransition(
                      scale: animation_,
                      
                      child: Image.asset("imagee/tick.png",fit: BoxFit.contain)
                      )
                    ),
                ),
              ],
            ),
            Container(
               margin: EdgeInsets.all(20),
             width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Text("Phone Number Verified",style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w600,
              color: Color(0xFF941B17),
            ),),
            SizedBox(height: 5,),
            Text("You will be redirected to the main page in a few moments",style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Color(0xFF941B17),
            ),
            textAlign: TextAlign.center,
            )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
