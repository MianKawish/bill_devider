import 'package:flutter/material.dart';
import 'package:tip_calculator/homeScreen.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key,
      required this.friends,
      required this.tax,
      required this.tip,
      required this.totalBill});
  double totalBill;
  double friends;
  int tip;
  String tax;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: height * .26,
              width: width * .8,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * .025, horizontal: width * .15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Equally Divided",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22),
                        ),
                        Text(
                          totalBill.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22),
                        )
                      ],
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
                              child: Text(friends.toString(),
                                  style: customStyle()),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text('Tax', style: customStyle()),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text('$tax%', style: customStyle()),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("Tip", style: customStyle()),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(tip.toString(), style: customStyle()),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text("Eveybody should pay $totalBill",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black)),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.05, horizontal: width * 0.15),
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.orange),
                      side: WidgetStatePropertyAll(
                          BorderSide(style: BorderStyle.solid))),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: const Center(
                    child: Text(
                      "Calculate again?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
