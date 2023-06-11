import 'package:flutter/material.dart';

import '../utils/strings.dart';

class MyIntroPage extends StatefulWidget {
  static const String id = "intro_page";

  const MyIntroPage({Key? key}) : super(key: key);

  @override
  State<MyIntroPage> createState() => _MyIntroPageState();
}

class _MyIntroPageState extends State<MyIntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Skip",
              style: TextStyle(
                  fontSize: 24, color: Colors.white70, letterSpacing: 2),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            controller: _pageController,
            children: [
              page(
                title: Strings.firsTit,
                image: Strings.firstPic,
                content: Strings.firstCont,
              ),
              page(
                title: Strings.secTit,
                content: Strings.secCont,
                image: Strings.secPic,
              ),
              page(
                title: Strings.thirdTit,
                content: Strings.thirdCont,
                image: Strings.thirdPic
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget page({image, title, content, reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image(
                    height: 300,
                    image: AssetImage(image),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                content,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive){
    return AnimatedContainer(duration: const Duration(milliseconds: 300),
    height: isActive?15:6,
    width: isActive?15:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green,width: 2),
        color: isActive?Colors.transparent:Colors.greenAccent,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicators=[];
    for(int i=0;i<3;i++){
      if(currentIndex==i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
