import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});
  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

//the stateful class (mutable state of the immutable class currencyconverter)
class _CurrencyConverterState extends State<CurrencyConverter> {
  double conversionRate = 289.15;
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() { //this is used for initialzing the values
    super.initState(); //must be the first thing inside the initState() fn
  }

  @override
  void dispose() { //used for disposing resources like controllers to prevent the memory leaks
    textEditingController.dispose();

    super.dispose(); //must be the last thing in the dispose() function
  }

  @override
  Widget build(BuildContext context) {
    final enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(60),
    );
    final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(60),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Currency Converter",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle:
            true, //puts title in center of bar on every device (default for IOS only)
        leading: Icon(Icons.money, size: 35),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child:  Text(
                " PKR ${result != 0 ? result : 0}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                  hintText: "Please enter the amount in PKR",
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    double calculatedResult = double.parse(textEditingController.text) * conversionRate;
                    result = double.parse(calculatedResult.toStringAsFixed(2));
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: Size(250, 50),
                ),
                child: const Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
