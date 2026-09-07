import 'dart:async'; // تمكنك من استخدام Timer
import 'package:second_project/bmi_screen.dart';
import 'package:flutter/material.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen11State();
}

class _screen11State extends State<screen1> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            // مدة حركة الانتقال بالمللي ثانية (هنا ثانية ونصف)
            transitionDuration: const Duration(milliseconds: 1500),

            pageBuilder: (context, animation, secondaryAnimation) => const BmiScreen(),

            // تأثير الاختفاء والظهور ببطء (Fade Animation)
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.white60,
      ),
      body:
      SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("BMI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 42,color: Colors.deepPurple[400]),),
              Text("Calculator",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30,),),
              SizedBox(height: 15,),
              Text("Know your body.\nLive a healthier life.",style: TextStyle(fontSize: 16),),

              Center(child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSNQhJ6uJtKLy2yUh61nislVoJGjAjiRIGwY1p2MrQeg&s=10",
                height: 220,
                width: 220,
              )),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const BmiScreen()));
                  },
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Get Started",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                      SizedBox(width: 8,),
                      Icon(Icons.arrow_forward,color: Colors.white,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Center(child: Text("Learn More",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w100),))
            ],
          ),
        ),
      ),
    );
  }
}
