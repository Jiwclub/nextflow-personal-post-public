import 'package:timeago/timeago.dart' as timeago;

class Post {
  String message;
  DateTime createDate;

  Post({this.message, this.createDate});

  String get timeagoMessage {
    var now = DateTime.now();
    //ช่วงเวลา  ระยะห่่างของช่วงเวลาเปรียบเทียบ
    var duration = now.difference(this.createDate);
    var ago = now.subtract(duration);
    var message = timeago.format(ago, locale: 'th_short');

    return message;
  }
}
