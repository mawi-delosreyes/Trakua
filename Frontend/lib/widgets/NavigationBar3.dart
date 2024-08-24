import 'package:flutter/material.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBar3 extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailAddressController; 
  final TextEditingController currencyController;
  final TextEditingController savingsGoalController; 
  final TextEditingController startDateController;
  final TextEditingController endDateController;

   NavigationBar3({
    Key? key, 
    required this.firstNameController, 
    required this.lastNameController,
    required this.emailAddressController, 
    required this.currencyController, 
    required this.savingsGoalController, 
    required this.startDateController, 
    required this.endDateController
  }) : super(key: key);

  @override
  State<NavigationBar3> createState() => _NavigationBar3State();
}

class _NavigationBar3State extends State<NavigationBar3> {

  @override
  Widget build(BuildContext context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

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

          Flexible (
            child:
            GestureDetector(
              onTap: () {
                print(widget.firstNameController.text);
              },
              child: FractionallySizedBox(
                widthFactor: 0.4,
                heightFactor: 0.4,
                child: Container(
                  child: FractionallySizedBox (
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: SvgPicture.asset(
                      'assets/icons/check.svg',
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
                )
            )   
          )    
          )
        ]
      );
      
  }
}
