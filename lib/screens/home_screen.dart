import 'package:flutter/material.dart';
import 'package:flutter_naver_webtoon_viewer_clone/models/webtoon_model.dart';
import 'package:flutter_naver_webtoon_viewer_clone/services/api_service.dart';
import 'package:flutter_naver_webtoon_viewer_clone/widgets/webtoon_widget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<WebtoonModel> webtoons = [];
//   bool isLoading = true;

//   void waitForWebtoons() async {
//     webtoons = await ApiService.getTodaysToons();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     waitForWebtoons();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print(webtoons);
//     // print(isLoading);

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "오늘의 웹툰",
//           style: TextStyle(
//             fontSize: 24,
//           ),
//         ),
//         foregroundColor: Colors.green,
//         backgroundColor: Colors.white,
//         elevation: 2,
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(webtoons);
    // print(isLoading);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        builder: (context, AsyncSnapshot snapshot) {
          // if (snapshot.hasData) {
          //   return const Text("There is data!");
          // } else {
          //   return const Text("Loading");
          // }

          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: webtoons,
      ),
    );
  }

  ListView makeList(AsyncSnapshot<dynamic> snapshot) {
    // return ListView(
    //   children: [
    //     for (var webtoon in snapshot.data) Text(webtoon.title)
    //   ],
    // );

    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     // print(index);
    //     var webtoon = snapshot.data[index];
    //     return Text(webtoon.title);
    //   },
    //   scrollDirection: Axis.horizontal,
    //   itemCount: snapshot.data.length,
    // );

    return ListView.separated(
      itemBuilder: (context, index) {
        // print(index);
        var webtoon = snapshot.data[index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
    );
  }
}
