import 'package:architecture_pattern/constants/color_constants.dart';
import 'package:architecture_pattern/reusable/common_button.dart';
import 'package:architecture_pattern/screens/widgets/background_icon_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
    String? _selectedValue;
    bool re_enter_password_filed_obscure=true;
    bool password_filed_obscure=false;
    bool isTermsCheckboxcheck=false;

  @override
  Widget build(BuildContext context) {
    return BackgroundIcon(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Register \nto Real Returns.ai',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 38
              ),
              
              ),
              const SizedBox(height: 10,),
              Text('Learn * Understand * Invest',
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12
              ),
          
              
              ),
          const SizedBox(height: 20,),
              Form(child: Column(
              children: [
                Row(
                  children: [
                              Flexible(
          fit: FlexFit.tight,
          flex: 1,                              child: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Frist name',
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: ColorConstants.hintBorderColor,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter some text';
                                                }
                                                return null;
                                              },
                                            ),
          ),
                              ),
          
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
          
                                            //width: MediaQuery.sizeOf(context).width/3,
          
              child: Container(
            padding: const EdgeInsets.only(left: 4),
                child: TextFormField(
                  
                  decoration: const InputDecoration(
                    labelText: 'Last name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorConstants.hintBorderColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ),
          
                  ],
                ),
          
          SizedBox(height: 15,),
          
          TextFormField(
            keyboardType: TextInputType.number,
                  
                  decoration: const InputDecoration(
                    labelText: '+1 212-456-7890',
                    
                    border: OutlineInputBorder(
          
                      borderSide: BorderSide(
                        color: ColorConstants.hintBorderColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
          
          SizedBox(height: 15,),
          
          
          TextFormField(
                  
                  decoration: const InputDecoration(
                    labelText: 'Enter Your Email',
                    
                    border: OutlineInputBorder(
          
                      borderSide: BorderSide(
                        color: ColorConstants.hintBorderColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
          
          
          
          SizedBox(height: 15,),
          
          
          TextFormField(
                  obscureText:password_filed_obscure ,
                  decoration:  InputDecoration(
                    labelText: 'Enter New Password',
                    
                    border: OutlineInputBorder(
          
                      borderSide: BorderSide(
                        color: ColorConstants.hintBorderColor,
                        width: 2.0,
                      ),
                    ),
                                                      suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    password_filed_obscure = !password_filed_obscure;
                  });
                },
                child: Icon(
                  password_filed_obscure ? Icons.visibility : Icons.visibility_off,
                ),
              ),


                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
          
          SizedBox(height: 15,),
          
          
          TextFormField(
                                    obscureText:re_enter_password_filed_obscure ,

                  decoration:  InputDecoration(
                    labelText: 'Re-Enter New Password',
                    
                    border: OutlineInputBorder(
          
                      borderSide: BorderSide(
                        color: ColorConstants.hintBorderColor,
                        width: 2.0,
                      ),
                    ),
                                  suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    re_enter_password_filed_obscure = !re_enter_password_filed_obscure;
                  });
                },
                child: Icon(
                  re_enter_password_filed_obscure ? Icons.visibility : Icons.visibility_off,
                ),
              ),

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
SizedBox(height: 15,),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select Your Role',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                        color: ColorConstants.hintBorderColor,
                        width: 2.0,
                ),
              ),
            ),
            value: _selectedValue,
            items: ['Option 1', 'Option 2', 'Option 3'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              return null;
            },
          ),


              ],
              )),

              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
Container(
  height: 20,
  width: 20,
padding: EdgeInsets.only(left: 4),
  child: Checkbox(
    activeColor: ColorConstants.primaryColor,
    value: isTermsCheckboxcheck
  
  , onChanged: (val){
    isTermsCheckboxcheck=val!;
    setState(() {
      
    });
  
  }),
),

Padding(padding: EdgeInsets.only(left: 8),
child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By clicking the Register button you accept\n',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 10
                      ),
                    ),
                    TextSpan(
                      text: 'T&C',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: ColorConstants.primaryColor
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle terms and conditions tap
                        },
                    ),
                    TextSpan(
                      text: ' and ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 10
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                                                color: ColorConstants.primaryColor,

                        fontSize: 10
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle privacy policy tap
                        },
                    ),
                  ],
                ),
              ),

),
                ],
              ),

SizedBox(height: 10,),
Center(
  child: Padding(
    padding: EdgeInsets.all(8),
    child: CommonButton().primaryButton(context,
    onTap: (){},
    height: MediaQuery.sizeOf(context).height*0.065,
    width: MediaQuery.sizeOf(context).width/1.8,
    buttonText: 'Register Now'
    
    ),
  ),
),


SizedBox(height: 15),
Center(
  child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already Member? ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 13
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: ColorConstants.primaryColor
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle terms and conditions tap
                          },
                      
                      )
              ])),
),
SizedBox(height: 30,
)

            ],
          ),
        ),
      ),
    );
  }
}