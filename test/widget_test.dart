import 'dart:math';

void main() {
  var m1 = {
    'P001': 0.8,
    'X': 0.2,
  };
  var m2 = {
    'P001,P002,P003': 0.8,
    'X': 0.2,
  };
  var m = [
    {
      'P001': 0.8,
      'X': 0.2,
    },
    {
      'P001,P002,P003': 0.8,
      'X': 0.2,
    },
    {
      'P001,P002,P003': 0.8,
      'P001,P002': 0.8,
      'X': 0.2,
    },
  ];

  // nilaiMatrixMap(m1, m2);

  for (var i = 0; i < m.length; i++) {
    var mResult = {};
    if (i > 0) {
      print(m[i]);

      mResult = nilaiMatrixMap(m[i - 1], m[i]);
      print('result $mResult');
      print('=====================================');
    } else {
      mResult = m[0];
    }
  }
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
  var mResult = {};

  a.forEach((keyA, valueA) {
    b.forEach((keyB, valueB) {
      // print(
      //     "KeyA $keyA($valueA) * KeyB $keyB($valueB) = ${roundDouble(valueA * valueB, 2)} ");

      var listA = keyA.split(',');
      var listB = keyB.split(',');
      if (keyA == 'X' || keyB == 'X') {
        if (keyA != 'X' || keyB != 'X') {
          listA.removeWhere((item) => item == 'X');
          listB.removeWhere((item) => item == 'X');
        }
        var key = listA.toSet().union(listB.toSet()).join(',');

        if (mResult.containsKey(key)) {
          double valueOld = mResult[key];
          print('has value $valueOld');

          mResult.update(
              key, (value) => roundDouble((valueOld + (valueA * valueB)), 2));
        } else {
          mResult.putIfAbsent(key, () => roundDouble(valueA * valueB, 2));
        }

        print("Hasil $key = ${roundDouble(valueA * valueB, 2)}");
      } else {
        var key = listA.toSet().intersection(listB.toSet()).join(',');

        if (mResult.containsKey(key)) {
          double valueOld = mResult[key];
          print('has value $valueOld');

          mResult.update(
              key, (value) => roundDouble((valueOld + (valueA * valueB)), 2));
        } else {
          mResult.putIfAbsent(key, () => roundDouble(valueA * valueB, 2));
        }
        print("Hasil ${key} = ${roundDouble(valueA * valueB, 2)}");
      }
    });
  });

  return mResult;
}
