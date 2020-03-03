import 'package:flutter/material.dart';

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final listofImages = [
    "https://images.unsplash.com/photo-1547157283-087711e7858f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547152850-11ac68bbe48f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547149639-94838200b639?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547149683-35abbbc2ee42?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1543362905-f2423ef4e0f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547087145-c26f26347c07?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547078352-7721c3ad49a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3D List View"),
        centerTitle: true,
      ),
      body: Center(
        child: ListWheelScrollView(
          perspective: 0.003,
          diameterRatio: 2,
          children: listofImages
              .map((m) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.network(
                        m,
                        alignment: Alignment.center,
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 40.0,
                        left: 30.0,
                        child: Text(
                          "Image",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )))
              .toList(),
          useMagnifier: true,
          magnification: 2,
          itemExtent: MediaQuery.of(context).size.height * 0.8,
//            children: List.generate(20, (i) => i)
//                .map((m) => Text(m.toString()))
//                .toList()
        ),
      ),
    );
  }
}
