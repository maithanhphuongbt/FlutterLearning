import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final double topRight;
  final double bottomRight;

  InputWidget(this.topRight, this.bottomRight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 30, left: 40),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(topRight),
                  topRight: Radius.circular(topRight))),
          child: new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "User name",
                      hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Pass word",
                      hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
