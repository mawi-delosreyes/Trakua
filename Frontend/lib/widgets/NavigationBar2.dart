import 'package:flutter/material.dart';
import 'package:frontend/screens/AllEnvelopeScreen.dart';
import 'package:frontend/screens/TransactionScreen.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/screens/LandingScreen.dart';

class NavigationBar2 extends StatefulWidget {

  var screen_selection;
  int user_id;
  NavigationBar2({Key? key, required this.screen_selection, required this.user_id}) : super(key:key);


  @override
  State<NavigationBar2> createState() => _NavigationBar2State();
}

class _NavigationBar2State extends State<NavigationBar2> {
  @override
  Widget build(BuildContext context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1.2,
              heightFactor: 0.4,
              child: Container(
                height: 10,
                child: new Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [

                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.4,
                        child: InkWell(
                          child: SvgPicture.asset(
                            widget.screen_selection == "home" ? 'assets/icons/home-fill.svg' : 'assets/icons/home.svg', 
                            color: ApplicationColors.Primary_900,
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                              context, 
                              PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => LandingScreen(user_id: widget.user_id,),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero
                              )
                            );
                          } ,
                        ),
                      ),
                    ),

                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.4,
                        child: InkWell(
                          child: SvgPicture.asset(
                            widget.screen_selection == "envelope" ? 'assets/icons/envelopes-fill.svg' : 'assets/icons/envelopes.svg', 
                            color: ApplicationColors.Primary_900
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                              context, 
                              PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => AllEnvelopeScreen(user_id: widget.user_id,),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero
                              )
                            );
                          }
                        )
                      ),
                    ),

                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.4,
                        child: InkWell(
                          child: SvgPicture.asset(
                            widget.screen_selection == "transaction" ? 'assets/icons/history-fill.svg' : 'assets/icons/history.svg', 
                            color: ApplicationColors.Primary_900
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                              context, 
                              PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => TransactionScreen(user_id: widget.user_id,),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero
                              )
                            );
                          } ,
                        )
                      ),
                    ),

                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.4,
                        child: SvgPicture.asset(
                          'assets/icons/analysis.svg',
                          color: ApplicationColors.Primary_300
                          )
                      ),
                    ),

                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ApplicationColors.Primary_900,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(101.52)),
                  color: ApplicationColors.Primary_100
                ),
              ),
            )
          ),
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 0.4,
              heightFactor: 0.4,
              child: Container(
                child: FractionallySizedBox (
                  widthFactor: 0.5,
                  heightFactor: 0.5,
                  child: SvgPicture.asset(
                    'assets/icons/plus.svg',
                    color: ApplicationColors.Secondary_900),
                ),

                decoration: BoxDecoration(
                  border: Border.all(
                    color: ApplicationColors.Secondary_900,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                  color: ApplicationColors.Secondary_100
                ),
              ),
            )
          ),
        ]
      );
      
  }
}
