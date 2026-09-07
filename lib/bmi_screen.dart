import 'package:second_project/result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double age = 20;
  int weight = 1;
  int height = 20;

  double calculateBMI(){
    return weight / ((height/100)*(height/100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child:
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Age", style: TextStyle(fontSize: 18),),
                    SizedBox(height: 10,),
                    Text("${age.round()} Years", style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),),
                    Slider(
                        value: age,
                        min: 1,
                        max: 100,
                        divisions: 99,
                        label: age.round().toString(),
                        onChanged: ((value) {
                          setState(() {
                            age = value;
                          });
                        })),


                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [

                Expanded(
                  child: Card(
                    child:
                    Center(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Weight",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 5,),
                            Text("$weight KG",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: "weight",
                                  mini: true,
                                  onPressed: (){
                                    setState(() {
                                      if (weight > 1) { // بشرط ألا يقل عن 1
                                        weight--;
                                      }
                                    });
                                  },
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 13,),
                                FloatingActionButton(
                                  heroTag: "weight",
                                  mini: true,
                                  onPressed: (){
                                    setState(() {
                                      if(weight<300) {
                                        weight++;
                                      }});
                                  },
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10,),
                Expanded(
                  child: Card(
                    child:
                    Center(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Height",style: TextStyle(fontSize: 18),),
                            SizedBox(height: 5,),
                            Text("$height cm",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: "height",
                                  mini: true,
                                  onPressed: (){
                                    setState(() {
                                      if (height > 20) { // بشرط ألا يقل عن 1
                                        height--;
                                      }
                                    });
                                  },
                                  child: Icon(Icons.remove),
                                ),
                                SizedBox(width: 13,),
                                FloatingActionButton(
                                  heroTag: "height",
                                  mini: true,
                                  onPressed: (){
                                    setState(() {
                                      if (height < 300) { // بشرط ألايزيد عن 300
                                        height++;
                                      }
                                    });
                                  },
                                  child: Icon(Icons.add),

                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 25,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultScreen(
                      bmi: calculateBMI(),
                      age: age.round(),
                    ),
                  ),
                );
              }, child:Text("Calculate BMI",style: TextStyle(fontSize: 20),)),
            ),
          ],
        ),
      ),
    );
  }
}