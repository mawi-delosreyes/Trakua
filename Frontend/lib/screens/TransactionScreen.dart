import 'package:flutter/material.dart';
import 'package:frontend/model/ScheduledTransaction.dart';
import 'package:frontend/model/Transactions.dart';
import 'package:frontend/repository/ScheduleTransactionRepo.dart';
import 'package:frontend/repository/TransactionRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({
    Key? key,
  });

  @override
  State<TransactionScreen> createState() => _TransactionScreen();
}

class _TransactionScreen extends State<TransactionScreen> {

  var transactionList = [];
  
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
              
              Text("Transactions"),

              Flexible(
                flex: 63, 
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/15, right: MediaQuery.of(context).size.width/15),
                      height: MediaQuery.of(context).size.height/4,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Scheduled Transaction"),
                              InkWell(
                                child: Container(
                                  height: MediaQuery.of(context).size.height/50,
                                  width: MediaQuery.of(context).size.width/10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(
                                      color: ApplicationColors.Secondary
                                    ),
                                    color: ApplicationColors.Secondary_100,                                  
                                  ),
                                  child: Text("SEE ALL"),
                                ),
                              )
                            ],
                          ),

                          FutureBuilder(
                            future: ScheduledTransactionRepo().getScheduledTransactions(), 
                            builder: (BuildContext context, AsyncSnapshot<List<ScheduledTransactions>> scheduledTransactionList) {
                              if(scheduledTransactionList.hasData){
                                return SizedBox(
                                  height: 100,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/100),
                                    itemCount: scheduledTransactionList.data!.length,
                                    itemBuilder: (BuildContext context, int index) =>
                                      Container(
                                        height: MediaQuery.of(context).size.height/20,
                                        width: MediaQuery.of(context).size.width/10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          border: Border.all(
                                            color: ApplicationColors.Neutrals_200
                                          ),
                                          color: ApplicationColors.Secondary_100,                                  
                                        ),
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Text(scheduledTransactionList.data!.elementAt(index).sub_envelope_name),
                                                  Text(scheduledTransactionList.data!.elementAt(index).scheduled_date.toString())
                                                ],
                                              ),
                                              Text(scheduledTransactionList.data!.elementAt(index).transaction_amount.toString()),
                                              InkWell(
                                                child: Container(
                                                  height: MediaQuery.of(context).size.height/20,
                                                  width: MediaQuery.of(context).size.width/20,
                                                  child: SvgPicture.asset(
                                                    'assets/icons/edit.svg',
                                                    color: ApplicationColors.Primary_900),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: MediaQuery.of(context).size.height/35,)
                                  ),
                                );
                              } else{
                                return Container();
                              }
                            }
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Completed Transactions"),
                          Container(
                            child: EasyDateTimeLine(
                              initialDate: DateTime.now(),
                              onDateChange: (selectedDate) async{
                                setState(() {
                                  TransactionRepo().getTransactionsBasedOnDate(selectedDate.millisecondsSinceEpoch).then((transactions) {
                                    var iterator = transactions.iterator;
                                    while(iterator.moveNext()){
                                      if(transactionList.length > 0){ transactionList = [];}
                                      transactionList.add(iterator.current);
                                    }
                                  });
                                });
                              },
                              activeColor: const Color(0xffFFBF9B),
                              dayProps: const EasyDayProps(
                                dayStructure: DayStructure.dayNumDayStr,
                                height: 56.0,
                                width: 56.0,
                                activeDayNumStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                inactiveDayNumStyle: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            )
                          ),


                          SizedBox(
                            height: MediaQuery.of(context).size.height/3.5,
                            width: MediaQuery.of(context).size.width/1.1,
                            child: ListView.separated(
                              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/100),
                              itemCount: transactionList.length,
                              itemBuilder: (BuildContext context, int index) =>
                              Container(
                                height: MediaQuery.of(context).size.height/15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(
                                    color: ApplicationColors.Neutrals_200
                                  ),
                                  color: ApplicationColors.Secondary_100,                                  
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(transactionList.elementAt(index).sub_envelope_name),
                                        Text(transactionList.elementAt(index).transaction_date.toString()),
                                      ],
                                    ),
                                    Text(transactionList.elementAt(index).transaction_amount.toString())
                                  ],
                                )
                              ), 
                              separatorBuilder: (BuildContext context, int index) => SizedBox(height: MediaQuery.of(context).size.height/35,)
                            ),
                          )
                        
                        ],
                      ),
                    )
                  ],
                )
              ),

              Expanded(
                flex: 15,
                child: NavigationBar2()
              )

            ],
          ),

        ),
      ),
    );
  }
}
