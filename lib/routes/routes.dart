import 'package:architecture_pattern/screens/intro_investment.dart';
import 'package:architecture_pattern/screens/intro_reports.dart';
import 'package:architecture_pattern/screens/login_screen.dart';
import 'package:architecture_pattern/repository/login_repository.dart';
import 'package:architecture_pattern/routes/routes_names.dart';
import 'package:architecture_pattern/screens/oauth_screen.dart';
import 'package:architecture_pattern/screens/sign_in.dart';
import 'package:architecture_pattern/screens/subscription_plan.dart';
import 'package:architecture_pattern/screens/test_screen.dart';
import 'package:flutter/material.dart';

import '../screens/register_user_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.home):
        return MaterialPageRoute(
            builder: (BuildContext context) => const TestScreen());
      case (RouteNames.login):
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case (RouteNames.testScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const TestScreen());

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
