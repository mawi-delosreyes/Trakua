import 'package:flutter/material.dart';
import 'package:frontend/model/Wallet.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import '../widgets/WalletCards.dart';
import 'package:frontend/repository/WalletRepoImpl.dart';

class WalletScreen extends StatefulWidget {
  final int user_id;

  WalletScreen({
    Key? key,
    required this.user_id
  });

  @override 
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  int selectedIndex = -1;
  String addOrEdit = "add";

  @override
  Widget build(BuildContext context) {
    int user_id = widget.user_id;

    return MaterialApp(
        title: 'Chibao',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ApplicationColors.Background,
          body: Column(
            children: [
              Flexible (
                flex: 13,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/10,
                    ),
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        color: ApplicationColors.Primary_900,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ],
                )
              ),
              Flexible(
                flex: 50,
                child: FutureBuilder(
                  future: WalletRepoImpl().getWallets(), 
                  builder: (BuildContext context, AsyncSnapshot<List<Wallet>> walletList) {
                    print(walletList.hasData? walletList.data : "No data");
                    return Container();
                  }
                ),
                
                /*
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int position) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if(selectedIndex == position) {
                            position = -1;
                          }
                          
                          if(position == -1) {
                            addOrEdit = "add";
                          } else {
                            addOrEdit = "edit";
                          }
                
                          selectedIndex = position;
                        });
                      },
                      child: Container (
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/25, right: MediaQuery.of(context).size.width/25),
                        height: MediaQuery.of(context).size.height/5,
                        child: WalletCardWidget(position: position, selected: selectedIndex),
                      ) 
                    );
                  }
                )
                */
              ),
              Expanded(
                flex: 15,
                child: NavigationBar1(addOrEdit: addOrEdit)
              )
            ] 
          ),
        )
      );
  }
}
