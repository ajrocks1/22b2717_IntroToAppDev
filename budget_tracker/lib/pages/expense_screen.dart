import 'package:budget_tracker/services/card.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/pages/add_expense.dart';
import 'package:budget_tracker/pages/home.dart';
CardData item1 = CardData(Category: 'Groceries', Amount: 2000,);
CardData item2 = CardData(Category: 'Bill', Amount: 5000);
CardData item3 = CardData(Category: 'Salary', Amount: 50000);

class Expenses extends StatefulWidget {
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text(
          'Budget Tracker',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text('Total',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Text('$total',
                      style: TextStyle(
                          fontSize: 30
                      ) ,
                    ),
                  ),
                  IconButton(
                      onPressed: (){Navigator.pop(context);},
                      icon: Icon(Icons.file_upload_outlined,
                        size: 40,)
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 50,),
          item1.CardTemplate(),
          item2.CardTemplate(),
          item3.CardTemplate(),
        ],
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          child: Icon(Icons.add_card_outlined,),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return AddExpense();
                }
            );
          },
          backgroundColor: Colors.purpleAccent[100],
        ),
      ),
    );
  }
}
