import 'package:flutter/material.dart';
import 'package:frontend/model/Envelope.dart';
import 'package:frontend/model/ProfileDetails.dart';
import 'package:frontend/model/SubEnvelope.dart';
import 'package:frontend/model/Transactions.dart';
import 'package:frontend/repository/EnvelopeRepo.dart';
import 'package:frontend/repository/ProfileDetailsRepo.dart';
import 'package:frontend/repository/SubEnvelopeRepo.dart';
import 'package:frontend/repository/TransactionRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar2.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LandingScreen extends StatefulWidget {
  final int user_id;

  LandingScreen({
    Key? key,
    required this.user_id
  });

  @override
  State<LandingScreen> createState() => _LandingScreen();
}

class _LandingScreen extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false,),
      home: Scaffold(
        backgroundColor: ApplicationColors.Background,
        body: Center(
          child: Column(
            children: <Widget>[

              Flexible(
                flex: 63, 
                child: Column(
                  children: <Widget>[

                    Container(height: MediaQuery.of(context).size.height/10,),
                    Container(
                      height: MediaQuery.of(context).size.height/25,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/25),
                      child: FutureBuilder(
                        future: ProfileDetailsRepo().getProfileDetails(widget.user_id),
                        builder: (BuildContext context, AsyncSnapshot<List<ProfileDetails>> profileDetail) {
                          if(profileDetail.hasData) {
                            return Text(
                              "Hello, " + profileDetail.data!.first.first_name + "!",
                              style: GoogleFonts.figtree(
                                fontWeight: FontWeight.bold,
                                color: ApplicationColors.Primary_1000,
                                fontSize: 13
                              ),  
                            );
                          } else {
                            return Text(
                              "Username",
                              style: GoogleFonts.figtree(
                                fontWeight: FontWeight.bold,
                                color: ApplicationColors.Primary_1000,
                                fontSize: 13
                              ), 
                            );
                          }
                        },
                      )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/4,
                      alignment: Alignment.center,
                      child: FutureBuilder(
                        future: EnvelopeRepo().getEnvelopes(), 
                        builder: (BuildContext context, AsyncSnapshot<List<Envelope>> envelopeList){
                          if(envelopeList.hasData){

                            double amount_left = (envelopeList.data!.first.envelope_total_balance - envelopeList.data!.first.envelope_balance) / envelopeList.data!.first.envelope_total_balance;

                            return CircularPercentIndicator(
                              radius: MediaQuery.of(context).size.height/10,
                              animation: false,
                              percent: amount_left,
                              center: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "${(amount_left * 100)}%",
                                      style: GoogleFonts.figtree(
                                        fontWeight: FontWeight.bold,
                                        color: ApplicationColors.Primary_1000,
                                        fontSize: 23
                                      ),
                                    ),
                                    Text(
                                      "${envelopeList.data!.first.envelope_balance} out of ${envelopeList.data!.first.envelope_total_balance}",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.helvetica(
                                        fontWeight: FontWeight.normal,
                                        color: ApplicationColors.Primary,
                                        fontSize: 11
                                      ), 
                                    )
                                  ],
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: ApplicationColors.Primary,
                              backgroundColor: ApplicationColors.Secondary_100,
                            );
                          } else{
                            return Container();
                          }
                        }
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/4.5,
                      child: Column(
                        children: <Widget>[
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Sub-Envelope Analytics",
                                style: GoogleFonts.figtree(
                                  fontWeight: FontWeight.w700,
                                  color: ApplicationColors.Primary_1000,
                                  fontSize: 15
                                ),
                              ),
                              Text("Show All")
                            ],
                          ),
                          FutureBuilder(
                            future: SubEnvelopeRepo().getSubEnvelopes(), 
                            builder: (BuildContext context, AsyncSnapshot<List<SubEnvelope>> subEnvelopeList){
                              if(subEnvelopeList.hasData) {
                                return Container(
                                  padding: EdgeInsets.zero,
                                  height: MediaQuery.of(context).size.height/5,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: subEnvelopeList.data!.length,
                                    itemBuilder: (BuildContext context, int index) => 
                                    Card(
                                        color: ApplicationColors.Primary_700,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6),
                                          side: const BorderSide(
                                            color: ApplicationColors.Primary_1000
                                          )
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width/1.5,    
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(subEnvelopeList.data!.elementAt(index).sub_envelope_name)
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ),
                                    
                                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: MediaQuery.of(context).size.width/35,)
                                  )
                                );

                              } else {
                                return Container();
                              }
                            }
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/5.5,
                      child: Column(
                        children: <Widget>[
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Transactions",
                                style: GoogleFonts.figtree(
                                  fontWeight: FontWeight.w700,
                                  color: ApplicationColors.Primary_1000,
                                  fontSize: 15
                                ),   
                              ),
                              Text("Show All")
                            ],
                          ),

                          FutureBuilder(
                            future: TransactionRepo().getTransactions(), 
                            builder: (BuildContext context, AsyncSnapshot<List<Transactions>> transactionList){
                              if(transactionList.hasData){
                                return Container(
                                  height: MediaQuery.of(context).size.height/6.5,
                                  child: ListView.separated(
                                    padding: EdgeInsets.zero,
                                    itemCount: transactionList.data!.length,
                                    itemBuilder: (BuildContext context, int index) => 
                                    Container(
                                      height: MediaQuery.of(context).size.height/15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(const Radius.circular(8)),
                                        border: Border.all(
                                          color: ApplicationColors.Neutrals_200
                                        ),
                                        color: ApplicationColors.Background
                                      ),
                                      child: Text(transactionList.data!.elementAt(index).sub_envelope_name)
                                    ), 
                                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: MediaQuery.of(context).size.height/35,)
                                  ),
                                ); 
                              } else {
                                return Container();
                              }
                            }
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 15,
                child: NavigationBar2(screen_selection: "home", user_id: widget.user_id,)
              )

            ],
          ),
        ),
      ),

    );
  }
}