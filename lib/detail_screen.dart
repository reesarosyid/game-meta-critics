import 'package:flutter/material.dart';
import 'package:game_meta_critics/models/game_models.dart';


class GameDetailScreen extends StatelessWidget {
  final GameIndex game;

  GameDetailScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 22, 34, 1),
        title: Center(
          child: Row(
            children: [
              Spacer(),
              Image.asset(
                "images/logo3.png",
                height: 50,
                width: 50,
              ),
              Text(
                "Game Meta Critics",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  game.imageAsset,
                  height: 300,
                ),
                SizedBox(height: 30),
                Column(
                  children: <Widget>[
                    Text(
                      game.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            game.logoPub,
                            width: screenWidth * 0.1,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            game.namePublisher,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_month_rounded,
                            size: screenWidth * 0.1,
                          ),
                          SizedBox(height: 0.8),
                          Text(
                            game.releaseDate,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "images/console.png",
                            width: screenWidth * 0.1,
                          ),
                          SizedBox(height: 0.8),
                          Text(
                            game.avaliableOn,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "Synopsis:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    game.synopsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                LikeDislikeApp(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class LikeDislikeApp extends StatefulWidget {
  @override
  _LikeDislikeAppState createState() => _LikeDislikeAppState();
}

class _LikeDislikeAppState extends State<LikeDislikeApp> {
  int likeCount = 0;
  int dislikeCount = 0;
  double rating = 0;

  void updateRating() {
    if (likeCount + dislikeCount > 0) {
      setState(() {
        rating = (likeCount / (likeCount + dislikeCount)) * 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                likeCount++;
                updateRating();
              });
            },
            child: Icon(
              Icons.thumb_up_off_alt,
              color: Colors.black,
              size: screenWidth * 0.1,
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              elevation: MaterialStateProperty.all<double>(0),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.001),
        Text(
          "$likeCount",
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: screenWidth * 0.1),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                dislikeCount++;
                updateRating();
              });
            },
            child: Icon(
              Icons.thumb_down_off_alt,
              color: Colors.black,
              size: screenWidth * 0.1,
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              elevation: MaterialStateProperty.all<double>(0),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.001),
        Text(
          "$dislikeCount",
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: screenWidth * 0.1),
        Icon(
          Icons.star_border_outlined,
          size: screenWidth * 0.1,
        ),
        SizedBox(width: screenWidth * 0.01),
        Text(
          rating.toStringAsFixed(2),
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}



