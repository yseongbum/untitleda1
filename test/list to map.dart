class CsvToMapConverter {
  CsvToListConverter converter;
  CsvToMapConverter(
      {String fieldDelimiter = defaultFieldDelimiter,
      String textDelimiter = defaultTextDelimiter,
      String textEndDelimiter,
      String eol = defaultEol,
      CsvSettingsDetector csvSettingsDetector,
      bool shouldParseNumbers,
      bool allowInvalid}) {
    converter = CsvToListConverter(
        fieldDelimiter: fieldDelimiter,
        textDelimiter: textDelimiter,
        textEndDelimiter: textEndDelimiter,
        eol: eol,
        csvSettingsDetector: csvSettingsDetector,
        shouldParseNumbers: shouldParseNumbers,
        allowInvalid: allowInvalid);
  }
  List<Map<String, dynamic>> convert(String csv) {
    List<List<dynamic>> list = converter.convert(csv);
    List legend = list[0];
    List<Map<String, dynamic>> maps = [];
    list.sublist(1).forEach((List l) {
      Map<String, dynamic> map = {};
      for (int i = 0; i < legend.length; i++) {
        map.putIfAbsent('${legend[i]}', () => l[i]);
      }
      maps.add(map);
    });
    return maps;
  }
}
'타이레놀정500밀리그램','주) 한국얀센','아세트아미노펜',"감기로 인한 발열 및 통증, 두통, 신경통, 근육통, 월경통, 염좌통",'만 12세 이상 소아 및 성인은 1회 1~2정씩 1일 3~4회'
'타이레놀정160밀리그램','주) 한국얀센','아세트아미노펜','모름','모름'
'어린이타이레놀현탁액','주) 한국얀센','아세트아미노펜','모름','모름'
'우먼스타이레놀정','주) 한국얀센','아세트아미노펜','모름','모름'
'a','a',a,'모름','모름'
'b','b',b','모름','모름'
'c','c','c','모름','모름'
final List<Map<String,dynamic>> _data= [
  {"약명": '타이레놀정500밀리그램',"제조사":'주) 한국얀센' ,"성분":'아세트아미노펜', "효능":"감기로 인한 발열 및 통증, 두통, 신경통, 근육통, 월경통, 염좌통", "복용":'만 12세 이상 소아 및 성인은 1회 1~2정씩 1일 3~4회' },
  {"약명": '타이레놀정160밀리그램',"제조사":'주) 한국얀센' ,"성분":'아세트아미노펜', "효능":'모름', "복용": '모름'},
  {"약명": '어린이타이레놀현탁액',"제조사": '주) 한국얀센' ,"성분":'아세트아미노펜', "효능":'모름', "복용": '모름'},
  {"약명": 'a',"제조사": 'a',"성분":'a', "효능":'a', "복용":'a' },
  {"약명": 'a',"제조사": 'a',"성분":'a', "효능":'a', "복용": 'a'},
  {"약명": 'a',"제조사": 'a',"성분":'a', "효능":'a', "복용": 'a'},
  {"약명": 'a',"제조사": 'a',"성분":'a', "효능":'a', "복용": 'a'},
  {"약명": 'a',"제조사": 'a',"성분":'a', "효능":'a', "복용": 'a'},
  {"약명": 'a',"제조사": 'a',"성분":'a', "효능":'a', "복용": 'a'},
  {"약명": 'a',"제조사": 'a',"성분":'a', "효능":'a', "복용":'a' },
];