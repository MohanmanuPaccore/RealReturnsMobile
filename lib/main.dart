import 'package:architecture_pattern/environment/environment_provider.dart';
import 'package:architecture_pattern/environment/environment_service.dart';
import 'package:architecture_pattern/firebase/analytics.dart';
import 'package:architecture_pattern/firebase/appevents.dart';
import 'package:architecture_pattern/screens/intro_future_real_estate.dart';

import 'package:architecture_pattern/screens/register_user_screen.dart';
import 'package:architecture_pattern/viewmodels/login_viewmodel.dart';
import 'package:architecture_pattern/reusable/null_error_widget.dart';
import 'package:architecture_pattern/routes/routes.dart';
import 'package:architecture_pattern/routes/routes_names.dart';
import 'package:architecture_pattern/screens/test_screen.dart';
import 'package:architecture_pattern/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
    ErrorWidget.builder=(details){
      return NullErrorWidget(errorText: details.stack.toString(),);

    };
      FirebaseApp app = await Firebase.initializeApp(
    );
    print('Initialized default app $app');
  Analytics.initFirebaseAnalaytics();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EnvironmentProvider()),
                ChangeNotifierProvider(create: (_) => LoginViewModel()),

      ],
    
  child:   MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
        onGenerateRoute: Routes.generateRoutes,
      darkTheme: darkTheme,
      home: const IntroFutureRealEstate(),

    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> datalist=['test1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              datalist[0],
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Analytics.logEvent(AppEvents.TEST,{'from_activity':"test"});

Navigator.pushNamed(context, RouteNames.testScreen);
        },
        
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
