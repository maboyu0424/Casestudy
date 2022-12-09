import 'dart:html';
import 'dart:core';

void main() {
  NumberInputElement submit = querySelector('#submit') as NumberInputElement;

  List<int?> bookingtable = [];

  submit.onClick.listen((event) {
    SelectElement venue = querySelector("#venues") as SelectElement;

    DateInputElement starttime =
        querySelector("#starttime") as DateInputElement;

    DateInputElement endtime = querySelector("#endtime") as DateInputElement;

    DateInputElement daytime = querySelector("#datetime") as DateInputElement;

    //Hour for actual using
    var sth = starttime.valueAsDate.hour;
    var edh = endtime.valueAsDate.hour;

    //minuts and day only for displaying
    var stm = starttime.valueAsDate.minute;
    var edm = endtime.valueAsDate.minute;
    var year = daytime.valueAsDate.year;
    var month = daytime.valueAsDate.month;
    var day = daytime.valueAsDate.day;

    var venueNumber = int.parse((venue.value).toString());
    var onlyNumber =
        venueNumber * 100000000 + 30000000 + sth * 10000 + edh * 100 + day;

    print(onlyNumber);
    var t = true;
    var r = true;
    var x = false;
    // ---------------------------------------------------------
    // Test algorithm 1
    for (var i = 0; i < bookingtable.length; i++) {
      //If the list have the number same with onlyNumber.then r = false;
      if (bookingtable[i] == onlyNumber) {
        r = false;
        print("false");
      }
    }
    // ----------------------------------------------------------
    // Test algorithm 2
    var only1 = onlyNumber.toString().replaceFirst("3", "f");
    var g = only1.split("f");
    var k = int.parse(g[1]);
    var roomNew = int.parse(g[0]);
    // print("here is g:$g,here is room new:$roomNew");
    // var newNumberEndTime = ((k ~/ 100) % 100);
    var newNumberStartTime = (k ~/ 10000);
    // print("here is new end $newNumberEndTime");
    // print("here is new start $newNumberStartTime");

    for (var i = 0; i < bookingtable.length; i++) {
      var j = ((bookingtable[i].toString()).replaceFirst("3", "f")).split("f");
      var l = int.parse(j[1]);
      var roomOld = int.parse(j[0]);
      var listNumberEndTime = ((l ~/ 100) % 100);
      // var listNumberStartTime = (l ~/ 10000);
      // print("here is list end $listNumberEndTime");
      // print("here is list start $listNumberStartTime");

      if (roomNew == roomOld) {
        if (newNumberStartTime < listNumberEndTime) {
          r = false;
          t = false;
        }
        // else if (listNumberStartTime == 0) {
        //   print("Shi jian chong tu!");
        // } else if (listNumberStartTime == 0) {
        //   print("Shi jian chong tu!");
        // } else if (listNumberStartTime == 0) {
        //   print("Shi jian chong tu!");
        // } else if (listNumberStartTime == 0) {
        //   print("Shi jian chong tu!");
        // }
      }
    }
//-----------------------------------------------------------------
    if (sth < edh) {
      if (sth >= 8 && edh <= 23) {
        if (bookingtable.isEmpty) {
          bookingtable.add(onlyNumber);
          t = true;
        } else if (r) {
          for (var i = 0; i < bookingtable.length; i++) {
            print(bookingtable[i]);

            if (bookingtable[i] != onlyNumber) {
              bookingtable.add(onlyNumber);
              t = true;
              break;
            }
          }
        } else {
          t = false;
        }
        if (t) {
          querySelector('#output')?.text = "Successfully booked!";
        } else {
          querySelector('#output')?.text =
              "Already booked!Pls choose another room or another time!";
        }
        if (bookingtable.isNotEmpty && t == true) {
          final newToDo = LIElement()
            ..text =
                (' Room$venueNumber is already booked at $day/$month/$year from $sth:$stm to $edh:$edm');
          for (var i = 0; i < bookingtable.length; i++) {
            querySelector("#bookingRecord")?.children.add(newToDo);
          }
        }
      } else {
        x = true;
        print("Error time chose!");
      }
    } else {
      x = true;
      print("Error time chose2!");
    }
    if (x) {
      querySelector('#output')?.text = "Please choose right time!";
    }

    print(bookingtable);
  });
}
