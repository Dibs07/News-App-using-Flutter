import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/const.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/pages/articlepage.dart';
//Newws app using news Api
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio dio = Dio();
  List<Article> news = [];
  void initState(){
    super.initState();
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index){
          final article = news[index];
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticlePage(article: article)));
            },
            leading: Image.network(article.urlToImage ?? "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png", width: 100, height: 150, fit: BoxFit.cover,),
            title: Text(article.title ?? ""),
            subtitle: Text(article.publishedAt??""),
          );
        },
      ),
    );
  }
 Future<void> getNews() async {
    final response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=${API_KEY}');
    final articlejson = response.data['articles'] as List;
    setState(() {
      List<Article> articles = articlejson.map((json) => Article.fromJson(json)).toList();
      articles = articles.where((a)=>a.title!=["Removed"]).toList();
      news=articles;
    });

}
}