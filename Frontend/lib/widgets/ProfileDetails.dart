import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/model/ProfileDetails.dart';
import 'package:frontend/repository/ProfileDetailsRepo.dart';
import 'package:frontend/repository/ProfileDetailsRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar3.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:frontend/repository/LocalInitRepo.dart';
import 'package:frontend/repository/LocalInitRepo.dart';

class ProfileDetailsWidget extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailAddressController; 
  final TextEditingController currencyController;
  final TextEditingController savingsGoalController; 
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  const ProfileDetailsWidget({
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
  State<ProfileDetailsWidget> createState() => _ProfileDetailsWidget();
}

class _ProfileDetailsWidget extends State<ProfileDetailsWidget> {

  List<String> currencyList = ['PHP', 'USD', 'JPY', 'HKD'];


  @override
  Widget build(BuildContext context) {

    return Container(
      child: FutureBuilder(
        future: ProfileDetailsRepo().getProfileDetails(),
        builder: (BuildContext context, AsyncSnapshot<List<ProfileDetails>> profile_details) {
          
          String dropdownValue = profile_details.hasData ? profile_details.data!.first.currency : currencyList.first;
          String _startDate = profile_details.hasData ? profile_details.data!.first.start_time_period.toString() : "Start Date";
          String _endDate = profile_details.hasData ? profile_details.data!.first.end_time_period.toString() : "End Date";

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container (
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width/1.2,            
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: ApplicationColors.Base_White,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "First Name",
                    hintText: profile_details.hasData ? profile_details.data!.first.first_name : "",
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
                  controller: widget.firstNameController,
                  style: const TextStyle(color: ApplicationColors.Primary_900),
                ),
              ),
              Container (
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width/1.2,            
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: ApplicationColors.Base_White,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Last Name",
                    hintText: profile_details.hasData ? profile_details.data!.first.last_name : "",
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
                  controller: widget.lastNameController,
                  style: const TextStyle(color: ApplicationColors.Primary_900),
                ),
              ),
              Container (
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width/1.2,            
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: ApplicationColors.Base_White,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Email Address",
                    hintText: profile_details.hasData ? profile_details.data!.first.email_address : "",
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
                  controller: widget.emailAddressController,
                  style: const TextStyle(color: ApplicationColors.Primary_900),
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
                      decoration: InputDecoration(
                        fillColor: ApplicationColors.Base_White,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Currency",
                        hintText: profile_details.hasData ? profile_details.data!.first.currency : "",
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
                          color: ApplicationColors.Primary_900,
                        ),
                      ),
                      value: dropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                          widget.currencyController.text = value;
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
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: ApplicationColors.Base_White,
                        hintText: profile_details.hasData ? profile_details.data!.first.savings_goal.toString() : "",
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Savings Goal",
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
                      controller: widget.savingsGoalController,
                      style: const TextStyle(color: ApplicationColors.Primary_900),
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
                                          widget.startDateController.text = _startDate;
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
                                          widget.endDateController.text = _endDate;
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
            ]
          );
        })
      );
  }
}
