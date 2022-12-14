import 'package:flutter/material.dart';
import 'package:shadow_api/models/webtoon_models.dart';
import 'package:shadow_api/services/api_services.dart';
import 'package:shadow_api/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  Future<List<TodaysWebtoon>> webtoons = ApiServices.getTodaysWebtoon();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.black.withOpacity(0.8),
        foregroundColor: Colors.yellow.shade800,
        title: const Text(
          "Shadowing Webtoon App",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Text("...");
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<TodaysWebtoon>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final webtoon = snapshot.data![index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Webtoon(
              id: webtoon.id,
              title: webtoon.title,
              thumb: webtoon.thumb,
            ),
          ],
        );
      },
      itemCount: snapshot.data!.length,
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }
}
