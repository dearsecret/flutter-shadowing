import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String id, title, thumb;
  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

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
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Image.network(thumb)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
