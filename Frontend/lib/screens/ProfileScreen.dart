import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar3.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:frontend/repository/LocalInitRepo.dart';
import 'package:frontend/repository/LocalInitRepoImpl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<String> profileDisplayList = ["Profile", "Analytics"];
  List<String> currencyList = ['PHP', 'USD', 'JPY', 'HKD'];
  bool _swapDisplay = true;
  String _startDate = "Start Date";
  String _endDate = "End Date";

  @override
  void initState() {
    super.initState();
    print(LocalInitRepoImpl().initializeDB());
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = currencyList.first;
    final profileDisplay = Container(   
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container (
            height: MediaQuery.of(context).size.height/20,
            width: MediaQuery.of(context).size.width/1.2,            
            child: const TextField(
              decoration: InputDecoration(
                fillColor: ApplicationColors.Base_White,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "First Name",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ApplicationColors.Neutrals_300
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                        color: ApplicationColors.Secondary_900,
                  ),
                ),
                labelStyle: TextStyle(
                  color: ApplicationColors.Primary_900
                ),
              ),
              style: TextStyle(color: ApplicationColors.Primary_900),
            ),
          ),
          Container (
            height: MediaQuery.of(context).size.height/20,
            width: MediaQuery.of(context).size.width/1.2,            
            child: const TextField(
              decoration: InputDecoration(
                fillColor: ApplicationColors.Base_White,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "Last Name",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ApplicationColors.Neutrals_300
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                        color: ApplicationColors.Secondary_900,
                  ),
                ),
                labelStyle: TextStyle(
                  color: ApplicationColors.Primary_900
                ),
              ),
              style: TextStyle(color: ApplicationColors.Primary_900),
            ),
          ),
          Container (
            height: MediaQuery.of(context).size.height/20,
            width: MediaQuery.of(context).size.width/1.2,            
            child: const TextField(
              decoration: InputDecoration(
                fillColor: ApplicationColors.Base_White,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "Email Address",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ApplicationColors.Neutrals_300
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                        color: ApplicationColors.Secondary_900,
                  ),
                ),
                labelStyle: TextStyle(
                  color: ApplicationColors.Primary_900
                ),
              ),
              style: TextStyle(color: ApplicationColors.Primary_900),
            ),
          ),
          Row(         
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container (
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width/4.8,        
                child: DropdownButtonFormField (
                  iconEnabledColor: ApplicationColors.Primary_900,
                  decoration: const InputDecoration(
                    fillColor: ApplicationColors.Base_White,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Currency",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ApplicationColors.Neutrals_300
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ApplicationColors.Secondary_900,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: ApplicationColors.Primary_900,
                    ),
                  ),
                  value: dropdownValue,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: currencyList.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value, style: const TextStyle(color: ApplicationColors.Primary_900),));
                    }).toList(),
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width/100,
              ),

              Container (
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width/1.6,            
                child: const TextField(
                  decoration: InputDecoration(
                    fillColor: ApplicationColors.Base_White,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Savings Goal",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ApplicationColors.Neutrals_300
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ApplicationColors.Secondary_900,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: ApplicationColors.Primary_900
                    ),
                  ),
                  style: TextStyle(color: ApplicationColors.Primary_900),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.2, 
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Time Period",
                    style: TextStyle(color: ApplicationColors.Primary_900),
                    ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container (
                      height: MediaQuery.of(context).size.height/20,
                      width: MediaQuery.of(context).size.width/2.5,            
                      child: TextFormField(
                        key: Key(_startDate.toString()),
                        initialValue: _startDate.toString(),
                        decoration: InputDecoration(
                          fillColor: ApplicationColors.Base_White,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          suffixIconConstraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width/15, 
                            minHeight: MediaQuery.of(context).size.height/15, 
                          ),
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset('assets/icons/calendar.svg'),
                            onPressed: () => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2015, 8),
                              lastDate: DateTime(2101),
                              ).then((value) => {
                                if (value != null) {
                                  setState(() {
                                      _startDate = '${value.year.toString()}/${value.month.toString()}/${value.day.toString()}';
                                    })
                                }
                              }),
                          ),                            
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Start",
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ApplicationColors.Neutrals_300
                            )
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                  color: ApplicationColors.Secondary_900,
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: ApplicationColors.Primary_900
                          ),
                        ),
                        style: const TextStyle(color: ApplicationColors.Primary_900),
                      ),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width/30,
                    ),

                    Container (
                      height: MediaQuery.of(context).size.height/20,
                      width: MediaQuery.of(context).size.width/2.5,            
                      child: TextFormField(
                        key: Key(_endDate.toString()),
                        initialValue: _endDate.toString(),
                        decoration: InputDecoration(
                          fillColor: ApplicationColors.Base_White,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          suffixIconConstraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width/15, 
                            minHeight: MediaQuery.of(context).size.height/15, 
                          ),
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset('assets/icons/calendar.svg'),
                            onPressed: () => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2015, 8),
                              lastDate: DateTime(2101),
                              ).then((value) => {
                                if (value != null) {
                                  setState(() {
                                      _endDate = '${value.year.toString()}/${value.month.toString()}/${value.day.toString()}';
                                    })
                                }
                              }),
                          ),                            
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "End",
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ApplicationColors.Neutrals_300
                            )
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                  color: ApplicationColors.Secondary_900,
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: ApplicationColors.Primary_900
                          ),
                        ),
                        style: const TextStyle(color: ApplicationColors.Primary_900),
                      ),
                    ),

                  ],

                  
                )


              ],
            ),
          )
        ],
      ),

    );

    final analyticsDisplay = Container(
      color: ApplicationColors.Primary_700,
    );

    return MaterialApp(      
        title: 'Chibao',
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
              new Flexible(
                flex: 50,
                child: _swapDisplay? profileDisplay : analyticsDisplay,
              ),
              new Expanded(
                flex: 15,
                child: Container(
                  child: new NavigationBar3(),
                )
              )
            ] 
          ),
        )
      );
  }
}

