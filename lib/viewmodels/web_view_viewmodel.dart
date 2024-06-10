import 'package:architecture_pattern/constants/shared_prefrence_constants.dart';
import 'package:architecture_pattern/routes/routes.dart';
import 'package:architecture_pattern/routes/routes_names.dart';
import 'package:flutter/material.dart';

enum WebViewState{
  UNKNOWN,
  ERROR_OCCURED,
  LOADING,
  COMPLETED
}

class WebViewViewModel with ChangeNotifier{



  Future<void> loadUrl()async{

  }


  Future<void> logoutUser(BuildContext context)async{
 await   SharedPrefsConstants().clearData();
Navigator.pushNamedAndRemoveUntil(context, RouteNames.introInvestment,(Route route) => false);
  }
}