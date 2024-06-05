class UrlUtils{

    static final UrlUtils _UrlUtils = UrlUtils._internal();
  
  factory UrlUtils() {
    return _UrlUtils;
  }
  
  UrlUtils._internal();

  static const login='api/Account/v1/Login';
}