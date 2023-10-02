import 'package:timeago/timeago.dart' as timeago;

extension TimeAgoExtensions on DateTime {
  String get timeAgo => timeago.format(this);
}
