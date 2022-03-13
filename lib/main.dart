import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'photo.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'all studio',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the HomeScreen widget.
        '/': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/photo': (context) => const PhotoScreen(),
      },
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _pageIndex = 0;
  final _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 75,
            ),
            const Text(
              '스튜디오',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '증명사진  프로필',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            _pageOfTop(),
            _pageOfMiddle(),
            _pageOfThird(),
            _pageOfFourth(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'more',
          ),
        ],
      ),
    );
  }
}

Widget _pageOfTop() {
  return Column(
    children: const [
      Text(
        '인기 순위',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget _pageOfMiddle() {
  return CarouselSlider(
    options: CarouselOptions(height: 200.0),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/photo');
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage('assets/images/studio$i.jpg'),
                    fit: BoxFit.fill),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  "$i",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}

Widget _pageOfThird() {
  return Column(
    children: const [
      SizedBox(
        height: 10,
      ),
      Text(
        '이벤트',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget _pageOfFourth() {
  return CarouselSlider(
    options: CarouselOptions(height: 200.0),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/photo');
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage('assets/images/studio$i.jpg'),
                    fit: BoxFit.fill),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  "$i",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}
