import 'package:intl/intl.dart';

/// price can be int or double
String getFormattedPrice(dynamic price) {
  var f = NumberFormat('###,###');
  if (price.runtimeType == double) {
    price = price.toInt();
  }
  return "${f.format(price)}원";
}
