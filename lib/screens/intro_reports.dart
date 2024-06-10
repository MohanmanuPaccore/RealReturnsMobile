import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common_files/common_size_helper.dart';
import '../reusable/common_button.dart';
import '../routes/routes_names.dart';

class IntroReports extends StatefulWidget {
  const IntroReports({super.key});

  @override
  State<IntroReports> createState() => _IntroReportsState();
}

class _IntroReportsState extends State<IntroReports> {
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
              child: Text('Get super\nanalysed ROI\nreports',style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: displayWidth(context)*0.09),),
            ),
            SizedBox(height: displayHeight(context)*0.07,),
            SvgPicture.asset(
              'assets/intro_images/reports.svg',
              height: displayHeight(context)*0.35,
              width: displayWidth(context)*1,
              allowDrawingOutsideViewBox: true,
            ),
            SizedBox(height: displayHeight(context)*0.06,),
            Center(
              child: CommonButton().primaryButton(context,
                onTap: (){
                  Navigator.pushNamed(context, RouteNames.signinScreen);
                },
                height: displayHeight(context)*0.075,
                width: displayWidth(context)*0.8,
                buttonText: 'Get Started',
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
