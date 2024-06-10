import 'package:RealReturns/screens/intro_investment.dart';
import 'package:RealReturns/screens/intro_reports.dart';
import 'package:RealReturns/routes/routes_names.dart';
import 'package:RealReturns/screens/oauth_screen.dart';
import 'package:RealReturns/screens/sign_in.dart';
import 'package:RealReturns/screens/subscription_plan.dart';
import 'package:RealReturns/screens/web_view.dart';
import 'package:RealReturns/screens/web_view.dart';
import 'package:flutter/material.dart';

import '../screens/register_user_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    Map<String,dynamic>? arguments;
    if(settings.arguments!=null){
    arguments=settings.arguments as Map<String,dynamic>;
    }
    switch (settings.name) {

            case (RouteNames.oauthscreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const OAuthScreen());

                        case (RouteNames.signinScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInScreen());

      case (RouteNames.subscriptionPlan):
        return MaterialPageRoute(
            builder: (BuildContext context) => const SubscriptionPlan());

      case (RouteNames.introInvestment):
        return MaterialPageRoute(
            builder: (BuildContext context) => const IntroInvestment());

      case (RouteNames.introReports):
        return MaterialPageRoute(
            builder: (BuildContext context) => const IntroReports());

      case (RouteNames.signupScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterUserScreen());

      case (RouteNames.webView):
        return MaterialPageRoute(
            builder: (BuildContext context) =>  WebView(
              initialUrl: arguments?['initial_url'], 
            ));



      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route is configured"),
            ),
          ),
        );
    }
  }
}
