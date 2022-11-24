import 'package:flutter/material.dart';
import 'package:untitleda1/pages/searchscreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../mediinfo.dart';

// class SearchedPage extends StatefulWidget {
//   const SearchedPage({Key? key, required this.mediinfo}) : super(key: key);
//   final Map mediinfo;
//   FlutterTts flutterTts = FlutterTts();
//   @override
//   State<SearchedPage> createState() => _SearchedPageState();
// }
//
// class _SearchedPageState extends State<SearchedPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(mediinfo["약명"]),
//       ),
//       body: SafeArea(
//         //padding 대신에 safearea로 하고
//         //padding: const EdgeInsets.all(10.0),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           SizedBox(
//             height: 20,
//           ),
//           Text("품목명: ${mediinfo["약명"]}",
//               style: TextStyle(fontSize: 20, fontFamily: 'SCDream4')),
//           SizedBox(
//             height: 20,
//           ),
//           Text("업체명: ${mediinfo["제조사"]}", style: TextStyle(fontSize: 20)),
//           SizedBox(
//             height: 20,
//           ),
//           Text("성분: ${mediinfo["성분"]}", style: TextStyle(fontSize: 20)),
//           SizedBox(
//             height: 20,
//           ),
//           Text("효능, 효과: ${mediinfo["효능"]}", style: TextStyle(fontSize: 20)),
//           SizedBox(
//             height: 20,
//           ),
//           Text("용법, 용량: ${mediinfo["복용"]}", style: TextStyle(fontSize: 20)),
//         ]),
//       ),
//     );
//   }
// }

// flutterTts.setLanguage("en-US");
// flutterTts.setSpeechRate(1.0);
// flutterTts.setVolume(1.0);
// flutterTts.setPitch(1.0);

class SearchedPage extends StatelessWidget {
  SearchedPage({Key? key, required this.mediinfo})
      : super(key: key); //const였는데 tts때문에 뺌
  final Map mediinfo;

  FlutterTts flutterTts = FlutterTts();
  speak() {
    flutterTts.setLanguage("ko-KR");
    flutterTts.setSpeechRate(1.0);
    flutterTts.speak(mediinfo["약명"]);
    flutterTts.speak(mediinfo["제조사"]);
    flutterTts.speak(mediinfo["성분"]);
    flutterTts.speak(mediinfo["효능"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mediinfo["약명"]),
      ),
      body: SafeArea(
        //padding 대신에 safearea로 하고
        //padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Text("품목명: ${mediinfo["약명"]}",
              style: TextStyle(fontSize: 20, fontFamily: 'SCDream4')),
          SizedBox(
            height: 20,
          ),
          Text("업체명: ${mediinfo["제조사"]}", style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 20,
          ),
          Text("성분: ${mediinfo["성분"]}", style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 20,
          ),
          Text("효능, 효과: ${mediinfo["효능"]}", style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 20,
          ),
          Text("용법, 용량: ${mediinfo["복용"]}", style: TextStyle(fontSize: 20)),
        ]),
      ),
    );
  }
}

/* appBar: AppBar(
          title: const Text("search"),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: BorderRadiusDirectional.only,
                icon: Icon(Icons.search),
            )
          ],
          ),
*/

/*   body: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            Container(

              color: Colors.lightGreen[50],
              width: 392.7,
              height: 60,
              child: Column(
                children: [
                  SizedBox(
                    height:13,
                  ),
                  Text(

                    "타이레놀정500밀리그램",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "  제품명:",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height:5,
                  ),
                  Text(
                    "  타이레놀정500밀리그램",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              width: 392.7,
              height: 133,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "  성분:",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height:5,
                  ),
                  Text(
                    "  아세트아미노펜",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              width: 392.7,
              height: 133,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "  효능 효과:",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height:5,
                  ),
                  Text(
                    "  감기로 인한 발열 및 통증, 두통,",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "  신경통, 근육통, 월경통, 염좌통",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              width: 392.7,
              height: 133,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "  용법 용량:",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height:5,
                  ),
                  Text(
                    "  만 12세 이상 소아 및 성인은 ",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "  1회 1~2정씩 1일 3~4회",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              width: 392.7,
              height: 133,
            ),

          ],



        )

    );
  }
}

*/
