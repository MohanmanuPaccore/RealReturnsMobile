import 'package:RealReturns/common_files/common_size_helper.dart';
import 'package:RealReturns/reusable/common_button.dart';
import 'package:RealReturns/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
    class IntroFutureRealEstate extends StatefulWidget {
      const IntroFutureRealEstate({super.key});
    
      @override
      State<IntroFutureRealEstate> createState() => _IntroFutureRealEstateState();
    }
    
    class _IntroFutureRealEstateState extends State<IntroFutureRealEstate> {
      @override
      Widget build(BuildContext context) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: displayHeight(context)*0.1,),
                Padding(
                  padding: EdgeInsets.only(left: displayWidth(context)*0.1,right: displayWidth(context)*0.1),
                  child: Text('Start Investing early',style: Theme.of(context).textTheme.bodySmall,),
                ),
                SizedBox(height: displayHeight(context)*0.02,),
                Padding(
                  padding: EdgeInsets.only(left: displayWidth(context)*0.1,right: displayWidth(context)*0.1),
                  child: Text('The Future\nof Real Estate\nInvestment',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: displayWidth(context)*0.09),),
                ),
                SizedBox(height: displayHeight(context)*0.05,),
                SvgPicture.asset(
                  'assets/intro_images/future_real_estate.svg',
                  height: displayHeight(context)*0.35,
                  width: displayWidth(context)*1,
                  allowDrawingOutsideViewBox: true,
                ),
                SizedBox(height: displayHeight(context)*0.08,),
                Center(
                  child: CommonButton().primaryButton(context,
                    onTap: (){
                    Navigator.pushNamed(context, RouteNames.introInvestment);
                    },
                    height: displayHeight(context)*0.075,
                    width: displayWidth(context)*0.8,
                    buttonText: 'Next',
                  ),
                ),
                SizedBox(height: displayHeight(context)*0.037,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Know More about',style: Theme.of(context).textTheme.bodySmall,),
                    Text(' RealReturns.ai',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.blueAccent.shade700),),
                ],)
              ],
            ),
          ),
        );
      }
    }
    