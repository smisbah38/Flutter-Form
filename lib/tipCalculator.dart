import 'package:flutter/material.dart';
import 'package:form/Widgets/simpleInputField.dart';

class tipCalculator extends StatefulWidget {
  const tipCalculator({super.key});

  @override
  State<tipCalculator> createState() => _tipCalculatorState();
}

class _tipCalculatorState extends State<tipCalculator> {
  final formKey = GlobalKey<FormState>();
  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  static const Color containerColor = Color(0xffF5F8F8);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);

  double totalBill(){
    return double.parse(totalBillController.text)+(double.parse(totalBillController.text)*(double.parse(totalTipController.text)/100));
  }
  double tipAmount(){
   return double.parse(totalBillController.text) * (double.parse(totalTipController.text)/100);
  }
  double amountPerPerson(){
    return totalBill()/double.parse(totalPeopleController.text);
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Tip Calculator",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w600)
                            ),
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height - 120,
              child: Column(
                  children: [
                    ///This is the top Section
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text("Total Bill",style: TextStyle(color: textLightBlack),),
                          Text("\$ ${totalBill()}", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: textBlack),),


                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Persons",style: TextStyle(color: textLightBlack),),
                              Text("Tip Amount",style: TextStyle(color: textLightBlack),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(totalPeopleController.text, style: TextStyle(fontSize:16,fontWeight:FontWeight.w700,color: textBlack),),
                              Text("\$ ${tipAmount()}",style: TextStyle(fontSize:16,fontWeight:FontWeight.w700,color: textBlack),),
                            ],
                          )
                        ],
                      ),
                    ),

                    ///Padding of 10 px space
                    const SizedBox(height: 10),

                    ///Per person amount section
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Amount Per Person",style: TextStyle(color: textLightBlack),),
                          Text("\$ ${amountPerPerson()}",style: TextStyle(fontSize:16,fontWeight:FontWeight.w700,color: textBlack),),

                        ],
                      ),
                    ),
                       Spacer(),
                    // SizedBox(height: size.height*0.27,),
                    simpleInputField(
                        controller: totalBillController,
                        title: "Total bill",
                        hintText: "Please enter total bill amount",
                        iconData: Icons.attach_money,
                    ),
                    simpleInputField(
                        controller: totalTipController,
                        title: "Tip Percentage",
                        hintText: "Please enter tip percentage",
                        iconData: Icons.percent,
                    ),
                    simpleInputField(
                        controller: totalPeopleController,
                        title: "Number of people",
                        hintText: "Please enter total number"
                    ),


                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                formKey.currentState!.validate();
                              });

                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              alignment: Alignment.center,
                              child: const Text("Calculate", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                            decoration: BoxDecoration(
                                color: clearButtonColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Text("Clear", style: TextStyle(color: Colors.white),),
                          ),
                        )
                      ],
                    )



                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
