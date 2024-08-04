import 'package:flutter/material.dart';
import 'package:chibao/style/ApplicationColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBar1 extends StatefulWidget {
  const NavigationBar1({super.key});

  @override
  State<NavigationBar1> createState() => _NavigationBar1State();
}

class _NavigationBar1State extends State<NavigationBar1> {
  @override
  Widget build(BuildContext context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
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
                        child: SvgPicture.asset(
                          'assets/icons/home.svg',
                          color: ApplicationColors.Primary_900
                          )
                      ),
                    ),

                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.4,
                        child: SvgPicture.asset(
                          'assets/icons/user.svg',
                          color: ApplicationColors.Primary_900
                          )
                      ),
                    ),

                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.4,
                        child: SvgPicture.asset(
                          'assets/icons/wallet.svg',
                          color: ApplicationColors.Primary_900
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
                child: Flexible (
                  child: FractionallySizedBox (
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: SvgPicture.asset(
                      'assets/icons/edit.svg',
                      color: ApplicationColors.Secondary_900),
                  ),
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
