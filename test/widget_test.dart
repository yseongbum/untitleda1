import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:untitleda1/pages/searchpage2.dart';
import 'package:untitleda1/pages/searchscreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:csv/csv.dart';
import '../mediinfo.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:csv/csv.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();

  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/medicsv2.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);

    setState(() {
      _data = _listData;
    });
  }

  loadingCSV() {
    _loadCSV();
  }

  // List<List<dynamic>> _foundUsers = [];
  //
  // initState() {
  //   // at the beginning, all users are shown
  //   _foundUsers = _data;
  //   super.initState();
  // }
  //
  // void _runFilter(String enteredKeyword) {
  //   List<List<dynamic>> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //     results = _data;
  //   } else {
  //     results = _data
  //         .where((_data) => _data.contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }
  //
  //   // Refresh the UI
  //   setState(() {
  //     _foundUsers = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    loadingCSV();
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              //onChanged: (value) => _runFilter(value),
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection:
                    Axis.vertical, //vertical : 수직으로 나열 / horizontal : 수평으로 나열
                itemCount: _data.length, //리스트의 개수
                itemBuilder: (BuildContext context, int index) {
                  //리스트의 반목문 항목 형성
                  return Card(
                    child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        title: SizedBox(
                            child: Text(
                          _data[index][0].toString(),
                          style: TextStyle(fontSize: 25),
                        )),
                        subtitle: SizedBox(
                          child: Text(
                            _data[index][1].toString(),
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchedPage(
                                    mediinfo: _data[index],
                                  )));
                        }),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//
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
//       body: Column(
//           children: [
//             SizedBox(
//               height: 22,
//             ),
//             SearchScreen(),
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height:33,
//                   ),
//                   Text(
//                     "  품목명: 타이레놀정500밀리그램",
//                     style: TextStyle(
//                       fontSize: 23,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     height:5,
//                   ),
//                     Text(
//                     "  업체명: 주)한국얀센",
//                       style: TextStyle(
//                         fontSize: 23,
//                         color: Colors.black,
//                       ),
//                   ),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//               ),
//               width: 392.7,
//               height: 133,
//             ),
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height:33,
//                   ),
//                   Text(
//                     "  품목명: 타이레놀정160밀리그램",
//                     style: TextStyle(
//                       fontSize: 23,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     height:5,
//                   ),
//                   Text(
//                     "  업체명: 주)한국얀센",
//                     style: TextStyle(
//                       fontSize: 23,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//               ),
//               width: 392.7,
//               height: 133,
//             ),
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height:33,
//                   ),
//                   Text(
//                     "  품목명: 어린이타이레놀현탁액",
//                     style: TextStyle(
//                       fontSize: 23,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     height:5,
//                   ),
//                   Text(
//                     "  업체명: 주)한국얀센",
//                     style: TextStyle(
//                       fontSize: 23,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//               ),
//               width: 392.7,
//               height: 133,
//             ),
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height:33,
//                   ),
//                   Text(
//                     "  품목명: 타이레놀정500밀리그램",
//                     style: TextStyle(
//                       fontSize: 23,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     height:5,
//                   ),
//                   Text(
//                     "  업체명: 주)한국얀센",
//                     style: TextStyle(
//                       fontSize: 23,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//               ),
//               width: 392.7,
//               height: 133,
//             ),
//           ],
//
//
//
//       )
//
//     );
//   }
// }
