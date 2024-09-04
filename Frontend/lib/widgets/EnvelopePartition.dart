import 'package:flutter/material.dart';
import 'package:frontend/model/Accounts.dart';
import 'package:frontend/model/Transactions.dart';
import 'package:frontend/model/Wallet.dart';
import 'package:frontend/repository/AccountsRepo.dart';
import 'package:frontend/repository/TransactionRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:flutter_svg/flutter_svg.dart';


class EnvelopePartitionWidget extends StatefulWidget {

  String envelope_name;
  double envelope_amount_left;
  double envelope_total_amount;

  EnvelopePartitionWidget(
    {Key? key, 
      required this.envelope_name, 
      required this.envelope_amount_left,
      required this.envelope_total_amount
    }
  ) : super(key: key);

  @override
  State<EnvelopePartitionWidget> createState() => _EnvelopePartitionWidget();

}

class _EnvelopePartitionWidget extends State<EnvelopePartitionWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 3,
      width: 10,
      decoration: BoxDecoration(
        border: Border.all(color: ApplicationColors.Primary_1000),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: ApplicationColors.Primary_100
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          // info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.envelope_name),
                  Text(widget.envelope_amount_left.toString() + " / " + widget.envelope_total_amount.toString())
                ],
              ),

              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      height: MediaQuery.of(context).size.height/40,
                      width: MediaQuery.of(context).size.width/20,
                      child: SvgPicture.asset(
                        'assets/icons/edit.svg',
                        color: ApplicationColors.Secondary),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      height: MediaQuery.of(context).size.height/40,
                      width: MediaQuery.of(context).size.width/20,
                      child: SvgPicture.asset(
                        'assets/icons/delete.svg',
                        color: ApplicationColors.Base_Red),
                    ),
                  ),
                ],
              )
            ]
          ), 
          
          SizedBox(height: MediaQuery.of(context).size.height/40,),

          //Row
          FutureBuilder(
            future: TransactionRepo().getSortedSubEnvelopeTransactionAmount(), 
            builder: (BuildContext context, AsyncSnapshot<List<Transactions>> sortedTransactionList) {
              if(sortedTransactionList.hasData){
                return Container(
                  height: MediaQuery.of(context).size.height/6,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: sortedTransactionList.data!.length,
                    itemBuilder: (BuildContext context, int index) => 
                      Row(
                        children: <Widget>[
                          Text(sortedTransactionList.data!.elementAt(index).sub_envelope_name),
                          Text(sortedTransactionList.data!.elementAt(index).transaction_amount.toString()),
                        ],
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
    );
  }
}