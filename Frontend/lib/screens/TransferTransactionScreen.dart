import 'package:flutter/material.dart';
import 'package:frontend/model/ScheduledTransaction.dart';
import 'package:frontend/model/Transactions.dart';
import 'package:frontend/repository/ScheduleTransactionRepo.dart';
import 'package:frontend/repository/TransactionRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class TransferTransactionScreen extends StatefulWidget {
  TransferTransactionScreen({
    Key? key,
  });

  @override
  State<TransferTransactionScreen> createState() => _TransferTransactionScreen();
}

class _TransferTransactionScreen extends State<TransferTransactionScreen> {

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
              
              Text("Transfer"),

              Flexible(
                flex: 63, 
                child: Column(
                  children: <Widget>[],
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
