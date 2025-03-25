extension ValidateExtension on String {
  String? validatePhoneNumber() {
    final regexPhoneNumber = RegExp(r"^\(?\d{2}\)?\s?9\s?\d{4}-?\d{4}$");
    if (!regexPhoneNumber.hasMatch(this) && isNotEmpty) {
      return "Número inválido";
    }
    return null;
  }
}

String formatDate(num day, num month) {
  var dayString = day.toString();
  var monthString = month.toString();

  var dayList = dayString.split('');
  var monthList = monthString.split('');

  if (dayList.length == 1) {
    dayList.insert(0, '0');
    dayString = dayList.join('');
  }
  if (monthList.length == 1) {
    monthList.insert(0, '0');
    monthString = monthList.join('');
  }

  var date = [];
  date.addAll([dayString, '/', monthString]);
  var result = date.join('');

  return result;
}
