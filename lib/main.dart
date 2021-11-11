/*

IGNOTUS by Alexander Abraham
Licensed under the MIT license!

*/

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    title: 'Ignotus',
    home: HomeScreen(),
  ));
}

/// Setting down some starting constants.
double titleFontSize = 30;
double textFontSize = 20;
double buttonFontSize = 15;
Color mainColor = Color.fromRGBO(ikzzzzzzzzzzzzzzzzzz, g, b, opacity)olors.red;
Color accentColor = Color.fromRGBO(0, 255, 153, 1); // bright green
double defaultPadding = 10;
double defaultSpacing = 20;
String defaultFont = 'MMD'; // Major Mono Display from Google Fonts.

/// Initializing the random number!
Random random = new Random();
int myrand = random.nextInt(1001);


/// This class wraps the screen containing
/// the main overview screen!
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
            child: SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Text('Ignotus',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: accentColor,
                  fontSize: titleFontSize,
                  fontFamily: defaultFont)),
          SizedBox(height: defaultSpacing),
          new RaisedButton(
            color: accentColor,
            child: Text('PLAY!',
                style: TextStyle(
                    color: mainColor,
                    fontSize: textFontSize,
                    fontFamily: defaultFont)),
            padding: EdgeInsets.all(defaultPadding),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandGuess()),
              );
            },
          ),
          SizedBox(height: defaultSpacing),
          new RaisedButton(
            color: accentColor,
            child: Text('INFO',
                style: TextStyle(
                    color: mainColor,
                    fontSize: textFontSize,
                    fontFamily: defaultFont)),
            padding: EdgeInsets.all(defaultPadding),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoScreen()),
              );
            },
          ),
          SizedBox(height: defaultSpacing),
          new RaisedButton(
            color: accentColor,
            child: Text('QUIT!',
                style: TextStyle(
                    color: mainColor,
                    fontSize: textFontSize,
                    fontFamily: defaultFont)),
            padding: EdgeInsets.all(defaultPadding),
            onPressed: () {
              exit(0);
            },
          )
        ]))));
  }
}


/// This class wraps the screen containing some information
/// about Ignotus!
class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String helpString =
        'You have to guess a\nnumber between 1 and\n1000! You have 15\ntries. Press the "REROLL"\nbutton to regenrate a \nrandom number. Enjoy!:)';
    String creditsString = '"Ignotus"\nc/o Alexander Abraham';
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
            child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            new Text('SOME SHORT INFO',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: accentColor,
                    fontSize: textFontSize,
                    fontFamily: defaultFont)),
            SizedBox(height: defaultSpacing),
            SizedBox(
                width: 350,
                child: new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: accentColor,
                    margin: EdgeInsets.all(10),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Text(helpString,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: textFontSize,
                                      fontFamily: defaultFont)),
                              SizedBox(height: defaultSpacing),
                              new Text(creditsString,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: textFontSize,
                                      fontFamily: defaultFont)),
                            ])))),
            SizedBox(height: defaultSpacing),
            new RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: accentColor,
              padding: EdgeInsets.all(defaultPadding),
              child: Text('GOT IT, THANKS!',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: buttonFontSize,
                      fontFamily: defaultFont)),
            ),
          ]),
        )));
  }
}

/// Implementing the ability for RandGuess to change
/// state.
class RandGuess extends StatefulWidget {
  @override
  RandGuessState createState() => new RandGuessState();
}

/// Class to wrap the actual games screen!
class RandGuessState extends State<RandGuess> {
  String textHolder = "Let's boogie, boys!";
  int tries = 15;
  int points = 0;
  void resetNumber() {
    setState(() {
      textHolder = 'Next round! ;)';
      random = new Random();
      myrand = random.nextInt(1001);
      tries = 15;
    });
  }

  void changeText(String guess) {
    tries = tries - 1;
    var userGuess = int.parse(guess);
    if (tries < 1) {
      setState(() {
        textHolder = 'You have no tries left!';
      });
    } else {
      if (userGuess == myrand) {
        setState(() {
          textHolder = 'Aw, hell you guessed it! :(';
          points = points + 1;
        });
      } else if (userGuess < myrand) {
        setState(() {
          textHolder = 'LOL! Too small!';
        });
      } else if (userGuess > myrand) {
        setState(() {
          textHolder = 'What are you? An aeroplane?';
        });
      } else {
        setState(() {
          textHolder = 'Is u stupid?';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController guessController = new TextEditingController();
    String myTries = 'Tries left: $tries';
    String myPoints = 'Points: $points';
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
            child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            new Text("LET'S GO!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: accentColor,
                    fontSize: titleFontSize,
                    fontFamily: defaultFont)),
            SizedBox(
                width: 350,
                child: new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: accentColor,
                    margin: EdgeInsets.all(10),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(height: defaultSpacing),
                              new Text(myPoints,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: textFontSize,
                                      fontFamily: defaultFont)),
                              new Text('$textHolder',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: textFontSize,
                                      fontFamily: defaultFont)),
                              SizedBox(height: defaultSpacing),
                              new Text(myTries,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: textFontSize,
                                      fontFamily: defaultFont)),
                              SizedBox(height: defaultSpacing),
                              new SizedBox(
                                  width: 250,
                                  child: new TextField(
                                      controller: guessController,
                                      maxLength: 30,
                                      maxLines: 1,
                                      maxLengthEnforced: true,
                                      autofocus: true,
                                      decoration: new InputDecoration(
                                        counterText: '',
                                        hintText: 'YOUR GUESS?',
                                        hintStyle: TextStyle(
                                            fontSize: textFontSize,
                                            color: mainColor,
                                            fontFamily: defaultFont),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: mainColor, width: 3.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: mainColor, width: 2.5),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: mainColor, width: 1.0),
                                        ),
                                      ),
                                      style: TextStyle(
                                          height: 2.0,
                                          color: mainColor,
                                          fontSize: textFontSize,
                                          fontFamily: defaultFont))),
                            ])))),
            SizedBox(height: defaultSpacing),
            new RaisedButton(
                color: accentColor,
                child: Text('SUBMIT GUESS',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: buttonFontSize,
                        fontFamily: defaultFont)),
                padding: EdgeInsets.all(defaultPadding),
                onPressed: () {
                  this.changeText(guessController.text);
                }),
            SizedBox(height: defaultSpacing),
            new RaisedButton(
                color: accentColor,
                child: Text('REROLL',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: buttonFontSize,
                        fontFamily: defaultFont)),
                padding: EdgeInsets.all(defaultPadding),
                onPressed: () {
                  this.resetNumber();
                }),
            SizedBox(height: defaultSpacing),
            new RaisedButton(
                color: accentColor,
                child: Text('QUIT TO TITLE',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: buttonFontSize,
                        fontFamily: defaultFont)),
                padding: EdgeInsets.all(defaultPadding),
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(height: defaultSpacing),
          ]),
        )));
  }
}
