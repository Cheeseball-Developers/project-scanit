import 'package:flutter/material.dart';
import 'package:project_scanit/views/scan/scan.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Hero(
                  tag: 'introToCam',
                  child: Material(
                    color: Colors.white,
                    elevation: 8.0,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Welcome to Paper Scanner'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Scan()),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Continue', style: TextStyle(color: Colors.white, fontSize: 14.0,),),
                        Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 14.0,),
                      ],
                    ),
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
