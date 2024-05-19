
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class Snake extends StatefulWidget {
  const Snake({super.key});

  @override
  State<Snake> createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {
  List<int> Snake=[65,85,105,125,145,165];
  int bait=256;
  String duration='None';
  Timer? gameTimer;
  
  void startGame()
  {
      if(duration=='Up')
      {
        setState(() {
            Snake.add(Snake.last-20);
              Snake.remove(Snake.first);
              
        });
      }
      else if(duration=='Down')
        {
          setState((){
                    Snake.add(Snake.last+20);
                    Snake.remove(Snake.first);
        });
          }
        else if(duration=='Left')
        {
          setState(() {
            Snake.add(Snake.last-1);
              Snake.remove(Snake.first);
          });
        }
        else if(duration=='Right')
        {
          setState(() {
             Snake.add(Snake.last+1);
                  Snake.remove(Snake.first);
          });
           
        }
        else
        {
          
        };
  }


    void startGameTimer() {
    gameTimer = Timer.periodic(Duration(milliseconds:200), (timer) {
      startGame();
    });
  }
  
  

@override
void initState() { 
  super.initState();
  startGameTimer();
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children:[
              SizedBox(
                height: 400.0,
                 child:GridView.builder(
                  itemCount:400,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 20,crossAxisSpacing:1,mainAxisSpacing: 1),
               itemBuilder:(context,index){
                if(index==bait)
                {
                  return Container(
                    color:Colors.red,
                  );
                }
                if(Snake.contains(index))
                {
                  return Container(
                    color: Colors.white,
                  );
                }
                if(Snake.last==bait)
                {
                  Snake.add(Snake.last);
                  bait=Random().nextInt(399);
                }
                if(Snake.last<0)
                {
                  Snake=Snake.map((value)=>value+380).toList();
                }
                else if(Snake.first>=399)
                {
                  Snake=Snake.map((value)=>value-400).toList();
                }
                else
              return Container(
                color: Colors.grey[900],
              );
  }
  )
              ),
          FloatingActionButton(onPressed:(){
            setState(() {
              startGame();
              duration='Up';
            });
          }, child:Icon(Icons.arrow_upward)),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    duration='Left';
                  });
                },child: Icon(Icons.arrow_back),),
               FloatingActionButton(onPressed: (){
                setState(() {
                  duration='Right';
                });
               },child: Icon(Icons.arrow_forward),)
            ],
          ),
          Row(
                        mainAxisAlignment: MainAxisAlignment.center,
            children: [
                FloatingActionButton(onPressed: (){
                  startGame();
                  setState(() {
                    duration='Down';
                  });
                },child: Icon(Icons.arrow_downward),),
            ],
          )
            ]
          )
    );
            }
             
     
  }
