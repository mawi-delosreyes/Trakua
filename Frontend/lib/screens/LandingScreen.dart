import 'package:flutter/material.dart';
import 'package:frontend/model/Envelope.dart';
import 'package:frontend/model/ProfileDetails.dart';
import 'package:frontend/model/SubEnvelope.dart';
import 'package:frontend/model/Transactions.dart';
import 'package:frontend/repository/EnvelopeRepo.dart';
import 'package:frontend/repository/ProfileDetailsRepo.dart';
import 'package:frontend/repository/SubEnvelopeRepo.dart';
import 'package:frontend/repository/TransactionRepo.dart';
import 'package:frontend/screens/ProfileScreen.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar2.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                          return Row(
                            children: <Widget>[
                              SizedBox.square(
                                dimension: MediaQuery.of(context).size.height/35,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(
                                      color: ApplicationColors.Neutrals_200
                                    ),
                                    color: ApplicationColors.Primary_100
                                  ),
                                  child: InkWell(
                                    child: SvgPicture.asset(
                                        height:  MediaQuery.of(context).size.height/50,
                                        width: MediaQuery.of(context).size.width/50,
                                        'assets/icons/user.svg',
                                        fit: BoxFit.scaleDown,
                                        color: ApplicationColors.Primary_1000,
                                    ),
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context, 
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1, animation2) => ProfileScreen(),
                                          transitionDuration: Duration.zero,
                                          reverseTransitionDuration: Duration.zero
                                        )
                                      );
                                    },
                                  )                                  
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width/50,
                              ),
                              Text(
                                profileDetail.hasData ? "Hello, " + profileDetail.data!.first.first_name + "!" : "Username",
                                style: GoogleFonts.figtree(
                                  fontWeight: FontWeight.bold,
                                  color: ApplicationColors.Primary_1000,
                                  fontSize: 13
                                ), 
                              ),
                            ],
                          );
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
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularPercentIndicator(
                                  radius: MediaQuery.of(context).size.height/10,
                                  animation: false,
                                  percent: amount_left,
                                  center: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                          style: GoogleFonts.roboto(
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
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/80,),
                                Text(
                                  envelopeList.data!.first.envelope_name.toUpperCase(),
                                  style: TextStyle(
                                    color: ApplicationColors.Primary_1000,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/55,),
                              ],
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                /*
                                Container(
                                  height: MediaQuery.of(context).size.height/50,
                                  width: MediaQuery.of(context).size.width/5.5,
                                  child: OutlinedButton(
                                    child: Text(
                                      "Show All",
                                      style: TextStyle(
                                        fontSize: 10
                                      ),  
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        color: ApplicationColors.Secondary,
                                      ),
                                      backgroundColor: ApplicationColors.Secondary_100
                                    ),                                  
                                    onPressed: () { Navigator.pushReplacement(
                                        context, 
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1, animation2) => AllSubEnvelopeScreen(user_id: widget.user_id,),
                                          transitionDuration: Duration.zero,
                                          reverseTransitionDuration: Duration.zero
                                        )
                                      );
                                    }
                                  )
                                )
                                */
                              ],
                            ),
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
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
                      child: Column(
                        children: <Widget>[
                          Row(
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
                              /*
                              Container(
                                height: MediaQuery.of(context).size.height/50,
                                width: MediaQuery.of(context).size.width/5.5,
                                child: OutlinedButton(
                                  child: Text(
                                    "Show All",
                                    style: TextStyle(
                                      fontSize: 10
                                    ),  
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: ApplicationColors.Secondary,
                                    ),
                                    backgroundColor: ApplicationColors.Secondary_100
                                  ),                                  
                                  onPressed: () => Navigator.pushReplacement(
                                      context, 
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation1, animation2) => TransactionScreen(user_id: widget.user_id,),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration: Duration.zero
                                      )
                                    )
                                )
                              )
                              */
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