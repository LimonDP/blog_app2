import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => Favurites(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Favurites>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blog Apps ' + providerData.fruit),
        ),
        body: Center(
          child: Column(
            children: [
              FruitButton(fruit: "Apple"),
              FruitButton(fruit: "Orange"),
              FruitButton(fruit: "Banana"),
            ],
          ),
        ),
      ),
    );
  }
}

class FruitButton extends StatelessWidget {
  final String fruit;
  FruitButton({required this.fruit});
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Favurites>(context, listen: false);
    return ElevatedButton(
        onPressed: () {
          providerData.changeFruit(fruit);
        },
        child: Text(fruit));
  }
}

class Favurites extends ChangeNotifier {
  String fruit = "";
  void changeFruit(String myFavurite) {
    fruit = myFavurite;
    notifyListeners();
  }
}
