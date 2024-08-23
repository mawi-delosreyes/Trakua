import 'package:flutter/material.dart';
import 'package:frontend/model/Wallet.dart';
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
                      ),)
                    ),
                  Row(
                    children: [
                      
                      // pie chart
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height/50,
                              width: MediaQuery.of(context).size.width/20,
                              child: Container(),
                            ),

                            Container(
                              height: MediaQuery.of(context).size.width/4.5,
                              width: MediaQuery.of(context).size.width/4.5,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ApplicationColors.Neutrals_300,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width/10,
                      child: Container(),
                    ),

                      // legend
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width/50,
                                width: MediaQuery.of(context).size.width/50,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ApplicationColors.Neutrals_300,
                                      width: 1,
                                    ),
                                    shape: BoxShape.circle
                                  ),
                                ),
                              ),
                              Text("Cash")
                            ],
                          ),

                          Row(
                            children: [
                              
                              Container(
                                height: MediaQuery.of(context).size.width/50,
                                width: MediaQuery.of(context).size.width/50,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ApplicationColors.Neutrals_300,
                                      width: 1,
                                    ),
                                    shape: BoxShape.circle
                                  ),
                                ),
                              ),
                              Text("Card")
                            ],
                          )

                        ],
                      )

                    ],
                  )
                ],
              ),   
            ),
          ),
        ),
      );
  }
}
