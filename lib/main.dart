import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Currency Converter",
    home: SIForm(),
    theme: ThemeData(
        primaryColor: Colors.indigo, accentColor: Colors.indigoAccent),
  ));
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _currency = ['DKK', 'USD', 'EURO'];
  final _minimumPadding = 5.0;
  var _currentItemSelected = "";
  var _currentConvertValueSelected = "";

  @override
  void initState(){
    super.initState();
    _currentItemSelected = _currency[0];
    _currentConvertValueSelected = _currency[1];
  }

  TextEditingController currencyController = TextEditingController();
  var displayText = "";

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Currency Converter"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            getImageAsset(),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: currencyController,
                        decoration: InputDecoration(
                            labelText: "Your currency",
                            hintText: "Insert Number",
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                      child: DropdownButton<String>(
                        items: _currency.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currentItemSelected,
                        onChanged: (String newValueSelected) {
                          _onDropDownItemSelected(newValueSelected);
                        },
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Center(
                        child: Text(
                          "In To: ",
                          style: TextStyle(
                            inherit: true,
                            fontSize: 30.0,
                            shadows: [
                              Shadow(
                                // bottomLeft
                                  offset: Offset(-1.5, -1.5),
                                  color: Colors.white),
                              Shadow(
                                // bottomRight
                                  offset: Offset(1.5, -1.5),
                                  color: Colors.white),
                              Shadow(
                                // topRight
                                  offset: Offset(1.5, 1.5),
                                  color: Colors.white),
                              Shadow(
                                // topLeft
                                  offset: Offset(-1.5, 1.5),
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      )),
//                  Expanded(
//                      child: TextField(
//                    keyboardType: TextInputType.number,
//                    decoration: InputDecoration(
//                        labelText: "Value 2",
//                        hintText: "number",
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(5.0))),
//                  )),
                  Container(
                    width: _minimumPadding * 5,
                    height: _minimumPadding * 20,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currency.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentConvertValueSelected,
                      onChanged: (String newValueSelected) {
                        _onDropDownCurrencySelected(newValueSelected);
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: _minimumPadding, top: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.indigo,
                      child: Text(
                        "Convert",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          this.displayText = _calculateCurrency();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text(
                        "Reset",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Center(
                child: Text(
                  this.displayText,
                  style: textStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money1.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  void _onDropDownCurrencySelected(String newValueSelected) {
    setState(() {
      this._currentConvertValueSelected = newValueSelected;
    });
  }

  String _calculateCurrency() {
    double convert = double.parse(currencyController.text);
    double calculate;
    double euroToDkk = 7.466;
    double euroToUsd = 1.125;
    double dkkToEuro = 0.133;
    double dkkToUsd = 0.150;
    double usdToEuro = 0.888;
    double usdToDkk = 6.634;

    String result = "";
    if (_currentItemSelected == "EURO" &&
        _currentConvertValueSelected == "DKK") {
      calculate = convert * euroToDkk;
      result = "$calculate DKK";
    } else if (_currentItemSelected == "EURO" &&
        _currentConvertValueSelected == "USD") {
      calculate = convert * euroToUsd;
      result = "$calculate \$";
    } else if (_currentItemSelected == "DKK" &&
        _currentConvertValueSelected == "EURO") {
      calculate = convert * dkkToEuro;
      result = "$calculate €";
    } else if (_currentItemSelected == "DKK" &&
        _currentConvertValueSelected == "USD") {
      calculate = convert * dkkToUsd;
      result = "$calculate \$";
    } else if (_currentItemSelected == "USD" &&
        _currentConvertValueSelected == "EURO") {
      calculate = convert * usdToEuro;
      result = "$calculate €";
    } else if (_currentItemSelected == "USD" &&
        _currentConvertValueSelected == "DKK") {
      calculate = convert * usdToDkk;
      result = "$calculate DKK";
    }

    return result;
  }


  void _reset() {
    currencyController.text = "";
    displayText = "";
    _currentItemSelected = _currency[0];
    _currentConvertValueSelected = _currency[1];
  }
}
