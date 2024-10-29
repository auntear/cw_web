import 'package:flutter/material.dart';
import 'package:my_cw_web/main/process/manage_img_1.dart';
import 'package:my_cw_web/main/process/manage_img_2.dart';

enum PageSelection { manageIMG, manageIMG2 }

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  ManagePageState createState() => ManagePageState();
}

class ManagePageState extends State<ManagePage> {
  PageSelection? selectedPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Welcome to Manage Page',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          // ส่วนกลาง
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              color: Colors.blueAccent, // พื้นหลังส่วนกลาง
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {
                              setState(() {
                                selectedPage = PageSelection.manageIMG;
                              });
                            },
                            child: const Text(
                              'เพิ่มรูปภาพ Slide หน้าแรก',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () {
                              setState(() {
                                selectedPage = PageSelection.manageIMG2;
                              });
                            },
                            child: const Text(
                              'เพิ่มรูปภาพ Slide หน้าสอง',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'ส่วนต่อขยาย2.1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'ส่วนต่อขยาย2.2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'ส่วนต่อขยาย2.3',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // ส่วนล่างแสดงผล
          Expanded(
            child: Container(
              color: Colors.amber,
              child: Builder(
                builder: (context) {
                  switch (selectedPage) {
                    case PageSelection.manageIMG:
                      return const ManageIMG01();
                    case PageSelection.manageIMG2:
                      return const ManageIMG02();
                    default:
                      return const Center(
                        child: Text('Please select an option'),
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
