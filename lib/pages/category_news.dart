import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/show_category.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  final String name;

  const CategoryNews({super.key, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //constants
    double margin = 10.0;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            widget.name,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          //list of news
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ShowCategory(
                    Image: categories[index].urlToImage!,
                    desc: categories[index].description!,
                    title: categories[index].title!,
                    url: categories[index].url!);
              }),
        ));
  }
}

//news widget

class ShowCategory extends StatelessWidget {
  final String Image, desc, title, url;

  const ShowCategory(
      {super.key,
      required this.Image,
      required this.desc,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    //constants
    double width = MediaQuery.of(context).size.width;
    double radius = 10;
    double imageHeight = 200;
    double gap1 = 5.0;
    double gap2 = 20.0;
    double fontSize = 18.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: CachedNetworkImage(
              imageUrl: Image,
              width: width,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: gap1,
          ),
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
          Text(
            desc,
            maxLines: 3,
            style: const TextStyle(color: Colors.white54),
          ),
          SizedBox(
            height: gap2,
          ),
        ],
      ),
    );
  }
}
