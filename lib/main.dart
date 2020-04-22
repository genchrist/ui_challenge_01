import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        body: Stack(
          fit: StackFit.passthrough,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Header(),
                  Calories(),
                  DaySelector(),
                  Progress(),
                ],
              ),
            ),
            BottomNav(),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey[50],
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(190, 60))),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(290, 150))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Anoop Jose",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/boy.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Calories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Calories Today"),
                Text(
                  "310",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Goal",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "310",
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DaySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 20.0, left: 20, top: 50, bottom: 30),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.orange[800],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 10, bottom: 10),
              child: Text(
                "Today",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 10, bottom: 10),
              child: Text(
                "Today",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 10, left: 10, top: 10, bottom: 10),
                  child: Icon(
                    Icons.compare_arrows,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  double running = 0;
  double swimming = 0;
  double yoga = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    runningTimer();
    swimmingTimer();
    yogaTimer();
  }

  runningTimer() {
    Timer interval(Duration duration, func) {
      Timer function() {
        Timer timer = new Timer(duration, function);

        func(timer);

        return timer;
      }

      return new Timer(duration, function);
    }

    int i = 0;

    interval(new Duration(milliseconds: 20), (timer) {
      setState(() {
        running = (i++).toDouble();
      });
      print("running :" + running.toString());

      if (i > 53) timer.cancel();
    });
  }

  swimmingTimer() {
    Timer interval(Duration duration, func) {
      Timer function() {
        Timer timer = new Timer(duration, function);

        func(timer);

        return timer;
      }

      return new Timer(duration, function);
    }

    int i = 0;

    interval(new Duration(milliseconds: 20), (timer) {
      setState(() {
        swimming = (i++).toDouble();
      });
      print("swimming :" + swimming.toString());

      if (i > 35) timer.cancel();
    });
  }

  yogaTimer() {
    Timer interval(Duration duration, func) {
      Timer function() {
        Timer timer = new Timer(duration, function);

        func(timer);

        return timer;
      }

      return new Timer(duration, function);
    }

    int i = 0;

    interval(new Duration(milliseconds: 20), (timer) {
      setState(() {
        yoga = (i++).toDouble();
      });
      print("yoga :" + yoga.toString());

      if (i > 76) timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/running.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text("Running")),
                          Text("1h"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("${running.toString()}%"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 120),
                          height: 5,
                          color: Colors.white,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 120) *
                              running /
                              100,
                          height: 5,
                          color: Colors.green.withOpacity(0.5),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/swimming.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text("Swimming")),
                          Text("2h"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("${swimming.toString()}%"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 120),
                          height: 5,
                          color: Colors.white,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 120) *
                              swimming /
                              100,
                          height: 5,
                          color: Colors.green.withOpacity(0.5),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/yoga.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text("Yoga")),
                          Text("35min"),
                          SizedBox(
                            width: 20,
                          ),
                          Text("${yoga.toString()}%"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 120),
                          height: 5,
                          color: Colors.white,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 120) *
                              yoga /
                              100,
                          height: 5,
                          color: Colors.green.withOpacity(0.5),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 112,
        width: MediaQuery.of(context).size.width,
        color: Colors.green[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: SafeArea(
                  bottom: true,
                  child: Column(
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.orange[800]),
                      ),
                      Text(
                        ".",
                        style: TextStyle(
                            color: Colors.orange[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: SafeArea(
                  bottom: true,
                  child: Column(
                    children: [
                      Text(
                        "Mall",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            color: Colors.orange[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: SafeArea(
                  bottom: true,
                  child: Column(
                    children: [
                      Text(
                        "Mall",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            color: Colors.orange[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 112,
                decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40))),
                child: SafeArea(
                    bottom: true,
                    child: Column(
                      children: [
                        Text(
                          "START",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                              color: Colors.orange[800],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
