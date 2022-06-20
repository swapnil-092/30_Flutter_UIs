import 'package:flutter/material.dart';

import 'FadeAnimation.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late PageController _pageController;

  int totalPage = 5;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          makePage(
              page: 1,
              image: 'assets/image/1.jpg',
              title: 'Rome, Italy',
            description: 'Be it the art, the culture, or the ruins of The Forum and the Colosseum that evoke the power of the ancient Roman Empire.',
          ),
          makePage(
            page: 2,
              image:'assets/image/2.jpg',
              title: 'Bagan, Myanmar',
            description: 'Bagan is popular for its more than 2000 Buddhist temples. While most of them are under restoration by UNESCO, it should not stop you from exploring this culturally rich region of Asia. ',
          ),
          makePage(
            page: 3,
              image:'assets/image/3.jpg',
              title: 'Paris',
            description: 'Well any list of must visit places in the world is incomplete with this place not being in the list. Paris is the city of love, of romance, of art. Almost everyone has Paris on their travel bucket list.',
          ),
          makePage(
            page: 4,
              image:'assets/image/4.jpg',
              title: 'Eiffel Tower',
            description: 'Even though the city is filled with historical sites. Places like Arc de Triomphe, Château de Versailles and, of course, the Eiffel Tower, and has a delightful cuisine, the best part about Paris is its magical and unforgettable atmosphere. Paris has something to offer to everyone.',
          ),
          makePage(
            page: 5,
              image:'assets/image/one.jpg',
              title: 'Goa, India',
            description: 'Goa is an exotic beach destination that attracts travelers and backpackers from all around the world because of its tropical charm. Known for lovely beach shacks, scrumptious seafood, lush green backwaters and cheap booze, the vacationing experience in Goa is unlike any other destination.',
          ),

        ],
      ),
    );
  }

  Widget makePage({image,title,description,page}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          )
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: [0.3,0.9],
                colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.2),
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeAnimation(2, Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),),
                  Text('/'+ totalPage.toString(), style: TextStyle(color: Colors.white, fontSize: 15,),)
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1,
                    Text(title, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                    ),
                  SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(1.5, Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size:15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size:15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size:15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size:15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.grey, size:15,),
                        ),
                        Text('4.0', style: TextStyle(color: Colors.white70),),
                        Text('(2300)',style: TextStyle(color: Colors.white38, fontSize: 12),),
                      ],
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(2,Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(description,style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.6, fontSize: 13),),
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(2.5,Text('READ MORE', style: TextStyle(color: Colors.white),)),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
