import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      backgroundColor: Colors.purple[300],
      title: Center(
        child: Text('New Entry',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      content: SizedBox(height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category -',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
            SizedBox(height: 20,),
            Text('Amount -',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.check, color: Colors.white,))
      ],
    );
  }
}
