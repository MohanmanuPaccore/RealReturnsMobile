
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../common_files/common_size_helper.dart';


class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;

      params = const PlatformWebViewControllerCreationParams();


    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://uat.realreturns.ai/'));
    //https://pluvialdemo.azurewebsites.net/

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: _controller)),
      bottomNavigationBar: controls(),
    );
  }

  Widget controls(){
    return NavigationControls(webViewController: _controller);
  }
}


class NavigationControls extends StatelessWidget {
  const NavigationControls({super.key, required this.webViewController});

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(1, 1),
          ),
        ],// Adjust border radius as needed
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () async {
              if (await webViewController.canGoBack()) {
                await webViewController.goBack();
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No back history item')),
                  );
                }
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () async {
              if (await webViewController.canGoForward()) {
                await webViewController.goForward();
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No forward history item')),
                  );
                }
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: () => webViewController.reload(),
          ),

        ],
      ),
    );
  }
}

class WebViewNavigation extends StatefulWidget {
  final String? register;
  const WebViewNavigation(
      {Key? key,
        this.register,
     })
      : super(key: key);

  @override
  State<WebViewNavigation> createState() => _WebViewNavigationState();
}

class _WebViewNavigationState extends State<WebViewNavigation> {
  //WebViewController? _controller;
  late final WebViewController _controller;

  final GlobalKey webViewKey = GlobalKey();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
bool isLoading=false;
  InAppWebViewController? webViewController;
  late PullToRefreshController pullToRefreshController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));


  @override
  void initState() {
    super.initState();
   // debugPrint('PAYMENT URL ${widget.register!}');

    // pullToRefreshController = PullToRefreshController(
    //   options: PullToRefreshOptions(
    //     color: Colors.blue,
    //   ),
    //   onRefresh: () async {
    //     if (Platform.isAndroid) {
    //       webViewController?.reload();
    //     } else if (Platform.isIOS) {
    //       webViewController?.loadUrl(
    //           urlRequest: URLRequest(url: await webViewController?.getUrl()));
    //     }
    //   },
    // );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Center(
          child: InAppWebView(
              initialUrlRequest: URLRequest(url:  Uri.parse("https://uat.realreturns.ai/")),
              key: webViewKey,
            
              onLoadStart: (controller, url) {
                isLoading=true;
                setState(() {
                  
                });
              },
              onLoadError: (controller, url, code, message) {
                                isLoading=false;
                setState(() {
                  
                });

              },
              onLoadStop: (controller, url) {
                isLoading=false;
                setState(() {
                  
                });
              },
              
              onWebViewCreated: (controller) {
                webViewController = controller;
                //_loadHtmlFromAssets();
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) {
                debugPrint('URL ${url.toString()}');
                debugPrint('URL HOST ${url!.host.toString()}');
                if (url.toString().contains("/register_plan")) {

                 // webViewController?.goBack();

                  // Navigator.of(context).pop();
                  // Navigator.of(context).pop();

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => TransactionSuccessFullScreen(
                  //           success: true,
                  //           transactionId: widget.transactionId,
                  //           result: widget.result,
                  //           totalAmount: widget.totalAmount,
                  //           controlNumber: widget.controlNumber)),
                  // );

                  //Prevent that url works
                  return;
                } else if (url.toString() ==
                    "https://connect.squareupsandbox.com/v2/checkout") {
                  //You can do anything
                  //webViewController?.goBack();
                  debugPrint('FAILUER');

                  webViewController?.goBack();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => TransactionSuccessFullScreen(
                  //           success: false,
                  //           transactionId: widget.transactionId,
                  //           result: widget.result,
                  //           totalAmount: widget.totalAmount,
                  //           controlNumber: widget.controlNumber)),
                  // );
                  //Prevent that url works
                  return;
                } else if (url.host.contains("duckduckgo.com")) {
                  //You can do anything
                  webViewController?.goBack();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const UserConfigScreen()),
                  // );
                }
              }),
        ));
  }

  _loadHtmlFromAssets() {
    var fileText =
        "<!DOCTYPE html> <html> <head> <title>HTML, CSS and JavaScript demo</title> <style> .rotate { transform: rotate(1700deg) ; } .rotate2 { transform: rotate(90deg) ; } .bg { background: url(https://picsum.photos/2000/1000?image=1069) center/cover; height: 50vh; width: 50vh; } body { margin:0; overflow:hidden; } </style> </head> "
        "<!-- Start your code here --> <ul> <li> <a href ='http://duckduckgo.com/' /><p> duckduckgo.com</a> </li>  <li> <a href='http://www.google.com'>google.com </a> </li>    <li> <a href='http://www.yahoo.com/'> yahoo.com </a> </li></ul> </html>";
    // return Uri.dataFromString(fileText,
    //         mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
    //     .toString();
    webViewController!.loadUrl(
        urlRequest: URLRequest(
            url:  Uri.dataFromString(fileText, mimeType: 'text/html')));//new Uri.dataFromString(fileText, mimeType: 'text/html')));

    // _controller?.loadUrl(Uri.dataFromString(fileText,
    //         mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
    //     .toString());
  }
}

