import 'package:flutter/material.dart';
import 'package:chibao/style/ApplicationColors.dart';
import 'package:chibao/widgets/NavigationBar1.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ChiBao',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ApplicationColors.Background,
          body: new Column(
            children: [
              new Flexible(
                flex: 30,
                child: Container (
                )
              ),
              new Flexible(
                flex: 50,
                child: Container (
                  color: ApplicationColors.Secondary_700,
                )
              ),
              new Expanded(
                flex: 20,
                child: Container(
                  child: new NavigationBar1(),
                )
              )
            ] 
          ),
        )
      );
  }
}
