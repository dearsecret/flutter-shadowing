import 'package:flutter/material.dart';
import 'package:shadow_api/models/webtoon_models.dart';
import 'package:shadow_api/services/api_services.dart';

class DetailScreen extends StatefulWidget {
  final String id, title, thumb;
  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetail> detail;
  late Future<List<Episodes>> episodes;
  @override
  void initState() {
    super.initState();
    detail = ApiServices.getDetail(widget.id);
    episodes = ApiServices.getEpisodes(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.black.withOpacity(0.8),
        foregroundColor: Colors.yellow.shade800,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 22),
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
                tag: widget.id,
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
                    child: Image.network(widget.thumb)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
