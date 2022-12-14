import 'package:flutter/material.dart';
import 'package:shadow_api/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String id, title, thumb;
  const Webtoon({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(id: id, title: title, thumb: thumb),
            ));
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(10, 10),
                      blurRadius: 10,
                    )
                  ]),
              child: Image.network(thumb),
            ),
          ),
        ],
      ),
    );
  }
}
