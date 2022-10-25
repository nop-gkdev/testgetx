import 'package:get/route_manager.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'text1': 'You have pushed the button this many times:',
          'page1': 'PAGE1',
          'page2': 'PAGE2',
          'data1': 'Title',
          'data2': 'ID',
          'data3': 'UserID',
          'data4': 'Completed',
        },
        'th_THA': {
          'hello': 'สวัสดีชาวโลก',
          'text1': 'คุณได้กดปุ่มจำนวนครั้ง:',
          'page1': 'หน้าแรก',
          'page2': 'หน้าสอง',
          'data1': 'เรื่อง',
          'data2': 'ไอดี',
          'data3': 'ไอดีบัญชีผู้ใช้',
          'data4': 'สถานะ',
        }
      };
}
