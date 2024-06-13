void main(){
  var year=2000;
  if(year >= 2001) {
  print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  var flybyObjects=['cly','20201060428'];
  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
  print(year);
}