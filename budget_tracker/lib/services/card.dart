import 'package:flutter/material.dart';


class CardData{
  String Category;
  int Amount;

  CardData({required this.Category, required this.Amount});
  Widget CardTemplate() {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(Category,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Text('$Amount',
                      style: TextStyle(
                          fontSize: 25
                      ) ,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
          child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.delete,
              size: 30,)),
        )
      ],
    );
  }
}
