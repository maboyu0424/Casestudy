import 'dart:html';
import 'dart:core';

class Register {
  List<int?> bookingtable = [];
  var sth;
  var edh;
  var stm;
  var edm;
  var year;
  var month;
  var day;
  var t;
  var r;
  var x;
  var onlyNumber;
  var venueNumber;

  Register(var bookingtable1) {
    //To Initialize all variables
    
    bookingtable = bookingtable1;
    SelectElement venue = querySelector("#venues") as SelectElement;

    DateInputElement starttime =
        querySelector("#starttime") as DateInputElement;

    DateInputElement endtime = querySelector("#endtime") as DateInputElement;

    DateInputElement daytime = querySelector("#datetime") as DateInputElement;

    //Hour for actual using
    sth = starttime.valueAsDate.hour;
    edh = endtime.valueAsDate.hour;

    //minuts and day only for displaying
    stm = starttime.valueAsDate.minute;
    edm = endtime.valueAsDate.minute;
    year = daytime.valueAsDate.year;
    month = daytime.valueAsDate.month;
    day = daytime.valueAsDate.day;

    venueNumber = int.parse((venue.value).toString());
    onlyNumber =
        venueNumber * 100000000 + 40000000 + sth * 10000 + edh * 100 + day;

    // print(onlyNumber);
    t = true;
    r = true;
    x = false;
  }

  testAlgorithm1() {
    //To check the list that has created in the Constructor. If the list has the number same with onlyNumber(newly created number), Then r = false;
    //Can't let user to book the same room at the same time.  
    for (var i = 0; i < bookingtable.length; i++) {
      if (bookingtable[i] == onlyNumber) {
        r = false;
        print("false");
      }
    }
  }

  testAlgorithm2() {
    //To check the number in the list is same or not.
    //Can't let user to book the same room at wrong time period.eg. booked room 1 at 8:00-10:00, then the user can't book room start from 8:00 until 9:59.
    var only1 = onlyNumber.toString().replaceFirst("4", "f");
    var g = only1.split("f");
    var k = int.parse(g[1]);
    var roomNew = int.parse(g[0]);
    // print("here is g:$g,here is room new:$roomNew");
    // var newNumberEndTime = ((k ~/ 100) % 100);
    var newNumberStartTime = (k ~/ 10000);
    // print("here is new end $newNumberEndTime");
    // print("here is new start $newNumberStartTime");

    for (var i = 0; i < bookingtable.length; i++) {
      var j = ((bookingtable[i].toString()).replaceFirst("4", "f")).split("f");
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
        
      }
    }
  }

  mainfunction() {
    //To start the whole funciton, once the object that's created to call this function , then it would execute all function automatically.
    // Test algorithm 1
    testAlgorithm1();
    // ----------------------------------------------------------
    // Test algorithm 2
    testAlgorithm2();
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
          var venue;
          if (venueNumber > 3 && venueNumber <= 13) {
            venue = venueNumber - 1;
          } else if (venueNumber > 13 && venueNumber < 27) {
            venue = venueNumber - 2;
          } else if (venueNumber >= 27 && venueNumber <= 33) {
            venue = venueNumber - 3;
          } else {
            venue = venueNumber;
          }

          final newToDo = LIElement()
            ..text =
                (' Room$venue is already booked at $day/$month/$year from $sth:$stm to $edh:$edm');
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

    // print(bookingtable);
  }
}
