import 'package:budget_tracker/pages/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/pages/expense_screen.dart';

int total = item1.Amount+item2.Amount+item3.Amount;
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,40,0,0),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.account_circle_rounded,
                size: 150,
                color: Colors.grey[600],
              ),
              SizedBox(height: 20,),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900
                ),
              ),
              Divider(
                height: 40,
                thickness:3,
                indent: 50,
                endIndent: 50,
                color: Colors.purpleAccent[100],
              ),
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
                          onPressed: (){Navigator.pushNamed(context, '/expenses');},
                          icon: Icon(Icons.archive_rounded,
                            size: 40,)
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
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
