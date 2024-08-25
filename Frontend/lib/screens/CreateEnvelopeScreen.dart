import 'package:flutter/material.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import 'package:frontend/widgets/NavigationBar2.dart';
import 'package:frontend/widgets/NavigationBar4.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateEnvelope extends StatefulWidget {
  final int user_id;

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
  TextEditingController envelope_name = TextEditingController(text: "Envelope Name");


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Chibao",
      theme: ThemeData(useMaterial3: false,),
      debugShowCheckedModeBanner: false,
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
                        ),
                        controller: envelope_name,
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

                            Container(height:  MediaQuery.of(context).size.height/60,),

                            Container(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/40),
                              child: Row(
                                children: <Widget>[
                                  InkWell(
                                    child: SvgPicture.asset(
                                      height:  MediaQuery.of(context).size.height/30,
                                      width: MediaQuery.of(context).size.width/30,
                                      'assets/icons/add.svg',
                                      fit: BoxFit.scaleDown,
                                      color: ApplicationColors.Secondary_600
                                    ),
                                    onTap: (){},
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
                child: NavigationBar4()
              )

            ],
          )
        )
      )
    );
  }
}