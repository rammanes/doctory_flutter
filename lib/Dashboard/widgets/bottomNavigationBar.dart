import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import '../../colors.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index=0;
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home, color: iColor,), ),
    NavigationItem(Icon(Icons.help_outline_outlined), ),
    NavigationItem(Icon(Icons.crop_square_rounded), ),
    NavigationItem(Icon(Icons.file_copy), ),
    NavigationItem(Icon(Icons.circle_notifications), ),

  ];
  Widget _buildNavBarItem(NavigationItem item, bool isSelected ){
    return Row(
      children: [
        item.icon
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 60,
      padding: EdgeInsets.only(left:15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item){
          var itemIndex= items.indexOf(item);
          return GestureDetector(
            onTap: (){
              index = itemIndex;
              print(" The value meant to be here     ${index} ");
            },
            child: _buildNavBarItem(item, index == itemIndex),
          );
        }).toList(),
      ),
    );
  }
}
class NavigationItem{
  final Icon icon;


  NavigationItem(this.icon);
}