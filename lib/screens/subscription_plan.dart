import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common_files/common_size_helper.dart';
import '../constants/color_constants.dart';
class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: displayWidth(context)*0.62),
              child: SvgPicture.asset(
                'assets/signin/Group.svg',
                height: displayHeight(context)*0.2,
                width: displayWidth(context)*0.32,
                allowDrawingOutsideViewBox: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: displayWidth(context)*0.07,right:displayWidth(context)*0.075 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: displayHeight(context)*0.08,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/signin/logo_signin.svg',
                        height: displayHeight(context)*0.06,
                        width: displayWidth(context)*0.12,
                        allowDrawingOutsideViewBox: true,
                      ),
                      SizedBox(width: displayWidth(context)*0.0285,),
                      Text('Real Returns', style: Theme.of(context).textTheme.displayLarge,)
                    ],
                  ),
                  SizedBox(height: displayHeight(context)*0.02,),
                  Text('Choose Your\nsubscription Plan',  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: displayWidth(context)*0.0955,
                  ),),
                  SizedBox(height: displayHeight(context)*0.006,),
                  Text('Select atleast one plan to register',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: displayWidth(context)*0.03,
                  ),),
                  SizedBox(height: displayHeight(context)*0.03,),
                  Container(
                    // margin: EdgeInsets.all(displayWidth(context)*0.02),
                  padding: EdgeInsets.all(displayWidth(context)*0.03),
                    height: displayHeight(context)*0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey.shade50
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                             // margin: EdgeInsets.all(displayWidth(context)*0.02),
                              padding: EdgeInsets.all(displayWidth(context)*0.015),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blue),
                              ),
                              alignment: Alignment.center,
                              child: Text('PRO RESIDENTIAL',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: displayWidth(context)*0.02
                              ),),
                            ),
                            SizedBox(height: displayHeight(context)*0.01,),
                            Text('• 7 days trail\n• Includes access only to\n  Residental Analysis\n• 30 residental reports allowed',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: displayWidth(context)*0.03
                            ),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("\$",style: Theme.of(context).textTheme.bodyMedium,),
                                Text("33",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: displayWidth(context)*0.1,fontWeight: FontWeight.bold),),
                                Text("/Month",style: Theme.of(context).textTheme.bodyMedium,),

                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
