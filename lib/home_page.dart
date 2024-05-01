import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController billAmtController=TextEditingController();

  int perCount=1;
  int tipPercent = 0;
  num totalBillAmt = 0.0;
  num totalTipAmt = 0.0;
  num totalAmt = 0.0;
  num perPersonAmt = 0.0;
  bool isCustomTip = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F3F4),
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                  child: getTitlePart1()),
              Expanded(
                flex: 6,
                  child: getTipBoardPart2()),
              Expanded(
                flex: 3,
                  child: getEnterBillPart3()),
              Expanded(
                flex: 4,
                  child: getTipPart4()),

              Expanded(
                flex: 3,
                  child:getTotalPart5(),
        ),
    ]
      ),
    ),
          ),
    );
  }

  ///.... Part 1
  Widget getTitlePart1(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.jpeg",width: 60,height: 60,),
        SizedBox(
          width: 11,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
                TextSpan(
                    text: "Mr",
                    style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children:[
                      TextSpan(text: "TIP",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w900))
                    ]

                )),
            Text('Calculator',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16),)
          ],
        )
      ],
    );
  }

  ///.... Part 2
  Widget getTipBoardPart2(){
    return Card(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Total p/person',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16),),
              Text.rich(
                  TextSpan(
                      text: "\$",
                      style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                      children:[
                        TextSpan(text: "${perPersonAmt==0.0 ? "000" : perPersonAmt.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 47,
                                fontWeight: FontWeight.w900))
                      ]

                  )),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Total bill',
                        style: TextStyle(
                            fontSize: 16),),
                      Text.rich(
                          TextSpan(
                              text: "\$",
                              style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF03C9BD),
                              ),
                              children:[
                                TextSpan(text: "${totalBillAmt==0.0 ? "000" : totalBillAmt.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF03C9BD),
                                    )),
                              ]

                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Total tip',
                        style: TextStyle(
                            fontSize: 16),),
                      Text.rich(
                          TextSpan(
                              text: "\$",
                              style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF03C9BD),
                              ),
                              children:[
                                TextSpan(text: "${totalTipAmt==0.0 ? "000" : totalTipAmt.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF03C9BD),
                                    )),
                              ]

                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      elevation: 7,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
      ),
    );
  }

  ///.... Part 3
  Widget getEnterBillPart3(){
    return Row(
      children: [
        Expanded(
            child: Text.rich(
              TextSpan(
                text: "Enter\n",
                style: TextStyle(fontSize: 21,
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  TextSpan(text: "your bill",
                      style: TextStyle(fontSize: 21,
                          fontWeight: FontWeight.w400
                      )),
                ],
              ),
            ) ),
        Expanded(
            flex: 3,
            child: TextField(
              controller: billAmtController ,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixText: "\$",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        color: Colors.white,
                        width: 1,
                      )
                  )
              ),
            ) ),
      ],
    );
  }

  ///.... Part 4
  Widget getTipPart4(){
    return Row(
      children: [
        Expanded(
            child: Text.rich(TextSpan(
                text: "Choose\n",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900
                ),
                children: [
                  TextSpan(
                      text: "your tip",
                      style: TextStyle(fontSize: 21,
                          fontWeight: FontWeight.w400))
                ]))),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: (){
                            tipPercent = 10;
                            updateTheResult();
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFF03C9BD),
                            ),
                            child:Center(
                              child: Text.rich(
                                  TextSpan(
                                      text: "10",
                                      style: TextStyle(fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      children:[
                                        TextSpan(text: "%",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400))
                                      ]
                          
                                  )),
                            ),
                          
                          ),
                        )),
                        SizedBox(width: 11,),
                        Expanded(child: InkWell(
                          onTap: (){
                            tipPercent = 15;
                            updateTheResult();
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFF03C9BD),
                            ),
                            child:Center(
                              child: Text.rich(
                                  TextSpan(
                                      text: "15",
                                      style: TextStyle(fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      children:[
                                        TextSpan(text: "%",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400))
                                      ]

                                  )),
                            ),

                          ),
                        )),
                        SizedBox(width: 11,),
                        Expanded(child: InkWell(
                          onTap: (){
                            tipPercent = 20;
                            updateTheResult();
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFF03C9BD),
                            ),
                            child:Center(
                              child: Text.rich(
                                  TextSpan(
                                      text: "20",
                                      style: TextStyle(fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      children:[
                                        TextSpan(text: "%",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400))
                                      ]

                                  )),
                            ),

                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(

                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Stack(
                      children: [
                        TextField(

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixText: "\%",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                    color: Colors.white,
                                    width: 1,
                                  )
                              )
                          ),
                        ),
                        isCustomTip ? Container() : InkWell(
                          onTap: (){
                            isCustomTip = true;
                            setState(() {

                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFF03C9BD),
                            ),
                            child: Center(
                              child: Text("Custom Tip",style:TextStyle(fontSize: 21,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              )),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  ///.... Part 5
 Widget getTotalPart5(){
    return  Row(
        children: [
          Expanded(
              child: Text.rich(TextSpan(
                  text: "Split\n",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w900
                  ),
                  children: [
                    TextSpan(
                        text: "the total",
                        style: TextStyle(fontSize: 21,
                            fontWeight: FontWeight.w400))
                  ]))),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 11),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: (){
                          if(perCount>1) {
                            perCount--;
                            updateTheResult();
                          }
                        },
                        child: Container(
                                            decoration: BoxDecoration(
                          color: Color(0xFF03C9BD),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft:Radius.circular(16) )
                                            ),
                                            child: Center(
                        child: Text('-',style: TextStyle(fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),),
                                            ),
                                          ),
                      ) ),
                  Expanded(
                      flex: 4,
                      child: Container(
                      color: Colors.white,
                        child: Center(
                          child: Text('$perCount',style: TextStyle(fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),),
                        ),
                      ) ),
                  Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: (){
                          perCount++;
                          updateTheResult();
                        },
                        child: Container(
                                            decoration: BoxDecoration(
                          color: Color(0xFF03C9BD),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight:Radius.circular(16) )
                                            ),
                                            child: Center(
                        child: Text('+',style: TextStyle(fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),),
                                            ),
                                          ),
                      ) )
                ],
              ),
            ),
          )
        ],
      );
 }



 /// ....  Calculation Tip Result

    void updateTheResult(){

    if(billAmtController.text!=""){
      totalBillAmt = double.parse(billAmtController.text.toString());
      totalTipAmt = totalBillAmt*(tipPercent/100);
      totalAmt = totalBillAmt + totalTipAmt;
      perPersonAmt = totalAmt/perCount;

      setState(() {

      });

    }else{
      perCount = 1;
    }

    }
}
