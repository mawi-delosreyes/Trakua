import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/style/ApplicationColors.dart';


class WalletCardWidget extends StatefulWidget {
  final int selected;
  final int position;
  const WalletCardWidget({super.key, required this.position, required this.selected});

  @override
  State<WalletCardWidget> createState() => _WalletCardWidget();
}

class _WalletCardWidget extends State<WalletCardWidget> {

  

  @override
  Widget build(BuildContext context) {
    
      return Card(
        elevation: 0,
        child: ClipPath(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: widget.selected==widget.position? ApplicationColors.Primary_500:ApplicationColors.Background,
                width: 10
                ),
              ),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height/6,
              width: MediaQuery.of(context).size.width/1.3, 
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Cash")
                    ),
                  Row(
                    children: [

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
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      );
  }
}
