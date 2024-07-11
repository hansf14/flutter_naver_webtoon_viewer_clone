import 'package:flutter/material.dart';
import 'package:flutter_naver_webtoon_viewer_clone/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    Key? key,
    required this.title,
    required this.thumb,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          // MaterialPageRoute(
          //   builder: (context) =>
          //       DetailScreen(title: title, thumb: thumb, id: id),
          //   // fullscreenDialog: true,
          //   // `fullscreenDialog: true,`
          //   // 없으면 안드로이드의 경우 - 좀 더 작은 페이지가 커지면서 화면을 채우는 애니메이션 (아이콘의 경우 "<-" 아이콘)
          //   // 없으면 iOS의 경우 - 페이지가 오른쪽에서 왼쪽으로 들어오는 애니메이션 (아이콘의 경우 "<" 아이콘)
          //   // 있으면 안드로이드의 경우 - 없는 경우와 비교해서 애니메이션 차이 없음 (아이콘의 경우 "X" 아이콘)
          //   // 있으면 iOS의 경우 - 페이지가 아래에서 위로 올라오는 애니메이션 (아이콘의 경우 "X" 아이콘)
          // ),
          PageRouteBuilder(
            pageBuilder: (context, anmation, secondaryAnimation) =>
                DetailScreen(id: id, title: title, thumb: thumb),
            // fullscreenDialog: true,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(
                CurveTween(
                  curve: curve,
                ),
              );
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  )
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(thumb),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
