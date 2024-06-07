import 'package:architecture_pattern/screens/widgets/background_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:architecture_pattern/common_files/common_size_helper.dart';
import '../constants/assets_constants.dart';
import '../routes/routes_names.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundIcon(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AssetConstants.paymentsuccess),
            ),
            SizedBox(height: displayHeight(context) * 0.01),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'You have successfully completed\n the Subscription',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: displayHeight(context) * 0.01),
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: displayWidth(context)*0.033),
              child: Text(
                'Payment Receipt',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Name",style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Transaction ID",style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 10.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Plan Details",style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 10.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Amount",style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 10.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Subscription Start Date",style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 10.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Renewed Automatically on",style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 10.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Trial Plan Expires on",style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 10.5),
                        ),
                      ),
                    ],

                  ),

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Vinesh Kumar", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.5
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("NEJNMK525151MKMS/85265/25923", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.1
                        ),),
                      ),
                      Text("Pro Residential - \$35/Month", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.5
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("\$0", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.5
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("July 26, 2023", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.5
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("August 02, 2023", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.5
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("August 02, 2023", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.5
                        ),),
                      ),

                    ],

                  ),

                ),
                // Add more widgets as needed in the Row
              ],
            ),


          ],
        ),
      ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.signinScreen);
              },
              child: Text('Login to Continue'),
            )

          ]))

    );}
}
