import 'package:RealReturns/base_api_service.dart';
import 'package:RealReturns/model/api_response.dart';
import 'package:RealReturns/model/user.dart';
import 'package:RealReturns/service/login_service.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class LoginRepository {
  final BaseApiServices _apiServices = LoginApiServices();
  final LoginApiServices loginService=LoginApiServices();
  Future<ApiResponse> loginUser(String url,Map<String,dynamic> body) async {
dynamic response;
    try {
       response =
          await _apiServices.postApi(url,body);
      return response;
    } catch (e) {

      return response;
    }
  }


  Future<dynamic> endOauthSession({FlutterAppAuth? appAuth,String? idToken,String? postLogoutRedirectUrl,AuthorizationServiceConfiguration? serviceConfiguration})async{
    var response=await loginService.endOauthSession(appAuth: appAuth,idToken: idToken,postLogoutRedirectUrl: postLogoutRedirectUrl,serviceConfiguration: serviceConfiguration);
    return response;

  }
    Future<String> testApi(TokenResponse? response,String? accessToken ) async {
String data= await loginService.testApi(response, accessToken);
return data;
    }


    Future<TokenResponse> refresh({FlutterAppAuth? appAuth,String? clientId,redirectUrl,refreshToken,issuer,List<String>? scopes })async{
    
    var res=await loginService.refresh(appAuth: appAuth,clientId: clientId,redirectUrl: redirectUrl,refreshToken: refreshToken,scopes: scopes,issuer: issuer);
   
   return res;
    }


      Future<TokenResponse> exchangeCode({FlutterAppAuth? appAuth,String? clientId,redirectUrl,authorizationCode,discoveryUrl,codeVerifier,nonce,List<String>? scopes }) async {

    var res=await loginService.exchangeCode(appAuth: appAuth,clientId: clientId,redirectUrl: redirectUrl,authorizationCode: authorizationCode,discoveryUrl:discoveryUrl,codeVerifier:codeVerifier,nonce:nonce,scopes: scopes);
   
   return res;


}

  Future<AuthorizationResponse> signInWithNoCodeExchange({FlutterAppAuth? appAuth,String? clientId,redirectUrl,discoveryUrl,List<String>? scopes}) async {
 
 
     var res=await loginService.signInWithNoCodeExchange(appAuth: appAuth,clientId: clientId,redirectUrl: redirectUrl,discoveryUrl:discoveryUrl,scopes: scopes);
   
   return res;

  }

      Future<AuthorizationResponse> signInWithNoCodeExchangeAndGeneratedNonce({FlutterAppAuth? appAuth,String? clientId,redirectUrl,authorizationCode,discoveryUrl,codeVerifier,nonce,List<String>? scopes}) async {
           var res=await loginService.signInWithNoCodeExchangeAndGeneratedNonce(appAuth: appAuth,clientId: clientId,redirectUrl: redirectUrl, authorizationCode: authorizationCode, discoveryUrl:discoveryUrl, codeVerifier: codeVerifier,nonce: nonce, scopes: scopes);
   
   return res;

      }


      Future<AuthorizationTokenResponse> signInWithAutoCodeExchange(
     { FlutterAppAuth? appAuth,String? clientId,redirectUrl ,AuthorizationServiceConfiguration? serviceConfiguration,List<String>? scopes,bool? preferEphemeralSession}) async {

           var res=await loginService.signInWithAutoCodeExchange(appAuth: appAuth,clientId: clientId,redirectUrl: redirectUrl, preferEphemeralSession: preferEphemeralSession, serviceConfiguration: serviceConfiguration, scopes: scopes);
   
   return res;

}
}
