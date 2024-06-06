import 'package:flutter/material.dart';

import '../constants/assets_constants.dart';

class FailedScreen extends StatelessWidget {
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
              image: AssetImage(AssetConstants.paymentfailed),
            ),
            SizedBox(height: 20),
            Text(
              'Payment Failed',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We are so sorry Due to <Error Message> Payment has been failed Please try again!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
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
                        SizedBox(width: 127,),
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
                        SizedBox(width: 80,),
                        Text('NEJNMK525151MKMS\n/85265/25923',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Plan Details',
                        style: TextStyle(
                          fontSize: 12,

                        ),
                      ),
                      SizedBox(width: 40,),
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
                        SizedBox(width: 120,),
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
                        SizedBox(width: 37,),
                        Text('N/A',style: TextStyle(
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
SizedBox(width: 18,),
                        Text('N/A',style: TextStyle(
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
SizedBox(width: 53,),
                        Text('N/A',style: TextStyle(
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
