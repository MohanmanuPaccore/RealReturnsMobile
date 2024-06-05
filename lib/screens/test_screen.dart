import 'package:architecture_pattern/environment/environment_config.dart';
import 'package:architecture_pattern/environment/environment_provider.dart';
import 'package:architecture_pattern/screens/login_screen.dart';
import 'package:architecture_pattern/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Environment> environmentList = [Environment.DEV, Environment.STAGING, Environment.PRODUCTION];
  Environment? _selectedEnv;
  EnvironmentProvider environmentProvider = EnvironmentProvider();

  @override
  void initState() {
    // Fetch environment when the screen is initialized
    environmentProvider.fetchEnvironment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Environment'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              DropdownButton(
                hint: Text('Please choose an environment'),
                value: _selectedEnv,
                onChanged: (newValue) {
                  setState(() {
                    _selectedEnv = newValue as Environment?;
                  });
                  // Switch to the selected environment
                  environmentProvider.switchEnvironment(newValue as Environment);
                },
                items: environmentList.map((env) {
                  return DropdownMenuItem(
                    child: Text(env.name),
                    value: env,
                  );
                }).toList(),
              ),
              InkWell(
                onTap: () {
Navigator.pushNamed(context, RouteNames.login);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200,
                  height: 50,
                  child: Text('Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                  
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
