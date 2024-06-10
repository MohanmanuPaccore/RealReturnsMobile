import 'package:RealReturns/environment/environment_config.dart';
import 'package:RealReturns/environment/environment_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class EnvironmentProvider extends ChangeNotifier {
  static final EnvironmentProvider _instance = EnvironmentProvider._internal();

  factory EnvironmentProvider() {
    return _instance;
  }

  EnvironmentProvider._internal();

 static Environment currentEnvironment = Environment.PRODUCTION;
  final EnvironmentService environmentService = EnvironmentService();
 static String? baseServiceUrl=EnvironmentService.getEnvironmentConfig(currentEnvironment).baseUrl;
 static String? webBaseURL=EnvironmentService.getEnvironmentConfig(currentEnvironment).webBaseURL;
   final BehaviorSubject<EnvironmentConfig> _environmentSubject =
  BehaviorSubject.seeded( EnvironmentConfig(baseUrl:baseServiceUrl,webBaseURL: webBaseURL ));

  Stream<EnvironmentConfig> get environmentStream => _environmentSubject.stream;

  Future<void> fetchEnvironment() async {
    final config =  EnvironmentService.getEnvironmentConfig(currentEnvironment);
    _environmentSubject.add(config);

  }
  Future<void> setEnvironment(Environment environment) async {
    final config =  EnvironmentService.getEnvironmentConfig(environment);
    _environmentSubject.add(config);
  }

  Future<void> switchEnvironment(Environment environment) async {
    currentEnvironment = environment;
    await setEnvironment(environment);
    notifyListeners();
  }

  @override
  void dispose() {
    _environmentSubject.close();
    super.dispose();
  }
}