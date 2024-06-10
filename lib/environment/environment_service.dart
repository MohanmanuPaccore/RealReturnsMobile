
import 'environment_config.dart';

class EnvironmentService {
  static EnvironmentConfig  getEnvironmentConfig(Environment environment)  {
    switch (environment) {
      case Environment.DEV:
        return const EnvironmentConfig(
          baseUrl: "carsimpledevapi.azurewebsites.net",
          webBaseURL: "https://uat.realreturns.ai/"
        );
      case Environment.STAGING:
        return const EnvironmentConfig(
          baseUrl: "https://api.staging.yourdomain.com",
                    webBaseURL: "https://uat.realreturns.ai/"

        );
      case Environment.PRODUCTION:
        return const EnvironmentConfig(
          baseUrl: "carsimpleapi.azurewebsites.net",
                    webBaseURL: "https://uat.realreturns.ai/"

        );
    }
  }
}
