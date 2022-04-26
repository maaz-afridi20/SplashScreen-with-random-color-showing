import 'package:flutter/material.dart';
import 'package:wishes_app/main_page.dart';
import 'package:intl/intl.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// the future.delayed is use to show thing when we want to
// show something little delayed like below
// we first show the good morning screen and then after 5 minutes we showed
// the evenning message
//
// the init state waisay hi use ki hai jo app mein sab say pahlay init state hi
// call hoti hai jo b funtions hain sab say pahlay init state function hi
// build hoti hai
// yaha waisay hi samajnay k liye lagai hai
// init state siraf aik baar hi call hona hai tu hm ye future delayed
// ko b usse mein laga detay hain qk splash screeh humein aik baar hi
// dhikani hai.

//
// also after 5 second this will navigate to the second page
// that we had give. so after 5 second this future.delayed will move the
// splash screen to main page.dart
//
// agar humein chahiey k bss aik hi baar kch chalay tu uss ko init state
// mei laga do tu wo sirf aik hii baar chalay gi
// magar uss ko build context k bahar likhna hoga.
// magar agr koii cheez ko jo humein baar baar chahiuye k wo
// save k sath hi realod ho tu us ko humein build k ander initialize krna hoga.

class _SplashScreenState extends State<SplashScreen> {
  DateTime dateTimeNow = DateTime.now(); // thiss will show the current time.

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      // var newTime = DateFormat('dd-MM').format(
      //    dateTimeNow); // this will only show the date from the dateTimeNow date.
      //print(
      //   newTime); // this will print the time and time that are stored inthat date time variable.

      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return MainPage();
      }));

      setState(() {
        title = "";
      });
    });

    super.initState();
  }

  String title = "Good Morning";

  @override
  Widget build(BuildContext context) {
    // agr hm 2 baar MM likhei tu siraf number of month show hoga
    // agr 4 baar MMMM likh lein tu poora spelling show hoga.
    //
    // var newTime = DateFormat('dd-MMMM-yyyy').format(dateTimeNow);
    int newTime = int.parse(
      DateFormat('kk').format(dateTimeNow),
    ); // in order to show hours 24 hour format.
    // int.parse is just use to change the hours into int format
    // in order to put if else statement

    if (newTime <= 12) {
      title = "Good Morning";
    } else if (newTime > 12 && newTime <= 16) {
      title = "Good AfterNoon";
    } else if (newTime > 16 && newTime <= 21) {
      title = "Good Night";
    } else {
      print('sojaa');
    }

    print(newTime);
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontFamily: 'Austein',
          ),
        ),
      ),
    );
  }
}
