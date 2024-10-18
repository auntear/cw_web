import 'package:flutter/material.dart';
import 'package:my_cw_web/main/page/aboutpage.dart';
import 'package:my_cw_web/main/page/homepage.dart';
import 'package:my_cw_web/main/page/loginpage.dart';
import 'package:my_cw_web/main/page/webbordpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // จำนวน Tab
      child: Scaffold(
        body: Column(
          children: [
            // หัว ///////////////////////////////////////////////////////////////////////////////////////////////////////
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              height: 60,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Image.asset(
                      'assets/images/logoweb.webp',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Spacer(),
                  // TabBar
                  Expanded(
                    child: TabBar(
                      onTap: (int index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      indicatorColor: Colors.amber,
                      tabs: const <Widget>[
                        Tab(
                          icon: Icon(Icons.home),
                          text: 'หน้าหลัก',
                        ),
                        Tab(
                          icon: Icon(Icons.notifications),
                          text: 'เกี่ยวกับ รพ.',
                        ),
                        Tab(
                          icon: Icon(Icons.messenger),
                          text: 'เว็บบอร์ด',
                        ),
                        Tab(
                          icon: Icon(Icons.person_pin),
                          text: 'ลงชื่อเข้าใช้',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),

            // แสดงเนื้อหาตาม Tab ที่เลือก
            const Expanded(
              child: TabBarView(
                children: [
                  HomeIndex(), // หน้าหลัก
                  AboutPage(), // เกี่ยวกับ รพ.
                  WebboardPage(), // เว็บบอร์ด
                  LoginPage(), // ลงชื่อเข้าใช้
                ],
              ),
            ),

            // ล่าง ///////////////////////////////////////////////////////////////////////////////////////////////////////
            Container(
              color: Colors.blue,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MainPage()));
}
