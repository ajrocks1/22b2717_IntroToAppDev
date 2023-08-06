import 'package:brew_crew/models/UserID.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:brew_crew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/main.dart';

int? total;

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  String expense = '';
  int? money = 0;
  Future getData() async {
    var collection = FirebaseFirestore.instance.collection('Total');
    var docSnapshot = await collection.doc('total').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      // You can then retrieve the value from the Map like this:
      total = data['total'];
      return total;
    }
  }

  void foo() async {
    total = await getData();
  }

  @override
  void setState(VoidCallback fn) {
    foo();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("Budget Tracker"),
          titleTextStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        body: Container(
          color: Colors.pink[300],
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 65,
              ),
              Container(
                height: 55,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.pink[100],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: DefaultTextStyle(
                        child: Text("Total:"),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2),
                      ),
                    ),
                    DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 21.5,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                        child: Text("$total")),
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.expand_circle_down_outlined,
                          size: 30,
                          color: Colors.black38,
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.pink[100],
                          shape: CircleBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 500,
                color: Colors.pink[300],
                child: Scaffold(
                  backgroundColor: Colors.pink[300],
                  body: BrewList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  backgroundColor: Colors.pink[600],
                  scrollable: true,
                  title: Center(child: Text("New Entry")),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            onChanged: (value) => setState(() {
                              expense = value;
                            }),
                            decoration: const InputDecoration(
                              labelText: "Category:",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          TextFormField(
                            onChanged: (value) => setState(() {
                              money = int.parse(value);
                            }),
                            decoration: const InputDecoration(
                                labelText: "Price:",
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[600],
                          shadowColor: Colors.transparent,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10)),
                      child: Icon(
                        Icons.check_circle_rounded,
                        size: 50,
                      ),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('Categories')
                            .add({'expense': expense, 'value': money});
                        DatabaseService().updateTotal(total! + money!);
                        setState(() {
                          foo();
                          HomeState().foo();
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.pink,
            size: 40,
          ),
        ),
      ),
    );
  }
}
