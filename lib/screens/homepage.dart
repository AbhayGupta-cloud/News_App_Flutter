import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/screens/newsscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 50;
  double width = 50;
  double height1 = 50;
  double width1 = 300;
  Color color = Colors.transparent;
  Color border_color = Colors.white;
  final List navBarItem = ["Top News", "India", "World", "Sports", "Health"];

  String? stringResponse;
  Map? mapResponse;
  List listResponse = [];

  Future apicall() async {
    http.Response response;
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-09-14&sortBy=publishedAt&apiKey=7b315519981d44d2b7b175988efeb153";
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['articles'];
      });
    } else {
      print("Error In Loading");
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.notifications),
          )
        ],
        title: Center(
          child: Text(
            "News App",
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: height1,
                    width: width1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Breaking News",
                        style: TextStyle(
                            fontSize: 30, fontStyle: FontStyle.italic),
                      ),
                    )),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(color: border_color, width: 0.0),
                    borderRadius: BorderRadius.circular(10),
                    color: color,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            height = 50.0;
                            width = 370;
                            color = Colors.white;
                            border_color = Colors.black;
                            height = 0.0;
                            width1 = 0.0;
                            setState(() {});
                          },
                          onDoubleTap: () {
                            height = 50.0;
                            width = 370;
                            color = Colors.white;
                            border_color = Colors.black;
                            height = 0.0;
                            width1 = 0.0;
                            setState(() {});
                          },
                          child: const Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            // controller: ,

                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            //nav bar menu
            Container(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: navBarItem.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          navBarItem[index],
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // color: Colors.amber,
                  image: const DecorationImage(
                      image: NetworkImage(
                        "https://c.biztoc.com/p/34ff6aa110499c26/s.webp",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listResponse.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsScreen(
                                      author: listResponse[index]['author'],
                                      description: listResponse[index]
                                          ['description'],
                                      img: listResponse[index]['urlToImage'],
                                      title: listResponse[index]['title'],
                                    )));
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        listResponse[index]['urlToImage']),
                                    fit: BoxFit.cover),
                              ),
                              // child: Text("Sample Text"),
                            ),
                            Flexible(
                                child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 20),
                                    child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                            text: listResponse[index]
                                                ['description'],
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 34, 8, 8)))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 28.0, left: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Source",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          "BBC",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          "32 mins ago",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          size: 12,
                                          color: Colors.red,
                                        ),
                                        Icon(
                                          Icons.share,
                                          size: 12,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
