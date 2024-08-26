import 'package:flutter/material.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/CreateSubEnvelopePopup.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import 'package:frontend/widgets/NavigationBar2.dart';
import 'package:frontend/widgets/NavigationBar4.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateEnvelope extends StatefulWidget {
  final int user_id;
  static final navKey = new GlobalKey<NavigatorState>();
  
  CreateEnvelope({
    Key? key,
    required this.user_id
  });

  @override
  State<CreateEnvelope> createState() => _CreateEnvelope();
}

class _CreateEnvelope extends State<CreateEnvelope> {

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
      navigatorKey: CreateEnvelope.navKey,
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
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text("Sub-Envelopes"),
                            ),

                            Container(height: MediaQuery.of(context).size.height/60,),

                            Container(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/40),
                              child: Row(
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
                                        context: CreateEnvelope.navKey.currentState!.overlay!.context,
                                        builder: (context) => CreateSubEnvelopePopupWidget(user_id: widget.user_id),
                                      );

                                    },
                                  ),
                                ],
                              )
                            )
                          ]
                        ),
                      ),

                      Container(height:  MediaQuery.of(context).size.height/40,),

                      Container(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/30),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text("Transactions"),
                            ),
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