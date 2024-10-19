import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/repository/SubEnvelopeRepo.dart';
import 'package:frontend/screens/CreateEnvelopeScreen.dart';
import 'package:frontend/style/ApplicationColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';


class CreateSubEnvelopePopupWidget extends StatefulWidget {

  var wallet_id;
  int user_id;
  CreateSubEnvelopePopupWidget({Key? key, required this.user_id}) : super(key: key);


  @override
  State<CreateSubEnvelopePopupWidget> createState() => _CreateSubEnvelopePopupWidget();
}

class _CreateSubEnvelopePopupWidget extends State<CreateSubEnvelopePopupWidget> {

  final _subEnvelopeNameController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  bool roll_over = false;
  bool manual_topup = false;
  final _scheduleTopupDateController = TextEditingController();
  final _scheduleTopupAmountController = TextEditingController();

  List<String> categoryList = ["Wants", "Needs", "Savings"];


  @override  
  Widget build(BuildContext contxt) {

    String dropdownValue = categoryList.first;
    var formatter = DateFormat('yyyy/MM/dd');
    var topupDate = formatter.format(DateTime.now());

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
        height: MediaQuery.of(context).size.height/1.5,
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

            Text(
              "Create Sub-Envelope",
              style: GoogleFonts.figtree(
                fontWeight: FontWeight.bold,
                color: ApplicationColors.Primary_900,
                fontSize: 15
              ),  
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height/30,
            ),
            
            Container(
              height: MediaQuery.of(context).size.height/2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Container (
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/1.5,            
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: ApplicationColors.Base_White,
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Sub-Envelope Name",
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
                        labelStyle: GoogleFonts.figtree(
                          fontWeight: FontWeight.w600,
                          color: ApplicationColors.Primary_900,
                          fontSize: 15
                        ),
                      ),
                      controller: _subEnvelopeNameController,
                      style: const TextStyle(color: ApplicationColors.Primary_900),
                    ),
                  ),

                  Container (
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/1.5,            
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(250, 250, 250, 1),
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
                        labelStyle: GoogleFonts.figtree(
                          fontWeight: FontWeight.w600,
                          color: ApplicationColors.Primary_900,
                          fontSize: 15
                        ),
                      ),
                      controller: _amountController,
                      style: const TextStyle(color: ApplicationColors.Primary_900),
                    ),
                  ),

                  Container (
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/1.5,            
                    child: DropdownButtonFormField (
                      iconEnabledColor: ApplicationColors.Primary_900,
                      decoration: InputDecoration(
                        fillColor: ApplicationColors.Base_White,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Category",
                        hintText: categoryList.first,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ApplicationColors.Neutrals_300
                          )
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ApplicationColors.Secondary_900,
                          ),
                        ),
                        labelStyle: GoogleFonts.figtree(
                          fontWeight: FontWeight.w600,
                          color: ApplicationColors.Primary_900,
                          fontSize: 15
                        ),
                      ),
                      value: dropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: categoryList.map((String value) {
                          return DropdownMenuItem(value: value, child: Text(value, style: const TextStyle(color: ApplicationColors.Primary_900),));
                        }).toList(),
                    )
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/13),
                          child: Text(
                            "Schedule Top Up",
                            style: GoogleFonts.figtree(
                                fontWeight: FontWeight.w600,
                                color: ApplicationColors.Primary_900,
                                fontSize: 13
                            ),  
                          ),
                        ),
                        
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/13, bottom: 0),
                          child: Row(  
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height/20,
                                width: MediaQuery.of(context).size.width/3.3, 
                                padding: EdgeInsets.only(top: 10),
                                margin: EdgeInsets.only(bottom: 0),
                                child: TextFormField(
                                  key: Key(topupDate.toString()),
                                  initialValue: topupDate.toString(),
                                  decoration: InputDecoration(
                                    fillColor: ApplicationColors.Base_White,
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    suffixIconConstraints: BoxConstraints(
                                      minWidth: MediaQuery.of(context).size.width/15, 
                                      minHeight: MediaQuery.of(context).size.height/15, 
                                    ),
                                    suffixIcon: IconButton(
                                      icon: SvgPicture.asset('assets/icons/calendar.svg'),
                                      onPressed: () => showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2015, 8),
                                        lastDate: DateTime(2101),
                                        ).then((value) => {
                                          if (value != null) {
                                            setState(() {
                                                topupDate = '${value.year.toString()}/${value.month.toString()}/${value.day.toString()}';
                                              })
                                          }
                                        }),
                                    ),                            
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    labelText: "Date",
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ApplicationColors.Neutrals_300
                                      )
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                            color: ApplicationColors.Secondary_900,
                                      ),
                                    ),
                                    labelStyle: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: ApplicationColors.Primary_900,
                                      fontSize: 13
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: ApplicationColors.Primary_900,
                                    fontSize: 11
                                  ),
                                  readOnly: !manual_topup,
                                ),
                              ),
                              Container (
                                height: MediaQuery.of(context).size.height/20,
                                width: MediaQuery.of(context).size.width/2.9,    
                                padding: EdgeInsets.only(top: 10, left: 10, bottom: 0),
                                margin: EdgeInsets.only(bottom: 0),
        
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: ApplicationColors.Base_White,
                                    filled: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    labelText: "Amount",
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ApplicationColors.Neutrals_300
                                      )
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ApplicationColors.Secondary_900,
                                      ),
                                    ),
                                    labelStyle: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: ApplicationColors.Primary_900,
                                      fontSize: 13
                                    ),
                                  ),
                                  style: const TextStyle(color: ApplicationColors.Primary_900),
                                  readOnly: !manual_topup,
                                ),
                              ),                              
                            ],
                          ) 
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 40),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height/50,
                                width: MediaQuery.of(context).size.width/5, 
                                child: Text(
                                  "Manual Top Up",
                                  style: GoogleFonts.roboto(
                                    color: ApplicationColors.Primary_1000,
                                    fontSize: 10
                                  ),
                                ),
                              ),
                              
                              Container(
                                height: MediaQuery.of(context).size.height/50,
                                child: Transform.scale(
                                  scale: 0.5,
                                  child: CupertinoSwitch(
                                  activeColor: ApplicationColors.Primary,
                                  value: manual_topup, 
                                  onChanged: (bool value) {
                                    setState(() {
                                      manual_topup = value;
                                    });
                                  })
                                )                          
                              )
                            ],
                          ),
                        ),      
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/12),

                    child: Row(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height/50,
                          width: MediaQuery.of(context).size.width/5, 
                          child: Text(
                            "Roll Over to Next Month",
                            style: GoogleFonts.figtree(
                              fontWeight: FontWeight.w600,
                              color: ApplicationColors.Primary_900,
                              fontSize: 13
                            ),
                          ),
                        ),
                        
                        Container(
                          height: MediaQuery.of(context).size.height/50,
                          child: Transform.scale(
                            scale: 0.5,
                            child: CupertinoSwitch(
                            activeColor: ApplicationColors.Primary,
                            value: roll_over, 
                            onChanged: (bool value) {
                              setState(() {
                                roll_over = value;
                              });
                            })
                          )
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/100,
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10),
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
                        textStyle: GoogleFonts.figtree(
                          fontWeight: FontWeight.bold,
                          color: ApplicationColors.Primary,
                          fontSize: 13
                        ),  

                        onSubmit: () async {
                          Map<String, Object> subEnvelopeMap = {
                            "sub_envelope_name": _subEnvelopeNameController.text,
                            "sub_envelope_total_balance": _amountController.text,
                            "sub_envelope_balance": 0,
                            "envelope_id": 2,
                            "category": dropdownValue,
                            "roll_over": roll_over ? 1:0,
                            "last_sync": DateTime.now().millisecondsSinceEpoch
                          };

                          SubEnvelopeRepo().saveNewSubEnvelope(subEnvelopeMap);
                          Navigator.push(
                            context, 
                            new MaterialPageRoute(builder: (context) => CreateEnvelopeScreen(user_id: widget.user_id,))
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