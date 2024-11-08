import 'package:flutter/material.dart';
import 'package:animations/animations.dart';  // Import animations package
import 'package:newsapp/model/new_model.dart';
import 'package:newsapp/screen/home_screen.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const NewsHomeScreen();
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  );
                },
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              newsModel.title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Expanded(
                  child: Text(
                    "- ${newsModel.author!}",
                    maxLines: 1,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Image.network(newsModel.urlToImage!),
            const SizedBox(height: 10),
            Text(
              newsModel.content!,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              newsModel.description!,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
