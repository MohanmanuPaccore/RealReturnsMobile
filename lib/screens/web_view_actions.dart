import 'package:architecture_pattern/routes/routes_names.dart';
import 'package:architecture_pattern/screens/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRegister extends StatefulWidget {
  final String? initialUrl;

   const WebViewRegister({
       Key? key,
        this.initialUrl
      })
      : super(key: key);

  @override
  State<WebViewRegister> createState() => _WebViewRegisterState();
}

class _WebViewRegisterState extends State<WebViewRegister> {
  late final WebViewController _controller;

  final GlobalKey webViewKey = GlobalKey();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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


    late final PlatformWebViewControllerCreationParams params;

    params = const PlatformWebViewControllerCreationParams();


    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);

    _controller = controller;
  }



  Widget controls(){
    return NavigationControls(webViewController: _controller);
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Center(
          child: InAppWebView(
              initialUrlRequest: URLRequest(url:  Uri.parse(widget.initialUrl!)),
              key: webViewKey,
              onWebViewCreated: (controller) {
                webViewController = controller;
                //_loadHtmlFromAssets();
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) {
                debugPrint('URL ${url.toString()}');
                debugPrint('URL HOST ${url!.host.toString()}');
                if (url.toString().contains("/register_plan")) {
                  debugPrint('Success -----------------------------------------------');
                  return;
                } else if (url.toString() ==
                    "https://uat.realreturns.ai/") {
                  Navigator.pushNamed(context, RouteNames.signinScreen);

                  debugPrint('FAILURE');

                  return;
                } else if (url.host.contains("forgotpasswordemail")) {
                  InAppWebView(
                    initialUrlRequest: URLRequest(url:  Uri.parse("https://uat.realreturns.ai/home/forgotpasswordemail/")),
                  );
                }
              }),
        ),
        bottomNavigationBar: controls(),
      ),
    );
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
