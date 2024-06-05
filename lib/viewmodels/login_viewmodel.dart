import 'dart:convert';
import 'dart:math';

import 'package:architecture_pattern/enums/response_status.dart';
import 'package:architecture_pattern/environment/environment_provider.dart';
import 'package:architecture_pattern/environment/environment_service.dart';
import 'package:architecture_pattern/model/api_response.dart';
import 'package:architecture_pattern/model/user.dart';
import 'package:architecture_pattern/repository/login_repository.dart';
import 'package:architecture_pattern/utils/url_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class LoginViewModel with ChangeNotifier{
    final _loginRepository = LoginRepository();
    EnvironmentProvider provider=EnvironmentProvider();

  ApiResponse<dynamic>? loginData;
  Login? loginResData;
  bool isBusy = false;
  final FlutterAppAuth _appAuth = const FlutterAppAuth();
  String? codeVerifier;
  String? nonce;
  String? refreshToken;
  String? idToken;

  final TextEditingController authorizationCodeTextController =
      TextEditingController();
  final TextEditingController accessTokenTextController =
      TextEditingController();
  final TextEditingController accessTokenExpirationTextController =
      TextEditingController();

  final TextEditingController idTokenTextController = TextEditingController();
  final TextEditingController refreshTokenTextController =
      TextEditingController();
  String? userInfo;
    final BehaviorSubject<String> authorizationCodeSubject =
      BehaviorSubject.seeded('');
          final BehaviorSubject<String> accessToken =
      BehaviorSubject.seeded('');


  Stream<String> get authorizationCodeStream =>
      authorizationCodeSubject.stream;


  final String _clientId = 'interactive.public';
  final String _redirectUrl = 'com.duendesoftware.demo:/oauthredirect';
  final String _issuer = 'https://demo.duendesoftware.com';
  final String _discoveryUrl =
      'https://demo.duendesoftware.com/.well-known/openid-configuration';
  final String _postLogoutRedirectUrl = 'com.duendesoftware.demo:/';
  final List<String> _scopes = <String>[
    'openid',
    'profile',
    'email',
    'offline_access',
    'api'
  ];



  final AuthorizationServiceConfiguration _serviceConfiguration =
      const AuthorizationServiceConfiguration(
    authorizationEndpoint: 'https://demo.duendesoftware.com/connect/authorize',
    tokenEndpoint: 'https://demo.duendesoftware.com/connect/token',
    endSessionEndpoint: 'https://demo.duendesoftware.com/connect/endsession',
  );


  Future loginUser(String email, String password) async {
loginData=ApiResponse.loading();
notifyListeners();
    final config = await provider.environmentStream.first;
print('the url was ${config.baseUrl} ${UrlUtils.login}');
Map<String,dynamic> body={
  'username':email,
  'password':password
};
  loginData =  await _loginRepository.loginUser('${config.baseUrl}${UrlUtils.login}',body);
  if(loginData?.status==ResponseStatus.completed||loginData?.status==ResponseStatus.empty){
   loginResData=loginData?.data;

  }

  notifyListeners();
  }


  Future<void> endSession() async {
    try {
      _setBusyState();
  await    _loginRepository.endOauthSession(appAuth: _appAuth,idToken: idToken,postLogoutRedirectUrl: _postLogoutRedirectUrl,serviceConfiguration: _serviceConfiguration);
      // await _appAuth.endSession(EndSessionRequest(
      //     idTokenHint: idToken,
      //     postLogoutRedirectUrl: _postLogoutRedirectUrl,
      //     serviceConfiguration: _serviceConfiguration));
      _clearSessionInfo();
    } catch (_) {}
    _clearBusyState();
  }

  void _clearSessionInfo() {
   // setState(() {
      codeVerifier = null;
      nonce = null;
      authorizationCodeSubject.value = '';
      authorizationCodeTextController.clear();
      accessToken.value='';
      accessTokenTextController.clear();
      idToken = null;
      idTokenTextController.clear();
      refreshToken = null;
      refreshTokenTextController.clear();
      accessTokenExpirationTextController.clear();
      userInfo = null;
      notifyListeners();
   // });
  }

  Future<void> refresh() async {
    try {
      _setBusyState();
final TokenResponse result = await _loginRepository.refresh(appAuth: _appAuth,clientId: _clientId,redirectUrl: _redirectUrl,refreshToken: refreshToken,issuer: _issuer,scopes: _scopes);

      _processTokenResponse(result);
      await _testApi(result);
    } catch (_) {
      _clearBusyState();
    }
  }

  Future<void> exchangeCode() async {
    try {
      _setBusyState();

      final TokenResponse result = await _loginRepository.exchangeCode(appAuth: _appAuth,clientId: _clientId,redirectUrl: _redirectUrl,
      authorizationCode: authorizationCodeSubject.value,
      discoveryUrl: _discoveryUrl,codeVerifier: codeVerifier,
      nonce: nonce,scopes: _scopes);

      _processTokenResponse(result);
      await _testApi(result);
    } catch (_) {
      _clearBusyState();
    }
  }

  Future<void> signInWithNoCodeExchange() async {
    try {
      _setBusyState();
      final AuthorizationResponse result =await _loginRepository.signInWithNoCodeExchange(
appAuth: _appAuth,clientId: _clientId,redirectUrl: _redirectUrl,discoveryUrl: _discoveryUrl,scopes: _scopes

      );
      
      
      // await _appAuth.authorize(
      //   AuthorizationRequest(_clientId, _redirectUrl,
      //       discoveryUrl: _discoveryUrl, scopes: _scopes, loginHint: 'bob'),
      // );

     

      if (result != null) {
        _processAuthResponse(result);
      }
    } catch (_) {
      _clearBusyState();
    }
  }

  Future<void> signInWithNoCodeExchangeAndGeneratedNonce() async {
    try {
      _setBusyState();
      final Random random = Random.secure();
      final String nonce =
          base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
      // use the discovery endpoint to find the configuration

AuthorizationResponse? result =await _loginRepository. signInWithNoCodeExchangeAndGeneratedNonce(appAuth: _appAuth,clientId: _clientId,redirectUrl: _redirectUrl,discoveryUrl: _discoveryUrl,scopes: _scopes,nonce: nonce);


      // final AuthorizationResponse? result = await _appAuth.authorize(
      //   AuthorizationRequest(_clientId, _redirectUrl,
      //       discoveryUrl: _discoveryUrl,
      //       scopes: _scopes,
      //       loginHint: 'bob',
      //       nonce: nonce),
      // );

      if (result != null) {
        _processAuthResponse(result);
      }
    } catch (_) {
      _clearBusyState();
    }
  }

  Future<void> signInWithAutoCodeExchange(
      {bool preferEphemeralSession = false}) async {
    try {
      _setBusyState();

     
      final AuthorizationTokenResponse result =await  _loginRepository.signInWithAutoCodeExchange(
        clientId: _clientId,
        redirectUrl: _redirectUrl,
        serviceConfiguration: _serviceConfiguration,
        scopes: _scopes,
        appAuth: _appAuth,

        preferEphemeralSession: preferEphemeralSession
      );
        
        
        
        
      //     await _appAuth.authorizeAndExchangeCode(
      //   AuthorizationTokenRequest(
      //     _clientId,
      //     _redirectUrl,
      //     serviceConfiguration: _serviceConfiguration,
      //     scopes: _scopes,
      //     preferEphemeralSession: preferEphemeralSession,
      //   ),
      // );

      /* 
        This code block demonstrates passing in values for the prompt
        parameter. In this case it prompts the user login even if they have
        already signed in. the list of supported values depends on the
        identity provider

        ```dart
        final AuthorizationTokenResponse result = await _appAuth
        .authorizeAndExchangeCode(
          AuthorizationTokenRequest(_clientId, _redirectUrl,
              serviceConfiguration: _serviceConfiguration,
              scopes: _scopes,
              promptValues: ['login']),
        );
        ```
      */

      if (result != null) {
        _processAuthTokenResponse(result);
        await _testApi(result);
      }
    } catch (_) {
      _clearBusyState();
    }
  }

  void _clearBusyState() {
   // setState(() {
      isBusy = false;
      notifyListeners();
    //});
  }

  void _setBusyState() {
   // setState(() {
      isBusy = true;
      notifyListeners();
    //});
  }

  void _processAuthTokenResponse(AuthorizationTokenResponse response) {
   // setState(() {
    accessToken.add(response.accessToken!);
       accessTokenTextController.text = accessToken.value;
      idToken = idTokenTextController.text = response.idToken!;
      refreshToken = refreshTokenTextController.text = response.refreshToken!;
      accessTokenExpirationTextController.text =
          response.accessTokenExpirationDateTime!.toIso8601String();
          notifyListeners();
   // });
  }

  void _processAuthResponse(AuthorizationResponse response) {
    //setState(() {
      /*
        Save the code verifier and nonce as it must be used when exchanging the
        token.
      */
      codeVerifier = response.codeVerifier;
      nonce = response.nonce;
    authorizationCodeSubject.add(response.authorizationCode!);
  final authorizationCode = authorizationCodeSubject.valueOrNull ?? '';
  authorizationCodeTextController.text = authorizationCode;
      isBusy = false;
      notifyListeners();
   // });
  }

  void _processTokenResponse(TokenResponse? response) {
  //  setState(() {
    accessToken.add(response!.accessToken!);
    
       accessTokenTextController.text = accessToken.value;
      idToken = idTokenTextController.text = response.idToken!;
      refreshToken = refreshTokenTextController.text = response.refreshToken!;
      accessTokenExpirationTextController.text =
          response.accessTokenExpirationDateTime!.toIso8601String();
  //  });
  notifyListeners();
  }

  Future<void> _testApi(TokenResponse? response) async {
      userInfo =await _loginRepository.testApi(response, accessToken.value);
      
      
      isBusy = false;
      notifyListeners();
    //});
  }
}

