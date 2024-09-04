import 'package:flutter/material.dart';
import 'package:frontend/model/Envelope.dart';
import 'package:frontend/model/ScheduledTransaction.dart';
import 'package:frontend/model/SubEnvelope.dart';
import 'package:frontend/repository/EnvelopeRepo.dart';
import 'package:frontend/repository/ScheduleTransactionRepo.dart';
import 'package:frontend/repository/SubEnvelopeRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/CreateSubEnvelopePopup.dart';
import 'package:frontend/widgets/EnvelopePartition.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import 'package:frontend/widgets/NavigationBar2.dart';
import 'package:frontend/widgets/NavigationBar4.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllEnvelopeScreen extends StatefulWidget {
  final int user_id;
  static final navKey = new GlobalKey<NavigatorState>();
  
  AllEnvelopeScreen({
    Key? key,
    required this.user_id
  });

  @override
  State<AllEnvelopeScreen> createState() => _AllEnvelopeScreen();
}

class _AllEnvelopeScreen extends State<AllEnvelopeScreen> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Chibao",
      theme: ThemeData(useMaterial3: false,),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ApplicationColors.Background,
        body: Center(
          child: Column(
            children: <Widget>[
              Container(height: MediaQuery.of(context).size.height/10,),
              
              Text("Envelopes"),
              
              Container(height: MediaQuery.of(context).size.height/30,),

              Flexible(
                flex: 63, 
                child: Container(
                  child: FutureBuilder(
                    future: EnvelopeRepo().getEnvelopes(), 
                    builder: (BuildContext context, AsyncSnapshot<List<Envelope>> envelopeList) {
                    
                      if(envelopeList.hasData){
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,  
                            childAspectRatio: (MediaQuery.of(context).size.height/10) / (MediaQuery.of(context).size.width/4)
                          ), 
                          padding: EdgeInsets.all(10),
                          itemCount: envelopeList.data!.length,
                          itemBuilder: (context, index) => EnvelopePartitionWidget(
                            envelope_name: envelopeList.data!.elementAt(index).envelope_name,
                            envelope_amount_left: envelopeList.data!.elementAt(index).envelope_total_balance - envelopeList.data!.elementAt(index).envelope_balance,
                            envelope_total_amount: envelopeList.data!.elementAt(index).envelope_total_balance
                            )
                        );

                      } else{
                        return Container();
                      }

                    }
                  ),
                )
              ),

              Expanded(
                flex: 15,
                child: NavigationBar2()
              )

            ],
          )
        ),
      ),
    );
  }
}
