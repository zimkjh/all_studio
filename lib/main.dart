import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'second.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'all studio',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the HomeScreen widget.
        '/': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => const SecondScreen(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 6,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/photo');
          },
          icon: const Icon(Icons.photo, color: Colors.black,)
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_a_photo,
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.drafts,
              color: Colors.black87,
            ),
          ),
        ],
        title: const Text('all studio'),
      ),
      body: SingleChildScrollView(child: Center(
        child: Column(
          children: [
            _pageOfTop(),
            _pageOfMiddle(),
            _pageOfThird(),
            _pageOfFourth(),
          ],
        ),
      ),),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
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
    ],
  );
}

Widget _pageOfMiddle() {
  return CarouselSlider(
    options: CarouselOptions(height: 200.0),
    items: [1,2,3,4,5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width/1.2,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset('assets/images/studio$i.jpg', fit: BoxFit.fill)
          );
        },
      );
    }).toList(),
  );
}

Widget _pageOfThird() {
  return Column(
    children: const [
      Text(
        '새로 출시 했어요',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget _pageOfFourth() {
  return CarouselSlider(
    options: CarouselOptions(height: 200.0),
    items: [1,2,3,4,5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width/1.2,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                  color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Text('text $i', style: TextStyle(fontSize: 16.0),)
          );
        },
      );
    }).toList(),
  );
}