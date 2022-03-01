import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ))
          ]),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(5)),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2016/11/22/20/11/photography-1850469_1280.jpg'),
                          )),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text('찰칵찰칵 스튜디오',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    flex: 4,
                  ),
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () => true),
                      ),
                      flex: 1)
                ],
              ),
              flex: 1),
          const Expanded(child: Text('대표사진부분'), flex: 7)
        ],
      )),
      backgroundColor: Colors.white,
    );
  }
}
