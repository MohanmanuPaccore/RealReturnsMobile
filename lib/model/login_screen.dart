import 'package:RealReturns/enums/response_status.dart';
import 'package:RealReturns/firebase/analytics.dart';
import 'package:RealReturns/screens/oauth_screen.dart';
import 'package:RealReturns/viewmodels/login_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  LoginViewModel? viewModel;
  @override
  void initState() {
    viewModel=context.read<LoginViewModel>();
Analytics.setCurrentScreen('login');
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    //viewModel?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
                builder: (ctx, viewModel, child) => 
    
    
     Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(

          child: Stack(
            children: [

if(viewModel.loginData?.status==ResponseStatus.loading)
Center(
child: CircularProgressIndicator(),
),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
              
                  Padding(padding: EdgeInsets.all(16),
                  
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Please Enter Email'
                    ),
                  ),
                  ),
              
                  Padding(padding: EdgeInsets.all(16),
                  
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Please Enter Password'
                    ),
                  ),
                  ),
              
              
                  InkWell(
                    onTap: ()async{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OAuthScreen()));
//                   var res=  await  viewModel.loginUser(emailController.text,passwordController.text);
// if(viewModel.loginData?.status!=ResponseStatus.error){
// ScaffoldMessenger.maybeOf(context)!.showSnackBar(SnackBar(content: Text(viewModel.loginResData?.message??'None')));

// }
                    },
                    child: Container(
                      height: 50,
                      
                      width: 200,
                      decoration: BoxDecoration(
                                              color: Colors.blue,

                        borderRadius: BorderRadius.circular(20)
                      ),
                      alignment: Alignment.center,
                      child: Text('Log In',
                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                     ), 
                      
                      ),
                    ),
                  ),
              
              if(viewModel.loginData?.status==ResponseStatus.error)
Text(viewModel.loginData!.exceptiondetail!.message.toString())
              
                ],
              
              ),
            ],
          ),
        ),
      ),
    ));
  }
}