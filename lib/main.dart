import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewHomePage(),
    );
  }
}

class ListViewHomePage extends StatefulWidget {
  @override
  _ListViewHomePageState createState() => _ListViewHomePageState();
}

class _ListViewHomePageState extends State<ListViewHomePage> {
  var titleList = [
    "Minions 1",
    "Minions 2",
    "Minions 3",
    "Minions 4",
    "Minions 5",
    "Minions 6",
    "Minions 7",
  ];

  var descList = [
    "This is description of Minions 1. This is description of Minions 1. This is description of Minions 1.",
    "This is description of Minions 2. This is description of Minions 2. This is description of Minions 2.",
    "This is description of Minions 3. This is description of Minions 3. This is description of Minions 3.",
    "This is description of Minions 4. This is description of Minions 4. This is description of Minions 4.",
    "This is description of Minions 5. This is description of Minions 5. This is description of Minions 5.",
    "This is description of Minions 6. This is description of Minions 6. This is description of Minions 6.",
    "This is description of Minions 7. This is description of Minions 7. This is description of Minions 7.",
  ];

  var imgList = [
    "assets/images/img1.png",
    "assets/images/img2.png",
    "assets/images/img3.png",
    "assets/images/img4.png",
    "assets/images/img5.png",
    "assets/images/img6.png",
    "assets/images/img7.png",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ListView On-Click Event Sample 1",
            style: TextStyle(color: Colors.grey),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                //return InkWell(
                onTap: () {
                  //print(titleList[index]);
                  showDialogFunc(context, imgList[index], titleList[index],
                      descList[index]);
                },
                child: Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(imgList[index]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            titleList[index],
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width,
                            child: Text(
                              descList[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
              );
            }));
  }
}

showDialogFunc(context, img, title, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Material(
                type: MaterialType.transparency,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            img,
                            width: 200,
                            height: 200,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(title,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          desc,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[500],
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ))));
      });
}
