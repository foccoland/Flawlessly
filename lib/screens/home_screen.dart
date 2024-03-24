import 'package:flawlessly/repository/news_repository.dart';
import 'package:flawlessly/widgets/material_news_card.dart';
import '../bloc/news/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String route = "/home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(NewsRepository())..add(LoadNewsEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("News"),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (_, state) {
            switch (state) {
              case final NewsSuccess s:
                return ListView.builder(
                    itemCount: s.news.totalResults,
                    itemBuilder: (context, index) {
                      return MaterialNewsCard(
                        title: "${s.news.articles?[index].title}",
                        description: "${s.news.articles?[index].description}",
                        imageUrl: "${s.news.articles?[index].urlToImage}",
                      );
                    });
              case final NewsLoading _:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case final NewsError _:
                return const Center(
                  child: Text("Error!"),
                );
            }
          },
        ),
      ),
    );
  }
}
