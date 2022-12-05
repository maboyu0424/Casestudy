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
    var onlyNumber = venueNumber * 10000000 + sth * 100000 + edh * 10 + day;
    print(onlyNumber);
    var t = true;
    var r = true;
    var x = false;
    // ---------------------------------------------------------
    for (var i = 0; i < bookingtable.length; i++) {
      //If the list have the number same with onlyNumber.then r = false;
      if (bookingtable[i] == onlyNumber) {
        r = false;
        print("false");
      }
    }

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