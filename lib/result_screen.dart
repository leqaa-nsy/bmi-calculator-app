import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,
    required this.bmi,
    required this.age,
  });
  final double bmi;
  final int age;
  String get status {
    if (bmi <18.5) return 'Underweight';
    if (bmi >=18.5 && bmi <= 25) return 'Normal';
    if (bmi >25 && bmi <= 30) return 'Overweight';
    return 'Obesity range';
  }

  Color get statusColor{
    if (bmi <18.5) return Colors.blue;
    if (bmi >=18.5 && bmi <= 25) return Colors.green;
    if (bmi >25 && bmi <= 30) return Colors.deepOrangeAccent;
    return Colors.red;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back,color: Colors.blueGrey,)),
        title: Text('BMI Result',style: TextStyle(color: Colors.blueGrey,fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:
      Center(
        child: Container(
          width: 240,
          padding: EdgeInsets.fromLTRB(20, 22, 20, 25),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Color(0x25000000),
                blurRadius: 5,
                offset: Offset(0,3),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Your BMI",style: TextStyle(color: Color(0xff211d27),fontWeight: FontWeight.w700,fontSize: 23),),
              SizedBox(height: 27),
              Text(bmi.toStringAsFixed(1), style: TextStyle(color: statusColor, fontSize: 50, height: 1, fontWeight: FontWeight.w500,),),
              SizedBox(height: 27),
              Text(status, textAlign: TextAlign.center, style: TextStyle(color: statusColor, fontSize: 24, fontWeight: FontWeight.w700,),),
              Text('Age: $age Years', style: const TextStyle(color: Color(0xff211d27), fontSize: 20,),),
            ],
          ),
        ),
      ),

    );
  }
}

