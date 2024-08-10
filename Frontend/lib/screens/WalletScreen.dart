import 'package:flutter/material.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:frontend/widgets/NavigationBar1.dart';
import '../widgets/WalletCards.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override 
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  int selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chibao',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ApplicationColors.Background,
          body: new Column(
            children: [
              new Flexible (
                flex: 13,
                child: Container (
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
                )
              ),
              new Flexible(
                flex: 50,
                child: Container (
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int position) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
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
                )
              ),
              new Expanded(
                flex: 15,
                child: Container(
                  child: new NavigationBar1(),
                )
              )
            ] 
          ),
        )
      );
  }
}
