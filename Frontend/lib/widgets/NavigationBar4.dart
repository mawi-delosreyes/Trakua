import 'package:flutter/material.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBar4 extends StatefulWidget {
  var envelope_name;
  
  NavigationBar4({Key? key, this.envelope_name});

  @override
  State<NavigationBar4> createState() => _NavigationBar4State();
}

class _NavigationBar4State extends State<NavigationBar4> {
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
                        print(widget.envelope_name.text);
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
