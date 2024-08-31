import 'package:flutter/material.dart';
import 'package:frontend/repository/ScheduleTransactionRepo.dart';
import 'package:frontend/repository/TransactionRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBar4Transaction extends StatefulWidget {

  final int envelope_id;
  final int sub_envelope_id;
  final int transaction_date;
  final double transaction_amount;
  String category;
  var notes;
  final String transaction_type;
  final int account_id;
  var from_envelope_id;
  final int is_transfer;
  var from_sub_envelope_id;
  
  NavigationBar4Transaction({Key? key, 
  required this.envelope_id, 
  required this.sub_envelope_id, 
  required this.transaction_date,
  required this.transaction_amount,
  required this.category,
  this.notes,
  required this.transaction_type,
  required this.account_id,
  this.from_envelope_id,
  required this.is_transfer,
  this.from_sub_envelope_id
  }) : super(key: key);
  

  @override
  State<NavigationBar4Transaction> createState() => _NavigationBar4TransactionState();
}

class _NavigationBar4TransactionState extends State<NavigationBar4Transaction> {
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/20, right: MediaQuery.of(context).size.width/20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      height: MediaQuery.of(context).size.height/15,
                      width: MediaQuery.of(context).size.width/1.8, 
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ApplicationColors.Primary_900,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(101.52)),
                        color: ApplicationColors.Primary_100
                      ),
                      child: new Row (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget> [
                    
                          Flexible(
                            child: FractionallySizedBox(
                              widthFactor: 0.6,
                              heightFactor: 0.4,
                              child: SvgPicture.asset(
                                'assets/icons/home.svg',
                                color: ApplicationColors.Primary_900
                                )
                            ),
                          ),
                    
                          Flexible(
                            child: FractionallySizedBox(
                              widthFactor: 0.6,
                              heightFactor: 0.4,
                              child: SvgPicture.asset(
                                'assets/icons/envelopes.svg',
                                color: ApplicationColors.Primary_900
                                )
                            ),
                          ),
                    
                          Flexible(
                            child: FractionallySizedBox(
                              widthFactor: 0.6,
                              heightFactor: 0.4,
                              child: SvgPicture.asset(
                                'assets/icons/history.svg',
                                color: ApplicationColors.Primary_900
                                )
                            ),
                          ),
                    
                          Flexible(
                            child: FractionallySizedBox(
                              widthFactor: 0.6,
                              heightFactor: 0.4,
                              child: SvgPicture.asset(
                                'assets/icons/analysis.svg',
                                color: ApplicationColors.Primary_300
                                )
                            ),
                          ),
                        ],
                      ),
                    )
                  ),

                  Flexible(
                    child: InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height/15,
                        width: MediaQuery.of(context).size.width/1.6, 
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ApplicationColors.Secondary_900,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                          color: ApplicationColors.Secondary_100
                        ),
                        child: FractionallySizedBox (
                          widthFactor: 0.5,
                          heightFactor: 0.5,
                          child: SvgPicture.asset(
                            'assets/icons/check.svg',
                            color: ApplicationColors.Secondary_900),
                        ),
                      ),
                      onTap: (){
                        DateTime now = new DateTime.now();

                        if(widget.transaction_date == DateTime(now.year, now.month, now.day).millisecondsSinceEpoch) {
                          Map<String, Object> transactionMap = {
                            "envelope_id": widget.envelope_id,
                            "sub_envelope_id": widget.sub_envelope_id,
                            "transaction_date": widget.transaction_date,
                            "transaction_amount": widget.transaction_amount,
                            //"category": widget.category,
                            "notes": widget.notes,
                            "transaction_type": widget.transaction_type,
                            "account_id": widget.transaction_type,
                            "from_envelope_id": widget.from_envelope_id ?? 0,
                            "is_transfer": widget.is_transfer,
                            "from_sub_envelope_id": widget.from_sub_envelope_id ?? 0
                          };
                          TransactionRepo().saveNewTransaction(transactionMap);
                        } else {
                          Map<String, Object> scheduledTransactionMap = {
                            "envelope_id": widget.envelope_id,
                            "sub_envelope_id": widget.sub_envelope_id,
                            "scheduled_date": widget.transaction_date,
                            "transaction_amount": widget.transaction_amount,
                            //"category": widget.category,
                            "notes": widget.notes,
                            "transaction_type": widget.transaction_type,
                            "account_id": widget.transaction_type,
                            "from_envelope_id": widget.from_envelope_id ?? 0,
                            "is_transfer": widget.is_transfer,
                            "from_sub_envelope_id": widget.from_sub_envelope_id ?? 0,
                            "last_sync": DateTime.now().millisecondsSinceEpoch
                          };
                        ScheduledTransactionRepo().saveNewTransaction(scheduledTransactionMap);
                        }
                      },
                    )
                  ),

                  Flexible(
                    child: InkWell(
                      child: Container(                  
                        height: MediaQuery.of(context).size.height/15,
                        width: MediaQuery.of(context).size.width/1.6, 
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ApplicationColors.Red_300,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                          color: ApplicationColors.Red_100
                        ),
                        
                        child: FractionallySizedBox (
                          widthFactor: 0.5,
                          heightFactor: 0.5,
                          child: SvgPicture.asset(
                            'assets/icons/close.svg',
                            color: ApplicationColors.Red_300),
                        ),
                      ),
                    )
                  ),

                ],
              )
            ),    
          ],
        ),
      );
  }
}
