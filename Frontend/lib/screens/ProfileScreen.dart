import 'package:flutter/material.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chibao',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ApplicationColors.Background,
          body: new Column(
            children: [
              new Flexible(
                flex: 25,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/13,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget> [
                        Container(
                          height: MediaQuery.of(context).size.width/4.5,
                          width: MediaQuery.of(context).size.width/4.5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ApplicationColors.Neutrals_300,
                                width: 1,
                              ),
                              shape: BoxShape.circle
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/10,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height/40,
                    ),
                    Container(
                      child: ToggleSwitch(
                        minHeight: MediaQuery.of(context).size.height/25,
                        minWidth: MediaQuery.of(context).size.width/3,
                        initialLabelIndex: 0,
                        totalSwitches: 2,
                        labels: ["Profile", "Analytics"],
                        activeBgColor: [ApplicationColors.Primary_300],
                        inactiveBgColor: ApplicationColors.Secondary_100,
                        activeFgColor: ApplicationColors.Primary_1000,
                        inactiveFgColor: ApplicationColors.Primary_1000,
                      ),
                    )
                  ],
                )
              ),
              new Flexible(
                flex: 50,
                child: Container (
                  color: ApplicationColors.Secondary_700,
                )
              ),
              new Expanded(
                flex: 15,
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
