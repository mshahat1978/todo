

// String toDateFormatted(DateTime date){
//   DateFormat pattern = DateFormat('dd / MM / yyyy') ;
//   return pattern.format(date);
// }

/// toFormattedDate : Name of get method
extension DateFormat on DateTime {
  String get toFormattedDate => ' $day / $month / $year';
}
// Make extension method
///  DateFormat2 : Name of extension
/// myformat() : Name of method
///  if i but   get  no need  ()
///
extension DateFormat2 on DateTime {
  String myDateformat() => '$day - $month - $year';
}