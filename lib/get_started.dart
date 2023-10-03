import 'package:flutter/material.dart';
import 'package:game_meta_critics/main_pages.dart';

class GetStarted extends StatelessWidget{

  const GetStarted({Key? key,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 22, 34, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png", width: 150, height: 150,),
            SizedBox(height: 30,),
            Text(
              'Welcome to our aplication',
              style: TextStyle(fontSize: 18.0, 
              fontWeight: FontWeight.bold,
              color: Colors.white),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
              },
             child: Text("Get Started"))
          ],
        ),
      )
      ,
    );
  }

}