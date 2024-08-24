import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/model/Accounts.dart';
import 'package:frontend/model/Wallet.dart';
import 'package:frontend/repository/AccountsRepo.dart';
import 'package:frontend/repository/WalletRepo.dart';
import 'package:frontend/screens/WalletScreen.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';


class AddWalletPopupWidget extends StatefulWidget {

  var wallet_id;
  int user_id;
  AddWalletPopupWidget({Key? key, required this.user_id}) : super(key: key);


  @override
  State<AddWalletPopupWidget> createState() => _AddWalletPopupWidget();
}

class _AddWalletPopupWidget extends State<AddWalletPopupWidget> {

  final _walletNameController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _amountController = TextEditingController();

  @override  
  Widget build(BuildContext contxt) {
    return Dialog(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(
          color: ApplicationColors.Neutrals_200
        )
      ),
      backgroundColor: ApplicationColors.Background,
      child: Container(
        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width/1.1,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 20, top: 10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height/20,
                  width: MediaQuery.of(context).size.width/20,
                  child: SvgPicture.asset(
                    'assets/icons/close.svg',
                    color: ApplicationColors.Red_300),
                ),
              ),
            ),

            Text("New Wallet"),

            SizedBox(
              height: MediaQuery.of(context).size.height/30,
            ),
            
            Container(
              height: MediaQuery.of(context).size.height/3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Container (
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/1.5,            
                    child: TextField(
                      decoration: const InputDecoration(
                        fillColor: ApplicationColors.Base_White,
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Wallet Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ApplicationColors.Neutrals_300
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                                color: ApplicationColors.Secondary_900,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: ApplicationColors.Primary_900
                        ),
                      ),
                      controller: _walletNameController,
                      style: const TextStyle(color: ApplicationColors.Primary_900),
                    ),
                  ),

                  Container (
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/1.5,            
                    child: TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(250, 250, 250, 1),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Account Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ApplicationColors.Neutrals_300
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                                color: ApplicationColors.Secondary_900,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: ApplicationColors.Primary_900
                        ),
                      ),
                      controller: _accountNameController,
                      style: const TextStyle(color: ApplicationColors.Primary_900),
                    ),
                  ),

                  Container (
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/1.5,            
                    child: TextFormField(
                      decoration: const InputDecoration(
                        fillColor: ApplicationColors.Base_White,
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Amount",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ApplicationColors.Neutrals_300
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                                color: ApplicationColors.Secondary_900,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: ApplicationColors.Primary_900
                        ),
                      ),
                      controller: _amountController,
                      style: const TextStyle(color: ApplicationColors.Primary_900),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/70,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/1.5,  
                    child: Center(
                      child: SlideAction(
                        sliderRotate: false,
                        sliderButtonIconSize: MediaQuery.of(context).size.height/35,
                        sliderButtonIcon: const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: ApplicationColors.Secondary_100,
                        ),
                        sliderButtonIconPadding: 0,
                        borderRadius: 8,
                        elevation: 0,
                        innerColor: ApplicationColors.Primary,
                        outerColor: ApplicationColors.Secondary_100,
                        text: "Swipe to Create",
                        textStyle: const TextStyle(
                          color: ApplicationColors.Primary
                        ),
                        onSubmit: () async {

                          if(widget.wallet_id == null) {
                            Map<String, Object> walletMap = {
                              "user_id": 1,
                              "wallet_name": _walletNameController.text,
                              "last_sync": DateTime.now().millisecondsSinceEpoch
                            };
                            int wallet_id = await WalletRepo().saveNewWallet(walletMap);
                            
                            Map<String, Object> accountMap = {
                              "wallet_id": wallet_id,
                              "account_name": _accountNameController.text,
                              "account_balance": _amountController.text,
                              "last_sync": DateTime.now().millisecondsSinceEpoch
                            };

                            AccountsRepo().saveNewAccount(accountMap);
                          } else {

                            Map<String, Object> walletMap = {
                              "wallet_id": widget.wallet_id,
                              "user_id": 1,
                              "wallet_name": _walletNameController.text,
                              "last_sync": DateTime.now().millisecondsSinceEpoch
                            };
                            int wallet_id = await WalletRepo().updateExistingWallet(walletMap);
                          }
          
                          Navigator.push(
                            context, 
                            new MaterialPageRoute(builder: (context) => WalletScreen(user_id: widget.user_id,))
                          );
                        },
                      ),
                    )
                  )
                ],
              )
            )

          ],
        ),
      ),
    );
  }
}


class EditWalletPopupWidget extends StatefulWidget {


  int wallet_id;
  int user_id;
  EditWalletPopupWidget({Key? key, required this.user_id, required this.wallet_id}) : super(key: key);


  @override 
  State<EditWalletPopupWidget> createState() => _EditWalletPopupWidget();
}

class _EditWalletPopupWidget extends State<EditWalletPopupWidget> {

  Map<int, int> updateAccountIdx = Map();

  List<TextEditingController> _accountNameControllerList = [];
  List<TextEditingController> _amountControllerList = [];
  List updatedControllers = [];
  bool updateWalletName = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WalletRepo().getSpecificWallet(widget.wallet_id), 
        builder: (BuildContext context, AsyncSnapshot<List<Wallet>> walletInfo) {
          
          final _walletNameController = TextEditingController(text: (walletInfo.data==null? "": walletInfo.data!.first.wallet_name) as String);

          return Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            backgroundColor: ApplicationColors.Background,
            child: Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width/1.1,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(right: 20, top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height/20,
                        width: MediaQuery.of(context).size.width/20,
                        child: SvgPicture.asset(
                          'assets/icons/close.svg',
                          color: ApplicationColors.Red_300),
                      ),
                    ),
                  ),

                  const Text("Edit Wallet"),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/50,
                  ),
                  
                  Container(
                    height: MediaQuery.of(context).size.height/3.2,
                    child: Column(
                      children: [

                        SizedBox (
                          height: MediaQuery.of(context).size.height/20,
                          width: MediaQuery.of(context).size.width/1.5,            
                          child: TextFormField(
                            decoration: const InputDecoration(
                              fillColor: ApplicationColors.Base_White,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: "Wallet Name",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ApplicationColors.Neutrals_300
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                      color: ApplicationColors.Secondary_900,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: ApplicationColors.Primary_900
                              ),
                            ),
                            controller: _walletNameController,
                            style: const TextStyle(color: ApplicationColors.Primary_900),
                            onChanged: (value) => updateWalletName = true,
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height/70,
                        ),

                        FutureBuilder(
                          future: AccountsRepo().getAccounts(widget.wallet_id), 
                          builder: (BuildContext context, AsyncSnapshot<List<Accounts>> accountList) {
                            if(accountList.hasData) {

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: accountList.data!.length,
                                itemBuilder:(BuildContext context, int index) {
                                  _accountNameControllerList = List.filled(accountList.data!.length, TextEditingController(text: accountList.data!.elementAt(index).account_name as String));
                                  _amountControllerList = List.filled(accountList.data!.length, TextEditingController(text: accountList.data!.elementAt(index).account_balance.toString()));

                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height/20,
                                        width: MediaQuery.of(context).size.width/2.7,            
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            fillColor: ApplicationColors.Base_White,
                                            filled: true,
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            labelText: "Account Name",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ApplicationColors.Neutrals_300
                                              )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                    color: ApplicationColors.Secondary_900,
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: ApplicationColors.Primary_900
                                            ),
                                          ),
                                          style: const TextStyle(color: ApplicationColors.Primary_900),
                                          controller: _accountNameControllerList.elementAt(index),
                                          onChanged:(value){
                                            if(updateAccountIdx[index] == null) {
                                              updateAccountIdx[index] = accountList.data!.elementAt(index).account_id;
                                            }
                                          }
                                        )
                                      ),

                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/60,
                                      ),

                                      Container(
                                        height: MediaQuery.of(context).size.height/20,
                                        width: MediaQuery.of(context).size.width/3.5,            
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            fillColor: ApplicationColors.Base_White,
                                            filled: true,
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            labelText: "Amount",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ApplicationColors.Neutrals_300
                                              )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                    color: ApplicationColors.Secondary_900,
                                              ),
                                            ),
                                            labelStyle: TextStyle(
                                              color: ApplicationColors.Primary_900
                                            ),
                                          ),
                                          style: const TextStyle(color: ApplicationColors.Primary_900),
                                          controller: _amountControllerList.elementAt(index),
                                          onChanged:(value) {
                                            if(updateAccountIdx[index] == null) {
                                              updateAccountIdx[index] = accountList.data!.elementAt(index).account_id;
                                            }
                                          }
                                        )
                                      )
                                    ],
                                  );
                                }
                              );
                            } else {
                              return Container();
                            }
                          }
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/70,
                  ),

                  Container(
                    padding: EdgeInsets.zero,
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/1.5,  
                    child: Center(
                      child: SlideAction(
                        sliderRotate: false,
                        sliderButtonIconSize: MediaQuery.of(context).size.height/35,
                        sliderButtonIcon: const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: ApplicationColors.Secondary_100,
                        ),
                        sliderButtonIconPadding: 0,
                        borderRadius: 8,
                        elevation: 0,
                        innerColor: ApplicationColors.Primary,
                        outerColor: ApplicationColors.Secondary_100,
                        text: "Swipe to Update",
                        textStyle: const TextStyle(
                          color: ApplicationColors.Primary
                        ),
                        onSubmit: () async {
                          
                          if(updateWalletName) {
                            Map<String, Object> walletMap = {
                              "wallet_id": widget.wallet_id,
                              "user_id": 1,
                              "wallet_name": _walletNameController.text,
                              "last_sync": DateTime.now().millisecondsSinceEpoch
                            };
                            WalletRepo().updateExistingWallet(walletMap);
                          }

                          updateAccountIdx.forEach((index, acc_id) {
                            Map<String, Object> accountMap = {
                              "account_id": acc_id,
                              "wallet_id": widget.wallet_id,
                              "account_name": _accountNameControllerList.elementAt(index).text,
                              "account_balance": _amountControllerList.elementAt(index).text,
                              "last_sync": DateTime.now().millisecondsSinceEpoch
                            };
                            AccountsRepo().updateExistingAccount(accountMap);
                          });

                          Navigator.push(
                            context, 
                            new MaterialPageRoute(builder: (context) => WalletScreen(user_id: widget.user_id,))
                          );
                        },
                      ),
                    )
                  )
                ],
              ),
            ),
          );

        }
    );
  }
}