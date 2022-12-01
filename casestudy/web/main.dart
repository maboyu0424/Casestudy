import 'dart:html';
import 'dart:core';

void main() {
  NumberInputElement submit = querySelector('#submit') as NumberInputElement;

  List<int?> bookingtable = [];

  submit.onClick.listen((event) {
    SelectElement venue = querySelector("#venues") as SelectElement;
    SelectElement time = querySelector("#time") as SelectElement;

    var a = int.parse((venue.value).toString());
    var b = int.parse((time.value).toString());

    var timeTable = switchB(b);

    int? c = a + b;
    var t = true;
    var r = true;

    // if (t) {
    //   querySelector('#output')?.text = "Successfully booked!";
    // }
    for (var i = 0; i < bookingtable.length; i++) {
      if (bookingtable[i] == c) {
        r = false;
      }
    }

    if (bookingtable.isEmpty) {
      bookingtable.add(c);

      t = true;
    } else if (r) {
      for (var i = 0; i < bookingtable.length; i++) {
        if (bookingtable[i] != c) {
          bookingtable.add(c);

          // querySelector('#output')?.text = "Successfully booked!";
          t = true;
          break;
        }
      }
    } else {
      // querySelector('#output')?.text =
      //     "Already booked!Pls choose another room or another time!";
      t = false;
    }
    if (bookingtable.length > 999) {
      for (var i = 0; i < bookingtable.length; i++) {
        for (var j = 1; i < bookingtable.length; j++) {
          if (bookingtable[i] == bookingtable[j]) {
            t = false;
          }
        }
      }
    }

    if (t) {
      querySelector('#output')?.text = "Successfully booked!";
    } else {
      querySelector('#output')?.text =
          "Already booked!Pls choose another room or another time!";
    }

    if (bookingtable.isNotEmpty && t == true) {
      //   for (var i = 0; i < bookingtable.length; i++) {
      //     if (bookingtable[i]! > 2) {
      //       querySelector("#showSeat")?.innerHtml =
      //           '<div> <img src="/resource/yes.png" alt=""> </div>';
      //     } else {
      //       querySelector("#showSeat")?.innerHtml =
      //           '<div> <img src="/resource/yes.png" alt=""> </div>';
      //     }
      //   }
      final newToDo = LIElement()
        ..text = (' Room$a is already booked at $timeTable ');
      for (var i = 0; i < bookingtable.length; i++) {
        querySelector("#bookingRecord")?.children.add(newToDo);
        // =   '<div> Room$a is already booked at $b </div>';
      }
    }

    print(bookingtable);
  });
}

String? switchB(var timeTable) {
  switch (timeTable) {
    case 1:
      {
        timeTable = "8:00-10:00";
      }
      break;

    case 2:
      {
        timeTable = "10:00-12:00";
      }
      break;

    case 3:
      {
        timeTable = "12:00-14:00";
      }
      break;

    case 4:
      {
        timeTable = "14:00-16:00";
      }
      break;
    case 5:
      {
        timeTable = "16:00-18:00";
      }
      break;

    case 6:
      {
        timeTable = "18:00-20:00";
      }
      break;
    case 7:
      {
        timeTable = "20:00-22:00";
      }
      break;
    case 8:
      {
        timeTable = "22:00-23:00";
      }
      break;

    default:
      {
        timeTable = "Error!";
      }
      break;
  }
  return timeTable;
}
