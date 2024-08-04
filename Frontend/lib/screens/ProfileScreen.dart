import 'package:flutter/material.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Frontend',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ApplicationColors.Background,
          body: new Column(
            children: [
              new Spacer(
                flex: 5,
              ),
              new Flexible(
                flex: 30,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Stack(
                      alignment: Alignment.center,
                      children: <Widget> [

                        Container(
                          height: 100,
                          width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ApplicationColors.Neutrals_300,
                                width: 1,
                              ),
                              shape: BoxShape.circle
                            ),
                          ),
                        Container(
                          height: 80,
                          width: 80,
                          child: SvgPicture.asset(
                            'assets/icons/user.svg',
                          fit: BoxFit.scaleDown,
                          color: ApplicationColors.Primary_900),
                        ),

                      ]
                    ),
                    Container(
                      child: Text(
                        "Mawi",
                        style: TextStyle(
                          color: ApplicationColors.Primary_900
                        ),
                        ),
                    ),

                    Container()


                  ],

                )
              ),
              new Flexible(
                flex: 40,
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
