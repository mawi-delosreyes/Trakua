import 'package:flutter/material.dart';
import 'package:frontend/model/ScheduledTransaction.dart';
import 'package:frontend/model/SubEnvelope.dart';
import 'package:frontend/repository/ScheduleTransactionRepo.dart';
import 'package:frontend/repository/SubEnvelopeRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/CreateSubEnvelopePopup.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import 'package:frontend/widgets/NavigationBar2.dart';
import 'package:frontend/widgets/NavigationBar4.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateEnvelopeScreen extends StatefulWidget {
  final int user_id;
  static final navKey = new GlobalKey<NavigatorState>();
  
  CreateEnvelopeScreen({
    Key? key,
    required this.user_id
  });

  @override
  State<CreateEnvelopeScreen> createState() => _CreateEnvelopeScreen();
}

class _CreateEnvelopeScreen extends State<CreateEnvelopeScreen> {

  List<String> envelopeTypeList = ["Savings", "Expenses"];
  String envelopeType = "Savings";
  bool _swapType = true;
  TextEditingController _envelopeNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Chibao",
      theme: ThemeData(useMaterial3: false,),
      debugShowCheckedModeBanner: false,
      navigatorKey: CreateEnvelopeScreen.navKey,
      home: Scaffold(
        backgroundColor: ApplicationColors.Background,
        body:Center(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 63,
                child: Column(
                  children: <Widget>[
                    
                    Container(height: MediaQuery.of(context).size.height/10,),

                    const Text(
                      "Create Envelope",
                      textDirection: TextDirection.ltr
                    ),

                    Container(height: MediaQuery.of(context).size.height/30,),

                    SizedBox(
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
                          hintText: "Envelope Name"
                        ),
                        controller: _envelopeNameController,
                      ),
                    ),
                    
                    Container(height: MediaQuery.of(context).size.height/30,),

                    ToggleSwitch(
                      minHeight: MediaQuery.of(context).size.height/30,
                      minWidth: MediaQuery.of(context).size.width/3,
                      initialLabelIndex: _swapType? 0 : 1,
                      totalSwitches: 2,
                        labels: envelopeTypeList,
                        activeBgColor: [ApplicationColors.Primary_300],
                        inactiveBgColor: ApplicationColors.Background,
                        activeFgColor: ApplicationColors.Primary_1000,
                        inactiveFgColor: ApplicationColors.Primary_1000,
                        borderColor: [ApplicationColors.Neutrals_200],
                        borderWidth: 1.0,
                        onToggle: (index) {
                          setState(() {
                            _swapType = !_swapType;
                            envelopeType = envelopeTypeList.elementAt(index!);
                          });
                        }
                      ),

                      Container(height:  MediaQuery.of(context).size.height/15,),

                      Container(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/30),
                        height: MediaQuery.of(context).size.height/5,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text("Sub-Envelopes"),
                            ),

                            Container(height: MediaQuery.of(context).size.height/60,),

                            Container(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/40),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  InkWell(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height/15,
                                          width: MediaQuery.of(context).size.width/10,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.all(
                                              color: ApplicationColors.Secondary_600
                                            ),
                                            color: ApplicationColors.Secondary_100
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          height:  MediaQuery.of(context).size.height/50,
                                          width: MediaQuery.of(context).size.width/50,
                                          'assets/icons/add.svg',
                                          fit: BoxFit.scaleDown,
                                          color: ApplicationColors.Secondary_600
                                        ),
                                      ],
                                    ),
                                    onTap: (){
                                      showDialog(
                                        barrierColor: ApplicationColors.Background_90Opacity,
                                        context: CreateEnvelopeScreen.navKey.currentState!.overlay!.context,
                                        builder: (context) => CreateSubEnvelopePopupWidget(user_id: widget.user_id),
                                      );

                                    },
                                  ),

                                  SizedBox(width: MediaQuery.of(context).size.width/40,),

                                  Expanded(
                                    child: FutureBuilder(
                                      future: SubEnvelopeRepo().getSubEnvelopes(),
                                      builder: (BuildContext context, AsyncSnapshot<List<SubEnvelope>> subEnvelopeList) {
                                        if(subEnvelopeList.hasData){
                                          return SizedBox(
                                            height: 100,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: subEnvelopeList.data!.length,
                                              itemBuilder: (BuildContext context, int index) =>
                                                Container(
                                                  height: MediaQuery.of(context).size.height/10,
                                                  width: MediaQuery.of(context).size.width/5,
                                                  decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                  border: Border.all(
                                                    color: ApplicationColors.Primary
                                                  ),
                                                  color: ApplicationColors.Primary_200,
                                                  ),
                                                  child: Column(
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: MediaQuery.of(context).size.height/30,
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(subEnvelopeList.data!.elementAt(index).sub_envelope_balance.toString()),
                                                            Text(subEnvelopeList.data!.elementAt(index).sub_envelope_name)
                                                          ],
                                                        )
                                                      )
                                                    ],
                                                  ),
                                                ), 
                                              separatorBuilder: (BuildContext context, int index) => SizedBox(width: MediaQuery.of(context).size.width/35,)
                                                
                                            )
                                          );
                                        } else{
                                          return Container();
                                        }
                                      }
                                    )
                                  )
                                ],
                              )
                            )
                          ]
                        ),
                      ),

                      Container(height:  MediaQuery.of(context).size.height/40,),

                      Container(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/30, right: MediaQuery.of(context).size.height/30),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text("Scheduled Transactions"),  
                            ),
                            FutureBuilder(
                              future: ScheduledTransactionRepo().getScheduledTransactions(), 
                              builder: (BuildContext context, AsyncSnapshot<List<ScheduledTransactions>> scheduledTransactionsList) {
                                if(scheduledTransactionsList.hasData) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height/4,
                                    child: ListView.separated(
                                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/50),
                                      itemCount: scheduledTransactionsList.data!.length,
                                      itemBuilder: (BuildContext context, int index){

                                        return Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          height: MediaQuery.of(context).size.height/20,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(const Radius.circular(8)),
                                            border: Border.all(
                                              color: ApplicationColors.Primary_1000
                                            ),
                                            color: ApplicationColors.Primary_100
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(scheduledTransactionsList.data!.elementAt(index).sub_envelope_name),
                                              SizedBox(width: MediaQuery.of(context).size.width/30),
                                              Text(scheduledTransactionsList.data!.elementAt(index).transaction_amount.toString())
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (BuildContext context, int index) => SizedBox(height: MediaQuery.of(context).size.height/50,)),
                                  );
                                } else {
                                  return Container();
                                }
                              }
                            )
                          ],
                        ),
                      )
                    ],
                ),
              ),

              Expanded(
                flex: 15,
                child: NavigationBar4(envelope_name: _envelopeNameController,)
              )

            ],
          )
        )
      )
    );
  }
}