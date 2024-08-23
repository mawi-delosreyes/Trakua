import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar3.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:frontend/repository/LocalInitRepo.dart';
import 'package:frontend/widgets/ProfileDetails.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<String> profileDisplayList = ["Profile", "Analytics"];
  bool _swapDisplay = true;

  @override
  Widget build(BuildContext context) {

    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _emailAddressController = TextEditingController();
    final _currencyController = TextEditingController();
    final _savingsGoalController = TextEditingController();
    final _startDateController = TextEditingController();
    final _endDateController = TextEditingController();

    final analyticsDisplay = Container(
      color: ApplicationColors.Primary_700,
    );

    return MaterialApp(      
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false,),
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
                        minHeight: MediaQuery.of(context).size.height/30,
                        minWidth: MediaQuery.of(context).size.width/3,
                        initialLabelIndex: _swapDisplay? 0 : 1,
                        totalSwitches: 2,
                        labels: profileDisplayList,
                        activeBgColor: [ApplicationColors.Primary_300],
                        inactiveBgColor: ApplicationColors.Secondary_100,
                        activeFgColor: ApplicationColors.Primary_1000,
                        inactiveFgColor: ApplicationColors.Primary_1000,
                        onToggle: (index) {
                          setState(() {
                            _swapDisplay = !_swapDisplay;
                          });
                        }
                      ),
                    )
                  ],
                )
              ),
              Flexible(
                flex: 50,
                child: _swapDisplay? ProfileDetailsWidget(
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  emailAddressController: _emailAddressController,
                  currencyController: _currencyController,
                  savingsGoalController: _savingsGoalController,
                  startDateController: _startDateController,
                  endDateController: _endDateController
                  ) : analyticsDisplay,
              ),
              Expanded(
                flex: 15,
                child: NavigationBar3(
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  emailAddressController: _emailAddressController,
                  currencyController: _currencyController,
                  savingsGoalController: _savingsGoalController,
                  startDateController: _startDateController,
                  endDateController: _endDateController
                )
              )
            ] 
          ),
        )
      );
  }
}

