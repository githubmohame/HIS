int binary_search(int x, String parameter,List<dynamic> u) {
  int begin = 0;
  int end = u.length - 1;
  print('good');
  while (begin != end) {
    print(end);
    int center = ((begin + end) / 2).toInt();
    if (u[center][parameter]! < x) {
      begin = center + 1;
    } else {
      end = center;
    }
  }
  return begin;
}
