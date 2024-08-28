import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/model/SubEnvelope.dart';
import 'package:frontend/repository/SubEnvelopeRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/CreateSubEnvelopePopup.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import 'package:frontend/widgets/NavigationBar2.dart';
import 'package:frontend/widgets/NavigationBar4-transaction.dart';
import 'package:frontend/widgets/NavigationBar4.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CreateTransactionScreen extends StatefulWidget {
  final int user_id;
  static final navKey = new GlobalKey<NavigatorState>();
  
  CreateTransactionScreen({
    Key? key,
    required this.user_id
  });

  @override
  State<CreateTransactionScreen> createState() => _CreateTransactionScreen();
}

class _CreateTransactionScreen extends State<CreateTransactionScreen> {
  int switch_index = 0;
  bool recurring_transaction = false;
  List<bool> expandedList = List.filled(8, false);

  @override
  Widget build(BuildContext context) {

    List<String> transactionTypeList = ["Savings", "Expenses", "Transfer"];
    List<String> accountsList = ["Wants", "Needs", "Savings"];
    var formatter = DateFormat('yyyy/MM/dd');
    var topupDate = formatter.format(DateTime.now());
    String dropdownValue = accountsList.first;

    return MaterialApp(
      title: "Chibao",
      theme: ThemeData(useMaterial3: false,),
      debugShowCheckedModeBanner: false,
      navigatorKey: CreateTransactionScreen.navKey,
      home: Scaffold(
        backgroundColor: ApplicationColors.Background,
        body:Center(
          child: Column(
            children: <Widget>[

              SizedBox(
                height: MediaQuery.of(context).size.height/10,
              ),

              Container(
                height: MediaQuery.of(context).size.height/20,
                child: Text("Add Transaction"),
              ),

              Container(
                height: MediaQuery.of(context).size.height/15,
                width: MediaQuery.of(context).size.width/1.5,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    isDense: true,
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ApplicationColors.Secondary_300)
                    ),
                    hintText: "0.0"
                  ),
                ),              
              ),

              Container(
                height: MediaQuery.of(context).size.height/20,

                child: ToggleSwitch(
                  minHeight: MediaQuery.of(context).size.height/30,
                  minWidth: MediaQuery.of(context).size.width/3,
                  initialLabelIndex: switch_index,
                  totalSwitches: 3,
                  labels: transactionTypeList,
                  activeBgColor: [ApplicationColors.Primary_300],
                  inactiveBgColor: ApplicationColors.Background,
                  activeFgColor: ApplicationColors.Primary_1000,
                  inactiveFgColor: ApplicationColors.Primary_1000,
                  borderColor: [ApplicationColors.Neutrals_200],
                  borderWidth: 1.0,
                  onToggle: (index) {
                    setState(() {
                      switch_index = index!;
                    });
                  }
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height/3,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: 8 <= 8? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          expandedList[index] = !expandedList.elementAt(index);
                        });
                      },
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: expandedList.elementAt(index)? MediaQuery.of(context).size.height/4: MediaQuery.of(context).size.height/25,
                        width: MediaQuery.of(context).size.width/2,
                        child: expandedList.elementAt(index)?Text("Expanded"): Text("Collapsed"),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            color: ApplicationColors.Primary_1000
                          ),
                          color: ApplicationColors.Primary_100
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: MediaQuery.of(context).size.height/50,), 
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height/12,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height/20,
                      width: MediaQuery.of(context).size.width/3.3, 
                      padding: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        key: Key(topupDate.toString()),
                        initialValue: topupDate.toString(),
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
                                      topupDate = '${value.year.toString()}/${value.month.toString()}/${value.day.toString()}';
                                    })
                                }
                              }),
                          ),                            
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Date",
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
                        style: TextStyle(
                          color: ApplicationColors.Primary_900,
                          fontSize: 11
                        ),
                      ),
                    ),

                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height/50,
                            width: MediaQuery.of(context).size.width/5, 
                            child: Text("Recurring Transaction"),
                          ),
                          
                          Container(
                            height: MediaQuery.of(context).size.height/50,
                            child: Transform.scale(
                              scale: 0.5,
                              child: CupertinoSwitch(
                              activeColor: ApplicationColors.Primary,
                              value: recurring_transaction, 
                              onChanged: (bool value) {
                                setState(() {
                                  recurring_transaction = value;
                                });
                              })
                            )                          
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height/15,
                child: DropdownButtonFormField (
                  iconEnabledColor: ApplicationColors.Primary_900,
                  decoration: InputDecoration(
                    fillColor: ApplicationColors.Base_White,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Category",
                    hintText: accountsList.first,
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
                    });
                  },
                  items: accountsList.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value, style: const TextStyle(color: ApplicationColors.Primary_900),));
                    }).toList(),
                )

              ),
  
              Container(
                height: MediaQuery.of(context).size.height/15,
                child: TextFormField(
                  decoration: const InputDecoration(
                    fillColor: ApplicationColors.Base_White,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Notes",
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
                  style: const TextStyle(color: ApplicationColors.Primary_900),
                ), 
              ),

              Expanded(
                flex: 10,
                child: NavigationBar4Transaction()
              )

            ],
          ),
        )
      )
    );
  }
}