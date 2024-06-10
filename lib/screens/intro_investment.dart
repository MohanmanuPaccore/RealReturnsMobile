import 'package:RealReturns/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common_files/common_size_helper.dart';
import '../reusable/common_button.dart';

class IntroInvestment extends StatefulWidget {
  const IntroInvestment({super.key});

  @override
  State<IntroInvestment> createState() => _IntroInvestmentState();
}

class _IntroInvestmentState extends State<IntroInvestment> {
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
              child: Text('Super Investment app',style: Theme.of(context).textTheme.bodySmall,),
            ),
            SizedBox(height: displayHeight(context)*0.02,),
            Padding(
              padding: EdgeInsets.only(left: displayWidth(context)*0.1,right: displayWidth(context)*0.1),
              child: Text('To Invest Real\nEstate',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: displayWidth(context)*0.09),),
            ),
            SizedBox(height: displayHeight(context)*0.01,),
            SvgPicture.asset(
              'assets/intro_images/investment.svg',
              height: displayHeight(context)*0.45,
              width: displayWidth(context)*1,
              allowDrawingOutsideViewBox: true,
            ),
            SizedBox(height: displayHeight(context)*0.08,),
            Center(
              child: CommonButton().primaryButton(context,
                onTap: (){
                Navigator.pushNamed(context, RouteNames.introReports);
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
