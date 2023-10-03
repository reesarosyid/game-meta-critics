import 'package:flutter/material.dart';
import 'package:game_meta_critics/main_pages.dart';

class AboutPage extends StatelessWidget{
  const AboutPage({Key? key,}) : super(key: key);


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
      body: AboutBody(),
      bottomNavigationBar: BottomNavBar(),

    );
  }

}


class AboutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo4.png",
            height: 100,
            width: 100,),
            SizedBox(height: 20.0),
            Text(
              'Game Meta Critics',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Versi 1.0.0',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '© 2023 Game Meta Critics',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
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