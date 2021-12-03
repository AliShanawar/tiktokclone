// ignore_for_file: unused_local_variable, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {Key? key, required this.selectedPageIndex, required this.onIconTap})
      : super(key: key);

  final int selectedPageIndex;
  final Function onIconTap;

  get iconName => null;

  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.08;
    final style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 15, fontWeight: FontWeight.w600);
    return BottomAppBar(
      color: selectedPageIndex == 0 ? Colors.white : Colors.white,
      // child: Container(

      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       __BottombarNavItem(0, 'Home', style, 'home'),
      //       __BottombarNavItem(1, 'Discover', style, 'discover'),
      //       _addVideoNavItem(barHeight),
      //       __BottombarNavItem(3, 'Inbox', style, 'message'),
      //       __BottombarNavItem(4, 'Profile', style, 'account')
      //     ],
      //   ),
      // ),
    );
  }

  __BottombarNavItem(
      int index, String label, TextStyle textStyle, String iconName) {
    bool isSelected = selectedPageIndex == index;
    Color iconAndTextColor = isSelected ? Colors.black : Colors.grey;
    if (isSelected && selectedPageIndex == 0) {
      iconAndTextColor = Colors.white;
    }

    return GestureDetector(
      onTap: () => {onIconTap(index)},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/${isSelected ? iconName + '_filled' : iconName}.svg',
            color: iconAndTextColor,
          ),
          SizedBox(height: 3),
          Text(label, style: textStyle.copyWith(color: iconAndTextColor)),
        ],
      ),
    );
  }

  _addVideoNavItem(double height) {
    return Container(
      height: height - 10,
      width: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.redAccent],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Container(
            width: 41,
            height: height - 15,
            decoration: BoxDecoration(
                color: selectedPageIndex == 0 ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.add,
                color: selectedPageIndex == 0 ? Colors.black : Colors.white)),
      ),
    );
  }
}
