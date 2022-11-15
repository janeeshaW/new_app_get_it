import 'package:intl/intl.dart';




class AppDataConversions{
  String convertNewsTileDate({DateTime? date}){
    final formatter = DateFormat('EEEE, d MMM y');
    return formatter.format(date!);
  }
}
