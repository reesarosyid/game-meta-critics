import 'package:flutter/material.dart';
import 'package:game_meta_critics/about.dart';
import 'package:game_meta_critics/models/game_models.dart';
import 'package:game_meta_critics/detail_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text("Game Meta Critics",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Spacer(),
            ],
          ),
        ),
      ),
      body: MainContent(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gameIndexList.length,
      itemBuilder: (context, index) {
        final GameIndex game = gameIndexList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return GameDetailScreen(game: game);
                },
              ),
            );
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(game.imageAsset,
                  height: 100,
                  width: 100,),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          game.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(game.namePublisher)
                      ],
                    ),

                  ))
                
              ],
            ),
          ),
        );
      },
    );
  }
}



class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        // Pindah ke halaman "Back"
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else if (index == 1) {
        // Pindah ke halaman "About"
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AboutPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(0, 22, 34, 1),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
          color: Colors.white,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined,
          color: Colors.white,),
          label: 'About',
        )
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue, // Warna teks label item yang aktif
      unselectedItemColor: Colors.white, // Warna teks label item yang tidak aktif
      onTap: _onItemTapped,
    );
  }
}