import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';


class WalletPopupWidget extends StatefulWidget {

  @override
  State<WalletPopupWidget> createState() => _WalletPopupWidget();
}

class _WalletPopupWidget extends State<WalletPopupWidget> {

  final _walletNameController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _amountController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
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

            Text("New Wallet"),

            SizedBox(
              height: MediaQuery.of(context).size.height/50,
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
                    child: TextField(
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
                    child: TextField(
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
                        text: "Swipe to Save",
                        textStyle: const TextStyle(
                          color: ApplicationColors.Primary
                        ),
                        onSubmit: () {
                          Navigator.of(context).pop();
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
