import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:matching_cards/data/card_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int opened = 0;
  List<String> compare = [];
  List<int> indexx = [];
  List<GlobalKey<FlipCardState>> cardKeys =
      List.generate(9, (index) => GlobalKey<FlipCardState>());

  @override
  void initState() {
    // TODO: implement initState
    cardmodel.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(opened.toString()),
          Text(compare.toString()),
          Text(indexx.toString()),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              children: List.generate(cardmodel.length, (index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlipCard(
                    // controller: card,
                    key: cardKeys[index],
                    onFlip: () {
                      if (cardmodel[index].isFlipped == false) {
                        setState(() {
                          cardmodel[index].isFlipped =
                              !cardmodel[index].isFlipped;
                          compare.add(cardmodel[index].text);
                          indexx.add(index);
                          opened++;
                        });
                      } else {
                        setState(() {
                          cardmodel[index].isFlipped =
                              !cardmodel[index].isFlipped;
                          compare.removeLast();
                          indexx.removeLast();
                          opened--;
                        });
                      }
                      if (opened == 2) {
                        if (compare[0] == compare[1]) {
                          dialog(context, "Correct", indexx[0], indexx[1]);
                        } else {
                          dialog(context, "Wrong", indexx[0], indexx[1]);
                        }
                      }
                    },
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    side: CardSide.FRONT, // The side to initially display.
                    front: GestureDetector(
                      child: Container(
                        color: Colors.red,
                        child: Text('Front \n ${cardmodel[index].isFlipped}'),
                      ),
                    ),
                    back: Container(
                      color: Colors.green,
                      child: Text(cardmodel[index].text),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    ));
  }

  void dialog(context, String text, int index1, int index2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => MyHomePage()));
                // cardcntrl.toggleCard();
                cardKeys[index1].currentState!.toggleCard();
                cardKeys[index2].currentState!.toggleCard();
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
