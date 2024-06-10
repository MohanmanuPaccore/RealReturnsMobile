import 'package:architecture_pattern/common_files/common_size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:email_validator/email_validator.dart';

import '../routes/routes_names.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isPasswordVisible = true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset : false,
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
              padding: EdgeInsets.only(left: displayWidth(context)*0.075,right:displayWidth(context)*0.075 ),
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
                      const Text('Real Returns',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)
                    ],
                  ),
                  SizedBox(height: displayHeight(context)*0.05,),
                  Text('Sign In\nto Real Returns.ai',style: TextStyle(fontSize: displayWidth(context)*0.0955),),
                  SizedBox(height: displayHeight(context)*0.0075,),
                  Text('Learn * Understand * Invest',style: TextStyle(fontSize: displayWidth(context)*0.03),),
                  SizedBox(height: displayHeight(context)*0.03,),
                  TextFormField(
                    key: emailFormKey,
                    focusNode: emailFocusNode,
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: displayHeight(context)*0.017,horizontal: displayWidth(context)*0.03),
                        border: const OutlineInputBorder(),
                        labelText: 'Enter Your Email',labelStyle: TextStyle(fontSize: displayWidth(context)*0.034),
                       hintText: 'Enter Your Email',hintStyle: TextStyle(fontSize: displayWidth(context)*0.034),),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Email';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Enter Valid Email';
                      } else if (EmailValidator.validate(value)) {
                        String emailExt = value.split('.').last;

                        if (!['com', 'in', 'us'].contains(emailExt)) {
                          return 'Enter Valid Email';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: displayHeight(context)*0.015,),
                  TextFormField(
                    key: passwordFormKey,
                    focusNode: passwordFocusNode,
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: displayHeight(context)*0.017,horizontal: displayWidth(context)*0.03),
                      border: const OutlineInputBorder(),
                        labelText: 'Password',labelStyle: TextStyle(fontSize: displayWidth(context)*0.034),
                        hintText: 'Enter Your Email',hintStyle: TextStyle(fontSize: displayWidth(context)*0.034),
                        suffixIcon : IconButton(icon: isPasswordVisible ? Icon(Icons.visibility_outlined,size: 18,) : Icon(Icons.visibility_off_outlined,size: 18,), onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },)
                    ),
                    obscureText: !isPasswordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      } else if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[.!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                        return 'Invalid Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: displayHeight(context)*0.01,),
                  Padding(
                    padding: EdgeInsets.only(left: displayWidth(context)*0.54),
                    child: Text('Forgot Password?',style: TextStyle(fontSize: 12,color: Colors.blueAccent.shade700),),
                  ),
                  SizedBox(height: displayHeight(context)*0.1,),
                  SizedBox(
                    width: displayWidth(context)*1,
                    height: displayWidth(context)*0.15,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, RouteNames.webView);

                    },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12.0),),
                      backgroundColor: Colors.blueAccent.shade700,elevation: 0
                    ),
                        child: const Text('Sign In',style: TextStyle(color: Colors.white),)),
                  ),
                  SizedBox(height: displayHeight(context)*0.035,),
                  SizedBox(
                    width: displayWidth(context)*1,
                    height: displayWidth(context)*0.15,
                    // alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   color: Colors.blue.shade50,
                    // ),
                   // child: Text('Register Now',),
                    child: ElevatedButton(onPressed: (){

                    },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12.0),),
                       elevation: 0,
                     // backgroundColor: Colors.blueGrey.shade900,
                    ),
                        child: const Text('Register Now',)),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
