import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tip_calculator/resultScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void calculator() {
    calTax = tax / 100;
    divisions = (double.parse(total) + tip + calTax) / friends;
  }

  int subTax = 0;

  double divisions = 0;
  double calTax = 0;
  int tip = 0;
  String total = '';

  TextEditingController taxController = TextEditingController();
  List buttonList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    '-'
  ];
  double friends = 0.0;
  int tax = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .01,
            ),
            const Text(
              "Bill Split",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * .01,
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: height * .26,
                width: width * .8,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * .025, horizontal: width * .1),
                  child: Row(
                    children: [
                      Container(
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 22),
                              ),
                              Text(
                                total,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Friends",
                                style: customStyle(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text('${friends.toInt()}',
                                    style: customStyle()),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text('Tax', style: customStyle()),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('${tax}%', style: customStyle()),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Tip", style: customStyle()),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text('\$$tip', style: customStyle()),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * .02),
              child: const Text(
                'How many friends',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.09),
              child: Slider(
                value: friends, // Initial value
                min: 0.0,
                max: 15.0,
                divisions:
                    15, // One division less than the maximum value to create 15 marks

                activeColor: Colors.orange, // Customize active track color
                inactiveColor: Colors.black, // Customize inactive track color
                thumbColor: Colors.orange, // Customize thumb color
                onChanged: (double value) {
                  setState(() {});
                  friends = value;
                  // Handle slider value changes (optional)
                  print('Selected value: $value');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.1,
                  width: width * 0.45,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tip',
                        style: customStyle(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: onAdd,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "\$$tip",
                            style: customStyle(),
                          ),
                          InkWell(
                            onTap: onRemove,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.1,
                  width: width * 0.45,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tax',
                        style: customStyle(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: onTaxAdd,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "$tax%",
                            style: customStyle(),
                          ),
                          InkWell(
                            onTap: onTaxRemove,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // Container(
                //     height: height * 0.1,
                //     width: width * 0.3,
                //     decoration: const BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.all(Radius.circular(10))),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),

                //       // Center(
                //       //     child: Column(
                //       //   children: [
                //       //     const Text(
                //       //       'Tax',
                //       //       style: TextStyle(
                //       //           color: Colors.white,
                //       //           fontWeight: FontWeight.bold,
                //       //           fontSize: 16),
                //       //     ),
                //       //     Text(
                //       //       tax,
                //       //       style: const TextStyle(
                //       //           color: Colors.white,
                //       //           fontWeight: FontWeight.bold,
                //       //           fontSize: 14),
                //       //     ),
                //       //   ],
                //       // )),
                //       child: TextField(
                //         onChanged: (value) {},
                //         controller: taxController,
                //         maxLines: null,
                //         expands: true,
                //         cursorColor: Colors.white,
                //         decoration: InputDecoration(
                //             hintText: "Tax in %",
                //             hintStyle: TextStyle(
                //               color: Colors.white,
                //               fontSize: 12,
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.white),
                //               borderRadius: BorderRadius.circular(15),
                //             )),
                //       ),
                //     ))
              ],
            ),
            SizedBox(
              height: height * .03,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [myButton("1"), myButton("2"), myButton("3")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [myButton("4"), myButton("5"), myButton("6")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [myButton("7"), myButton("8"), myButton("9")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myButton("."),
                      myButton("0"),
                      TextButton(
                          style: const ButtonStyle(
                              side: WidgetStatePropertyAll(
                                  BorderSide(style: BorderStyle.solid))),
                          onPressed: () {
                            setState(() {});
                            total = '';
                          },
                          child: const Center(
                            child: Text(
                              'C',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.03, horizontal: width * 0.08),
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                      side: WidgetStatePropertyAll(
                          BorderSide(style: BorderStyle.solid))),
                  onPressed: () {
                    calculator();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                              friends: friends,
                              tax: tax.toString(),
                              tip: tip,
                              totalBill: divisions),
                        ));
                  },
                  child: const Center(
                    child: Text(
                      "Split",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  TextButton myButton(String value) {
    return TextButton(
        style: const ButtonStyle(
            side: WidgetStatePropertyAll(BorderSide(style: BorderStyle.solid))),
        onPressed: () {
          setState(() {});

          total = total.toString() + value.toString();
        },
        child: Center(
          child: Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
        ));
  }

  void onTaxAdd() {
    tax++;
    setState(() {});
  }

  void onAdd() {
    tip++;
    setState(() {});
  }

  void onRemove() {
    tip--;
    setState(() {});
  }

  void onTaxRemove() {
    tax--;
    setState(() {});
  }
}

customStyle() {
  return TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
}
