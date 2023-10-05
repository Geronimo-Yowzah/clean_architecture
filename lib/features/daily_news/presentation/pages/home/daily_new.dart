import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:clean_architecture/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({super.key});

  @override
  State<DailyNews> createState() => _GetPageState();
}

class _GetPageState extends State<DailyNews> {

  @override
  void initState() {
    context.read<RemoteArticleBloc>().add(const GetArticles());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }
}

_buildAppbar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Daily News',
      style: TextStyle(color: Colors.black),
    ),
    actions: [
      GestureDetector(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.bookmark, color: Colors.black),
        ),
      ),
    ],
  );
}

_buildBody() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
    builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteArticlesError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteArticlesDone) {
        // return Container(child: ArticleWidget(),);
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (context, index) {
            final data = state.articles![index];
            return Card(
              color: Colors.grey.shade100,
              margin: const EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text('Id: ${data.id}, Title: ${data.title}'),
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: Text('Body ${data.body}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => {}
                            // context.go('/edit', extra: data)
                      // Navigator.pushNamed(
                      // context, AppRoute.edit,
                      // arguments: data),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // saveDelete(data.id.toString());
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
      return const SizedBox();
    },
  );
}
