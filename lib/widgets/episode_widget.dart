import 'package:flutter/material.dart';
import 'package:flutter_naver_webtoon_viewer_clone/models/webtoon_episode_model.dart';
// import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher_string.dart' as UrlStringLauncher;

class Episode extends StatelessWidget {
  final WebtoonEpisodeModel episode;
  final String webtoonId;

  const Episode({
    Key? key,
    required this.episode,
    required this.webtoonId,
  }) : super(key: key);

  void onButtonTap() async {
    // final url = Uri.parse("https://google.com");
    // await UrlLauncher.launchUrl(url);

    // const urlString = "https://google.com";
    final urlString =
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}";
    await UrlStringLauncher.launchUrlString(
      urlString,
      mode: UrlStringLauncher.LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        // margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            // color: Colors.green.shade400,
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              20,
            ),
            border: Border.all(
              color: Colors.green.shade300,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(5, 5),
                color: Colors.black.withOpacity(0.1),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  episode.title,
                  style: TextStyle(
                    // color: Colors.white,
                    color: Colors.green.shade300,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
