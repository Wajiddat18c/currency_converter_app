import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Currency Converter",
    home: SIForm(),
  ));
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _currency = ['DKK', 'USD', 'EURO'];
  final _minumumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Currency Converter"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minumumPadding * 2),
        child: Column(
          children: <Widget>[
            getImageAsset(),
            Padding(
              padding: EdgeInsets.only(
                  top: _minumumPadding, bottom: _minumumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Value 1",
                        hintText: "number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                  Container(
                    width: _minumumPadding * 5,
                  ),
                  Expanded(
                      child: DropdownButton<String>(
                    items: _currency.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: "DKK",
                    onChanged: (String newValueSelected) {},
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minumumPadding, bottom: _minumumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Value 2",
                        hintText: "number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                  Container(
                    width: _minumumPadding * 5,
                    height: _minumumPadding * 20,
                  ),
                  Expanded(
                      child: DropdownButton<String>(
                    items: _currency.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: "USD",
                    onChanged: (String newValueSelected) {},
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: _minumumPadding, top: _minumumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("Convert"),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Reset"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minumumPadding * 2),
              child: Text('Todo'),
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
      margin: EdgeInsets.all(_minumumPadding * 10),
    );
  }
}
