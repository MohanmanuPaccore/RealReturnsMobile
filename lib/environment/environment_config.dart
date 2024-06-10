enum Environment { DEV, STAGING, PRODUCTION }

class EnvironmentConfig {
  final String? baseUrl;
  final String? webBaseURL;

  const EnvironmentConfig({ this.baseUrl='',this.webBaseURL=''});
}