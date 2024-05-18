import 'package:flutter/material.dart';

class Snake extends StatefulWidget {
  const Snake({super.key});

  @override
  State<Snake> createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {
  List<int> Snake=[65,85,105,125,145,165];
  int bait=256;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children:[
              SizedBox(
                height: 400.0,
                 child:GridView.builder(
                  itemCount:300,
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
                else
              return Container(
                color: Colors.grey[900],
              );
  }
  )
              ),
          FloatingActionButton(onPressed:(){}, child:Icon(Icons.arrow_upward)),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: (){},child: Icon(Icons.arrow_back),),
               FloatingActionButton(onPressed: (){},child: Icon(Icons.arrow_forward),)
            ],
          ),
          Row(
                        mainAxisAlignment: MainAxisAlignment.center,
            children: [
                FloatingActionButton(onPressed: (){},child: Icon(Icons.arrow_downward),),
            ],
          )
            ]
          )
    );
            }
             
     
  }
