import 'package:flutter/material.dart';
import 'package:chibao/style/ApplicationColors.dart';
import 'package:chibao/widgets/NavigationBar1.dart';
import 'package:chibao/widgets/NavigationBar2.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ChiBao',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ApplicationColors.Background,
          body: new Column(
            children: [
              new Expanded(
                flex: 80,
                child: Container (
                )
              ),
              new Expanded(
                flex: 20,
                child: Container(
                  child: new NavigationBar2(),
                )
              )
            ] 
          ),
        )
      );
  }
}
