import 'package:flutter/material.dart';
import 'package:profile_app/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        
        title: const Text('HomeScreen',style: TextStyle(color: Colors.white),)
      ),
      body:
      Center(child: 
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.pink[200],
              borderRadius: BorderRadius.circular(16)
            ),
            padding: EdgeInsets.(12),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              icon: Icon(Icons.person,size: 60),
            ),
          )
      )
      

    );
  }
}