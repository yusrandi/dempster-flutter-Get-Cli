import 'dart:math';

void main() {
  print('hahahha');

  var m1 = {
    'P001': 0.8,
    'X': 0.2,
  };
  var m2 = {
    'P001,P002,P003': 0.8,
    'X': 0.2,
  };

  nilaiMatrixMap(m1, m2);
}

learning() {
  var a = [10, 20];
  var b = [5, 2, 3];

  nilaiMatrix(a, b);

  var setGejalaSatu = {'P001', 'P002', 'P003', 'P004'};
  var setGejalaSatuX = <String>{};
  var setGejalaDua = {'P001', 'P003', 'P005'};

  var intersectionSet = setGejalaSatu.intersection(setGejalaDua);
  var intersectionSetUnion = setGejalaSatuX.union(setGejalaDua);

  print(intersectionSet);

  print(intersectionSetUnion);

  print(intersectionSetUnion.contains('P004'));
}

double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

nilaiMatrix(List a, List b) {
  a.forEach((eA) {
    b.forEach((eB) {
      print("eA $eA * eB $eB = ${eA * eB}");
    });
  });
}

nilaiMatrixMap(Map a, Map b) {
  a.forEach((keyA, valueA) {
    b.forEach((keyB, valueB) {
      // print(
      //     "KeyA $keyA($valueA) * KeyB $keyB($valueB) = ${roundDouble(valueA * valueB, 2)} ");

      var listA = keyA.split(',');
      var listB = keyB.split(',');
      if (keyA == 'X' || keyB == 'X') {
        print(
            "Hasil ${listA.toSet().union(listB.toSet())} = ${roundDouble(valueA * valueB, 2)}");
      } else {
        print(
            "Hasil ${listA.toSet().intersection(listB.toSet())} = ${roundDouble(valueA * valueB, 2)}");
      }
    });
  });
}
