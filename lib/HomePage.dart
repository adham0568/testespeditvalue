import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num = 0;

  DatabaseReference _databaseReference =
  FirebaseDatabase.instance.reference();

  Future<void> updateNumValue(int newValue) async {
    try {
      await _databaseReference.child('test/stream/data/json/num').set(newValue);
    } catch (error) {
      print('Error updating num: $error');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Test Contral Motor App",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if(num == 0){
                    updateNumValue(1);
                    setState(() {
                      num=1;
                      print(num);
                    });
                  }

                  else if(num == 1){
                    updateNumValue(0);
                    setState(() {
                      num=0;
                      print(num);
                    });
                  }

                },
                child: Container(
                  height: 200,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
