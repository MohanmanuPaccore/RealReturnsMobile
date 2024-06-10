import 'dart:io';
import 'package:RealReturns/firebase/analytics.dart';
import 'package:RealReturns/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
class OAuthScreen extends StatefulWidget {
  const OAuthScreen({super.key});

  @override
  State<OAuthScreen> createState() => _OAuthScreenState();
}

class _OAuthScreenState extends State<OAuthScreen> {


  LoginViewModel? viewModel;

@override
  void initState() {
        viewModel=context.read<LoginViewModel>();
Analytics.setCurrentScreen('oauth');

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
                builder: (ctx, viewModel, child) => 
    
    
     Scaffold(
        appBar: AppBar(
          title: const Text('O Auth Screen'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Visibility(
                    visible:viewModel. isBusy,
                    child: const LinearProgressIndicator(),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    child: const Text('Sign in with no code exchange'),
                    onPressed: () => viewModel.signInWithNoCodeExchange(),
                  ),
                  ElevatedButton(
                    child: const Text(
                        'Sign in with no code exchange and generated nonce'),
                    onPressed: () => viewModel.signInWithNoCodeExchangeAndGeneratedNonce(),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    child: const Text('Exchange code'),
                    onPressed:()=>
              viewModel. authorizationCodeSubject.value != ''? viewModel.exchangeCode() : {
                  
                    }),
                    
                    
                    
                  const SizedBox(height: 8),
                  ElevatedButton(
                    child: const Text('Sign in with auto code exchange'),
                    onPressed: () => viewModel.signInWithAutoCodeExchange(),
                  ),
                  if (Platform.isIOS || Platform.isMacOS)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: const Text(
                          'Sign in with auto code exchange using ephemeral '
                          'session',
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () => viewModel.signInWithAutoCodeExchange(
                            preferEphemeralSession: true),
                      ),
                    ),
                  ElevatedButton(
                    child: const Text('Refresh token'),
                    onPressed: viewModel.refreshToken != null ? viewModel.refresh : null,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    child: const Text('End session'),
                    onPressed: viewModel.idToken != null
                        ? () async {
                            await viewModel.endSession();
                          }
                        : null,
                  ),
                  const SizedBox(height: 8),
                  const Text('authorization code'),
                  TextField(
                    controller: viewModel.authorizationCodeTextController,
                  ),
                  const Text('access token'),
                  TextField(
                    controller: viewModel.accessTokenTextController,
                  ),
                  const Text('access token expiration'),
                  TextField(
                    controller: viewModel.accessTokenExpirationTextController,
                  ),
                  const Text('id token'),
                  TextField(
                    controller: viewModel.idTokenTextController,
                  ),
                  const Text('refresh token'),
                  TextField(
                    controller: viewModel.refreshTokenTextController,
                  ),
                  const Text('test api results'),
                  Text(viewModel.userInfo ?? ''),
                ],
              ),
            ),
          ),
        ),
      
    ));
  }

}
