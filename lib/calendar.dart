import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o2scheduler/phone.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://calendar.google.com/calendar');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

final Uri _mapsurl = Uri.parse('https://www.google.com/maps/');
Future<void> _mapslaunchUrl() async {
  if (!await launchUrl(_mapsurl)) {
    throw Exception('Could not launch $_mapsurl');
  }
}

String adminusername = "";
String adminpassword = "";
String userusername = "";
String userpassword = "";

class calendarpage extends StatefulWidget {
  const calendarpage({super.key});

  @override
  State<calendarpage> createState() => _calendarpageState();
}

class _calendarpageState extends State<calendarpage> {
  var guesturl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "O2Two",
          style: TextStyle(
            fontFamily: "sfpro",
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF52B6DF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                CupertinoIcons.calendar_today,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => phone()),
              );
            },
            icon: Icon(
              CupertinoIcons.phone,
              color: Colors.white,
              size: 25,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Card(
            color: Colors.black,
            child: TableCalendar(
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                    fontFamily: "sfpro", fontSize: 18, color: Colors.white),
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronIcon: Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.white,
                ),
                rightChevronIcon: Icon(
                  CupertinoIcons.arrow_right,
                  color: Colors.white,
                ),
              ),
              calendarStyle: CalendarStyle(
                outsideTextStyle:
                    TextStyle(fontFamily: "sfpro", color: Colors.grey),
                weekendTextStyle:
                    TextStyle(fontFamily: "sfpro", color: Colors.white),
                defaultTextStyle:
                    TextStyle(fontFamily: "sfpro", color: Colors.white),
                todayTextStyle:
                    TextStyle(fontFamily: "sfpro", color: Colors.black),
                todayDecoration: BoxDecoration(
                    color: Color(0xFF52B6DF), shape: BoxShape.circle),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle:
                    TextStyle(fontFamily: "sfpro", color: Colors.white),
                weekendStyle:
                    TextStyle(fontFamily: "sfpro", color: Colors.white),
              ),
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2040, 12, 31),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  "Events :",
                  style: TextStyle(
                      fontFamily: "sfpro", color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 15),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.lock,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.black,
                            surfaceTintColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                color: Color(0xFF52B6DF),
                              ),
                            ),
                            icon: Icon(
                              CupertinoIcons.lock_open,
                              color: Colors.white,
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        "Admin User Login",
                                        style: TextStyle(
                                            fontFamily: "sfpro",
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "User Name:",
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      adminusername = value;
                                    },
                                    onSubmitted: (value) {
                                      adminusername = value;
                                    },
                                    autofocus: true,
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(CupertinoIcons.lock),
                                      prefixIconColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF52B6DF),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: "sfpro",
                                        color: Colors.white,
                                      ),
                                      hintText: "UserName",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Password:",
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      adminpassword = value;
                                    },
                                    onSubmitted: (value) {
                                      adminpassword = value;
                                    },
                                    autofocus: true,
                                    obscureText: true,
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(CupertinoIcons.personalhotspot),
                                      prefixIconColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF52B6DF),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: "sfpro",
                                        color: Colors.white,
                                      ),
                                      hintText: "Password",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Color(0xFF52B6DF),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                "Go Back",
                                                style: TextStyle(
                                                    fontFamily: "sfpro",
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (adminusername == "admin" &&
                                                  adminpassword == "admin") {
                                                _launchUrl();
                                              }
                                              ;
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Color(0xFF52B6DF),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                "Proceed",
                                                style: TextStyle(
                                                    fontFamily: "sfpro",
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF52B6DF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Center(
                            child: Text(
                              "Admin Events",
                              style: TextStyle(
                                  fontFamily: "sfpro",
                                  color: Colors.black,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 15),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.person_2,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.black,
                            surfaceTintColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                color: Color(0xFF52B6DF),
                              ),
                            ),
                            icon: Icon(
                              CupertinoIcons.person_2,
                              color: Colors.white,
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        "Normal User Login",
                                        style: TextStyle(
                                            fontFamily: "sfpro",
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "User Name:",
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      userusername = value;
                                    },
                                    onSubmitted: (value) {
                                      userusername = value;
                                    },
                                    autofocus: true,
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(CupertinoIcons.lock),
                                      prefixIconColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF52B6DF),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: "sfpro",
                                        color: Colors.white,
                                      ),
                                      hintText: "UserName",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Password:",
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      userpassword = value;
                                    },
                                    onSubmitted: (value) {
                                      userpassword = value;
                                    },
                                    obscureText: true,
                                    autofocus: true,
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(CupertinoIcons.personalhotspot),
                                      prefixIconColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF52B6DF),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: "sfpro",
                                        color: Colors.white,
                                      ),
                                      hintText: "Password",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Color(0xFF52B6DF),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                "Go Back",
                                                style: TextStyle(
                                                    fontFamily: "sfpro",
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (userusername == "user" &&
                                                  userpassword == "user") {
                                                _launchUrl();
                                              }
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Color(0xFF52B6DF),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                "Proceed",
                                                style: TextStyle(
                                                    fontFamily: "sfpro",
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF52B6DF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Center(
                            child: Text(
                              "User Events",
                              style: TextStyle(
                                  fontFamily: "sfpro",
                                  color: Colors.black,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.black,
                            surfaceTintColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                              side: BorderSide(
                                color: Color(0xFF52B6DF),
                              ),
                            ),
                            icon: Icon(
                              CupertinoIcons.person,
                              color: Colors.white,
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        "Guest Events",
                                        style: TextStyle(
                                            fontFamily: "sfpro",
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Join Link:",
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    onChanged: (guestvalue) {
                                      guesturl = guestvalue;
                                    },
                                    onSubmitted: (guestvalue) {
                                      guesturl = guestvalue;
                                    },
                                    autofocus: true,
                                    style: TextStyle(
                                      fontFamily: "sfpro",
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(CupertinoIcons.link),
                                      prefixIconColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF52B6DF),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(
                                        fontFamily: "sfpro",
                                        color: Colors.white,
                                      ),
                                      hintText: "Link",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Color(0xFF52B6DF),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                "Go Back",
                                                style: TextStyle(
                                                    fontFamily: "sfpro",
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              print(guesturl);
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Color(0xFF52B6DF),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                "Join",
                                                style: TextStyle(
                                                    fontFamily: "sfpro",
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF52B6DF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Center(
                            child: Text(
                              "Guest Events",
                              style: TextStyle(
                                  fontFamily: "sfpro",
                                  color: Colors.black,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: const Text(
              "Other Features",
              style: TextStyle(
                  fontFamily: "sfpro", color: Colors.white, fontSize: 20),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 120,
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF52B6DF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Container(
                      height: 115,
                      width: (MediaQuery.of(context).size.width / 2) - 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.alarm,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: 120,
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF52B6DF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Container(
                      height: 115,
                      width: (MediaQuery.of(context).size.width / 2) - 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _mapslaunchUrl();
                        },
                        icon: Icon(
                          CupertinoIcons.location,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 120,
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF52B6DF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Container(
                      height: 115,
                      width: (MediaQuery.of(context).size.width / 2) - 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.book,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: 120,
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF52B6DF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Container(
                      height: 115,
                      width: (MediaQuery.of(context).size.width / 2) - 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
