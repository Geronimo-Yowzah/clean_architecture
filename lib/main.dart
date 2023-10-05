import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/config/theme/app_themes.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/pages/home/daily_new.dart';
import 'package:clean_architecture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final getPage = BlocProvider<RemoteArticleBloc>(create: (context) => RemoteArticleBloc(sl()));

    return MultiBlocProvider(
      providers: [getPage],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const DailyNews()
      ),
    );
  }
}


