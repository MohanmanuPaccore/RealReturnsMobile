import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BackgroundIcon extends StatelessWidget {
  final Widget? child;
  const BackgroundIcon({super.key,
  required this.child
  
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: 
            Stack(children: [
              Positioned(
                top: 0,
                right: 0,
            
                child: Image.asset(
                  'assets/icons/percentage.png',
                  width: 153,
                  height: 166,
                ),
              ),
              Positioned(
                top: 50,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                  'assets/icons/app_icon.png',
                  width: MediaQuery.sizeOf(context).width*0.10,
                  height:                MediaQuery.sizeOf(context).height*0.05,
            
                ),
            
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Real Returns',
                  style: Theme.of(context).textTheme.displayLarge,
                  
                  ),
                )
                  ],
                  
                ),
            
              
              ),
                          Container(
                            margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height/7),
                            child: child!),

            ],),
          
        
      )

      
      ),
    );
  }
}