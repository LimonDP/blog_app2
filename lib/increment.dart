import 'package:blog_app2/incrementvalue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    final providerDAta = Provider.of<ValueIncrement>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("App Bar"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                providerDAta.value.toString(),
                style: TextStyle(fontSize: 50),
              ),
              ElevatedButton(
                onPressed: () {
                  providerDAta.valueChange();
                },
                child: Text("Increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
