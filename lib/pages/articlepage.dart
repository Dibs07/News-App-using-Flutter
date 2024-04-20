import 'package:flutter/material.dart';
import 'package:newsapp/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatefulWidget {
  final Article article;
  const ArticlePage({super.key, required this.article});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title ?? ""),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.network(
                  widget.article.urlToImage ??
                      "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                  width: 100,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.title ?? "",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Author: ${widget.article.author}" ??
                            "Author not found",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        widget.article.description ?? "",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        widget.article.content ?? "",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(widget.article.publishedAt ?? ""),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _launchUrl(Uri.parse(widget.article.url ?? ""));
              },
              child: Text("Read More"),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
