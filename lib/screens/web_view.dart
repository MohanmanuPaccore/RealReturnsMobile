import 'package:RealReturns/constants/web_url_constants.dart';
import 'package:RealReturns/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String? initialUrl;
  final String? webBaseURL;

   const WebView({
       Key? key,
        this.initialUrl,
        this.webBaseURL,
      })
      : super(key: key);

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
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
 if (url.toString() ==
                WebUrlConstants.realreturnsBaseUrl){
                  Navigator.pushNamed(context, RouteNames.signinScreen);

                  debugPrint('FAILURE');

                  return;
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
