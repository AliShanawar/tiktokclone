// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktokclone/_mock_data/mock.dart';
import 'package:tiktokclone/model/video.dart';

class HomePageBar extends StatefulWidget {
  const HomePageBar({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  State<HomePageBar> createState() => _HomePageBarState();
}

class _HomePageBarState extends State<HomePageBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 13,
          color: Colors.white,
        );
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _sideBarItem('heart', widget.video.Likes, style),
          _sideBarItem('search', widget.video.SearchQuery, style),
          _sideBarItem('whatsapp', widget.video.Share, style),
          _sideBarItem('phone', widget.video.Phonenumber, style),

          // AnimatedBuilder(
          //     animation: _animationController,
          //     child: Stack(
          //       alignment: Alignment.center,
          //       children: [
          //         Container(
          //           height: 50,
          //           width: 50,
          //           child: Image.asset('assets/disc.png'),
          //         ),
          //         CircleAvatar(
          //           radius: 12,
          //           backgroundImage: NetworkImage(
          //               'https://images.app.goo.gl/thFvQr9W6Rq9zDAB6'),
          //         )
          //       ],
          //     ),
          //     builder: (context, child) {
          //       return Transform.rotate(
          //         angle: _animationController.value *
          //             3 *
          //             pi *
          //             _animationController.value,
          //         child: child,
          //       );
          //     })
        ],
      ),
    );
  }

  _sideBarItem(String iconName, String label, TextStyle style) {
    return Column(
      children: [
        SvgPicture.asset('assets/$iconName.svg',
            width: 40, height: 40, color: Colors.white.withOpacity(0.90)),
        SizedBox(height: 2),
        Text(label, style: style)
      ],
    );
  }

  _profileImageButton(String imegeUrl) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.cover,
              image:
                  NetworkImage('https://images.app.goo.gl/thFvQr9W6Rq9zDAB6'),
            ),
          ),
        ),
        Positioned(
            bottom: -10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(25)),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ))
      ],
    );
  }
}
