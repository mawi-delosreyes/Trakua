import 'package:flutter/material.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import 'package:frontend/widgets/NavigationBar2.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chibao',
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
