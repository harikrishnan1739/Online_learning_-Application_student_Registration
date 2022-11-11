import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/Add_Student.dart';
import 'package:hive_project/Edit_Screen.dart';
import 'package:hive_project/SearchStudent.dart';
import 'package:hive_project/Student_Details.dart';
import 'package:hive_project/model/Student_model.dart';
// ignore: duplicate_import
import 'Add_Student.dart';

class ViewStudents extends StatefulWidget {
  const ViewStudents({Key? key}) : super(key: key);

  @override
  State<ViewStudents> createState() => _ViewStudentsState();
}

final _search = TextEditingController();

class _ViewStudentsState extends State<ViewStudents> {
  Box<StudentModal>? studentBox;

  @override
  void initState() {
    // Hive.openBox<StudentModal>('Student_db');

    studentBox = Hive.box<StudentModal>('Student_db');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Students'),
        backgroundColor: Colors.blue,
        leading: (IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back))),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => searchstudent())));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: studentBox!.listenable(),
              builder: ((BuildContext context, Box<StudentModal> studentList,
                  Widget? child) {
                return ListView.separated(
                    itemBuilder: ((context, index) {
                      final key = studentList.keys.toList()[index];
                      final student = studentList.get(key);

                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => StudentDetail(
                                    student: student!,
                                  ))));
                        },
                        title: Text(student!.name),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                deletestudent(student.key);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) => EditStudent(
                                            student: student,
                                          )),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ))
                          ],
                        ),
                        // ignore: prefer_const_constructors
                        leading: CircleAvatar(
                            backgroundImage:
                                const AssetImage('assets/user.jpg')),
                      );
                    }),
                    separatorBuilder: ((context, index) => const Divider()),
                    itemCount: studentBox!.values.length);
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudent()),
          );
        },
      ),
    );
  }

  Future<void> deletestudent(int key) async {
    studentBox!.delete(key);
    showDeletedAlertBox(context);
  }

  void showDeletedAlertBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Column(
              children: const [
                Text("Student Deleted"),
                Divider(),
              ],
            ),
            content:
                const Text("Student deleted successfully from the database"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      ctx,
                      MaterialPageRoute(
                          builder: (context) => const ViewStudents()),
                      (route) => false);
                  // Navigator.pop(ctx);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }
}
