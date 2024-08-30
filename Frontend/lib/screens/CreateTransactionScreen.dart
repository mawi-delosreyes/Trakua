import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/model/Envelope.dart';
import 'package:frontend/model/SubEnvelope.dart';
import 'package:frontend/repository/EnvelopeRepo.dart';
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
  List<bool> expandedList = List.filled(1, false);
  List<bool> tapSubEnvelope = List.filled(2, false);

  int? _envelopeId;
  int? _subEnvelopeId;
  String? _category;

  TextEditingController _amountController = TextEditingController();
  TextEditingController _notesController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    List<String> transactionTypeList = ["Savings", "Expenses", "Transfer"];
    List<String> accountsList = ["Wants", "Needs", "Savings"];
    var formatter = DateFormat('yyyy/MM/dd');
    var topupDate = formatter.format(DateTime.now());
    String dropdownValue = accountsList.first;
    String _transactionType = transactionTypeList.first;



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
                  controller: _amountController,
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
                      _transactionType = transactionTypeList.elementAt(index);
                    });
                  }
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height/3,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: FutureBuilder(
                    future: EnvelopeRepo().getEnvelopes(), 
                    builder: (BuildContext context, AsyncSnapshot<List<Envelope>> envelopeList) {
                      if(envelopeList.hasData){
                        int envelopeListSize = envelopeList.data!.length;
                        
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: envelopeListSize > 6? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: envelopeListSize,
                          itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _envelopeId = envelopeList.data!.elementAt(index).envelope_id;
                                expandedList[index] = !expandedList.elementAt(index);
                                tapSubEnvelope = List.filled(2, false);
                              });
                            },
                            child: Container(
                              height: expandedList.elementAt(index)? MediaQuery.of(context).size.height/4: MediaQuery.of(context).size.height/25,
                              width: MediaQuery.of(context).size.width/2,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: ApplicationColors.Primary_1000
                                ),
                                color: ApplicationColors.Primary_100
                              ),

                              child: expandedList.elementAt(index) ? 
                                //Expanded
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/15, top: MediaQuery.of(context).size.width/20),
                                        child: Text(envelopeList.data!.elementAt(index).envelope_name),
                                      ),
                                      
                                      Container(
                                        height: MediaQuery.of(context).size.height/7,
                                        width: MediaQuery.of(context).size.width/2,
                                        child: FutureBuilder(
                                          future: SubEnvelopeRepo().getSubEnvelopeFromEnvelope(envelopeList.data!.elementAt(index).envelope_id), 
                                          builder: (BuildContext context, AsyncSnapshot<List<SubEnvelope>> subEnvelopeList) {
                                            if(subEnvelopeList.hasData){
                                              return ListView.separated(
                                                shrinkWrap: true,
                                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/40),
                                                itemCount: subEnvelopeList.data!.length,
                                                itemBuilder: (BuildContext context, int sub_index) =>
                                                  GestureDetector(
                                                    onTap: (){
                                                      setState((){
                                                        if(tapSubEnvelope.elementAt(sub_index)) {
                                                          tapSubEnvelope[sub_index] = false;
                                                          _subEnvelopeId = -1;
                                                        } else {
                                                          if(tapSubEnvelope.contains(true)) {
                                                            int selected = tapSubEnvelope.indexOf(true);
                                                            tapSubEnvelope[selected] = false;
                                                          }
                                                          tapSubEnvelope[sub_index] = true;
                                                          _subEnvelopeId = subEnvelopeList.data!.elementAt(sub_index).sub_envelope_id;
                                                        }                                                      
                                                      });
                                                    },
                                                    child: Container(
                                                      height: MediaQuery.of(context).size.height/30,
                                                      child: Text(subEnvelopeList.data!.elementAt(sub_index).sub_envelope_name),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                                        border: Border.all(
                                                          color: tapSubEnvelope.elementAt(sub_index)? ApplicationColors.Primary_1000 : ApplicationColors.Neutrals_200
                                                        ),
                                                        color: tapSubEnvelope.elementAt(sub_index)? ApplicationColors.Primary_400 : ApplicationColors.Secondary_100
                                                      ),
                                                      
                                                    ),
                                                  ),
                                                separatorBuilder: (BuildContext context, int index) => SizedBox(height: MediaQuery.of(context).size.height/100,)
                                              );

                                            } else {
                                              return Container();  
                                            }

                                          }
                                        ),
                                      )
                                  
                                    ],
                                  )
                                )

                                :
                                
                                //Collapsed
                                Container(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/15),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    envelopeList.data!.elementAt(index).envelope_name
                                  ),
                                ),
                            ),
                          ),
                          separatorBuilder: (BuildContext context, int index) => SizedBox(height: MediaQuery.of(context).size.height/50,), 
                        );
                      } else {
                        return Container();
                      }
                    }
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
                      _category = dropdownValue;
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
                  controller: _notesController,
                ), 
              ),

              Expanded(
                flex: 10,
                child: NavigationBar4Transaction(
                  envelope_id: _envelopeId ?? 0, 
                  sub_envelope_id: _subEnvelopeId ?? 0, 
                  transaction_date: DateTime.now().millisecondsSinceEpoch, 
                  transaction_amount: double.tryParse(_amountController.text.replaceAll(",","")) ?? 0, 
                  category: _category ?? "",
                  notes: _notesController.text,
                  transaction_type: _transactionType, 
                  account_id: widget.user_id, 
                  from_envelope_id: null,
                  is_transfer: 0,
                  from_sub_envelope_id: null,
                  )
              )
            ],
          ),
        )
      )
    );
  }
}