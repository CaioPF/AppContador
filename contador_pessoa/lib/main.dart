import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de pessoas',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Contador(),
    );
  }
}
class Contador extends StatefulWidget {
  const Contador({ Key? key }) : super(key: key);

  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {

  int count = 0;
  String estadoTela = "Pode entrar!";

  void decrement(){
    setState(() {
      if(count == 0){
        count = 0;
      }
      else{
        count--;
        estadoTela = "Pode entrar!";
      }      
    });        
  }

  void increment(){
    setState(() {
      if(count == 12){
        count = 12;        
      }
      else{
        count++;
        if(count == 12)
        {
          estadoTela = "Lotação máxima!";
        }
      }     
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/restaurant.png"),
            fit: BoxFit.cover)
        ),
        
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(estadoTela, style: TextStyle(fontSize: 30, color: Colors.white),),
          Text(count.toString(), style: TextStyle(fontSize: 100, color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(                
                onPressed: decrement, 
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(100, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                  )
                ),
                child: Text("Saiu", style: TextStyle(fontSize: 16, color: Colors.black))
                ),
              
              SizedBox(width: 64,),
              
              TextButton(
                onPressed: increment, 
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(100, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                  )
                ),
                child: Text("Entrou", style: TextStyle(fontSize: 16, color: Colors.black))
                )
            ],
          )
        ],
      ),
    )
    );
  }
}
