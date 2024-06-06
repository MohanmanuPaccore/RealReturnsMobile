import 'package:flutter/material.dart';

import '../constants/assets_constants.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60,),
            Image(
              image: AssetImage(AssetConstants.paymentsuccess),
            ),
            SizedBox(height: 20),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You have successfully completed\n the Subscription',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Receipt',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 12,

                          ),
                        ),
                        SizedBox(width: 125,),
                        Text('Vinesh Kumar',  style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Transaction ID',
                         style: TextStyle(
                      fontSize: 12,

                    ),
                        ),
                        SizedBox(width: 78,),
                        Text('NEJNMK525151MKMS/\n85265/25923',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Plan Details',
                          style: TextStyle(
                            fontSize: 12,

                          ),
                        ),
                        SizedBox(width: 94.1,),
                        Text('Pro Residential - \$35/Month',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(
                            fontSize: 12,

                          ),
                        ),
                        SizedBox(width: 115,),
                        Text('\$0',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Subscription Start Date',
                          style: TextStyle(
                            fontSize: 12,

                          ),
                        ),
                        SizedBox(width: 30,),
                        Text('July 26, 2023',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Renewed Automatically on',
                          style: TextStyle(
                            fontSize: 12,

                          ),
                        ),
                        SizedBox(width: 11,),
                        Text('August 02, 2023',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Trial Plan Expires on',
                          style: TextStyle(
                            fontSize: 12,

                          ),
                        ),
                        SizedBox(width: 45),
                        Text('August 02, 2023',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        SizedBox(height: 50,),
            ElevatedButton(

              onPressed: () {

              },

              child: Text('Login to Continue',

              ),
            ),
          ],
        ),
      ),
    );
  }
}
