// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, sized_box_for_whitespace, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tiktokclone/_mock_data/mock.dart';
import 'package:tiktokclone/widgets/home_side_bar.dart';
import 'package:tiktokclone/widgets/video_detail.dart';
import 'package:tiktokclone/widgets/video_title.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isjucicy = true;
  int _sanppedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isjucicy = true;
                  })
                },
                child: Text(
                  "Juicy",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: _isjucicy ? 18 : 25,
                        color: _isjucicy ? Colors.white : Colors.grey,
                      ),
                ),
              ),
              Text(
                "  |  ",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      color: !_isjucicy ? Colors.white : Colors.grey,
                    ),
              ),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isjucicy = false;
                  })
                },
                child: Text(
                  "Shopping",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: !_isjucicy ? 18 : 14,
                        color: Colors.grey,
                      ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            PopupOptionMenu(),
          ],
        ),
        body: PageView.builder(
            onPageChanged: (int page) => {
                  setState(() {
                    _sanppedPageIndex = page;
                  })
                  // print("page chnage to $page")
                },
            scrollDirection: Axis.vertical,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoTite(
                    video: videos[index],
                    currentIndex: index,
                    sanppedPageIndex: _sanppedPageIndex,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: VideoDetail(
                              video: videos[index],
                            ),
                          )),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.75,
                          child: HomePageBar(video: videos[index]),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }));
  }
}

enum MenuOption {
  privacypolicy,
  Rateus,
  Maybelater,
}

class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(itemBuilder: (BuildContext context) {
      return <PopupMenuEntry<MenuOption>>[
        PopupMenuItem(
            child: Text('privacy policy'), value: MenuOption.privacypolicy),
        PopupMenuItem(child: Text('Rate us'), value: MenuOption.Rateus),
        PopupMenuItem(child: Text('Maybe Later'), value: MenuOption.Maybelater),
      ];
    });
  }
}
