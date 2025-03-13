import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertino extends StatefulWidget {
  const CurrencyConverterCupertino({super.key});

  @override
  State<CurrencyConverterCupertino> createState() =>
      _CurrencyConverterCupertinoState();
}

class _CurrencyConverterCupertinoState
    extends State<CurrencyConverterCupertino> {
  double conversionRate = 289.15;
  double result = 0;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey,
        middle: Text(
          "Currency Converter",
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(CupertinoIcons.flame_fill, color: CupertinoColors.black),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Text(
                " PKR ${result != 0 ? result : 0}",
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10.0),
              child: CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 16,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                placeholder: "Please enter the amount in USD",
                prefix: const Icon(
                  CupertinoIcons.money_dollar,
                  color: CupertinoColors.black,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: CupertinoButton(
                onPressed: () {
                  setState(() {
                    double calculatedResult =
                        double.parse(textEditingController.text) *
                        conversionRate;
                    result = double.parse(calculatedResult.toStringAsFixed(2));
                  });
                },
                color: CupertinoColors.black,
                sizeStyle: CupertinoButtonSize.large,
                borderRadius: BorderRadius.circular(60),
                child: const Text(
                  "Convert",
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
