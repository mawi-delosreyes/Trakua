import 'package:flutter/material.dart';
import 'package:frontend/model/Accounts.dart';
import 'package:frontend/model/Wallet.dart';
import 'package:frontend/repository/AccountsRepo.dart';
import 'package:frontend/style/ApplicationColors.dart';


class WalletCardWidget extends StatefulWidget {
  final int selected;
  final int position;
  final List<Wallet> walletData;
  const WalletCardWidget({super.key, required this.position, required this.selected, required this.walletData});

  @override
  State<WalletCardWidget> createState() => _WalletCardWidget();
}

class _WalletCardWidget extends State<WalletCardWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ApplicationColors.Background,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: const BorderSide(
          color: ApplicationColors.Neutrals_200
        )
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6))),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: widget.selected==widget.position? ApplicationColors.Primary_500:ApplicationColors.Background,
              width: 10
              ),
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height/6,
            width: MediaQuery.of(context).size.width/1.3, 
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.walletData.elementAt(widget.position).wallet_name,
                    style: const TextStyle(
                      color: ApplicationColors.Primary_1000
                    ),
                  )
                ),

                FutureBuilder(
                  future: AccountsRepo().getAccounts(widget.walletData.elementAt(widget.position).wallet_id), 
                  builder: (BuildContext context, AsyncSnapshot<List<Accounts>> accountList) {
                    if (accountList.hasData) {
                      return ListView.separated(
                        itemCount: accountList.data!.length, 
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children:[
                              Text(accountList.data!.elementAt(index).account_name),
                              SizedBox(width: MediaQuery.of(context).size.width/5,),
                              Text(accountList.data!.elementAt(index).account_balance.toString() + " / " + accountList.data!.elementAt(index).account_total_balance.toString()),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => SizedBox(height: MediaQuery.of(context).size.height/60,),          
                      );
                    } else { return Container(); }
                  }
                )


              ],
            ),   
          ),
        ),
      ),
    );
  }
}
