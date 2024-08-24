import 'package:flutter/material.dart';
import 'package:frontend/style/ApplicationColors.dart';
import './WalletPopup.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBar1 extends StatefulWidget {
  final String addOrEdit;
  var wallet_id;
  final int user_id;
  
  NavigationBar1({Key? key, required this.addOrEdit, this.wallet_id, required this.user_id}) : super(key: key);

  @override
  State<NavigationBar1> createState() => _NavigationBar1State();
}

class _NavigationBar1State extends State<NavigationBar1> {

  @override
  Widget build(BuildContext context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.4,
              child: Container(
                height: 10,
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
                          'assets/icons/user.svg',
                          color: ApplicationColors.Primary_900
                          )
                      ),
                    ),

                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.4,
                        child: SvgPicture.asset(
                          'assets/icons/wallet.svg',
                          color: ApplicationColors.Primary_900
                          )
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ApplicationColors.Primary_900,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(101.52)),
                  color: ApplicationColors.Primary_100
                ),
              ),
            )
          ),

          Flexible (
            child: FractionallySizedBox(
              widthFactor: 0.4,
              heightFactor: 0.4,
              child: 
                InkWell(
                  onTap: () {
                    if (widget.wallet_id == null) {
                      showDialog(
                        barrierColor: ApplicationColors.Background_90Opacity,
                        context: context,
                        builder: (context) => AddWalletPopupWidget(user_id: widget.user_id),
                      );
                    } else {
                      showDialog(
                        barrierColor: ApplicationColors.Background_90Opacity,
                        context: context,
                        builder: (context) => EditWalletPopupWidget(user_id: widget.user_id, wallet_id: widget.wallet_id),
                      );
                    }     
                  },  
                  child: Container(
                      child: FractionallySizedBox (
                        widthFactor: 0.5,
                        heightFactor: 0.5,
                        child: SvgPicture.asset(
                          widget.addOrEdit.contains("add") ? 'assets/icons/plus.svg' : 'assets/icons/edit.svg',
                          color: ApplicationColors.Secondary_900),
                      ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ApplicationColors.Secondary_900,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                      color: ApplicationColors.Secondary_100
                    ),
                  )
              ),
            )
          )
        ]
      );
      
  }
}
