import 'package:budget_tracker/pages/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/pages/home.dart';
import 'package:budget_tracker/pages/expense_screen.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=> Home(),
      '/expenses':(context)=> Expenses(),
    },
  ));
}

