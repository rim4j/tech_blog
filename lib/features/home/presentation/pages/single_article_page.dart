import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech_blog/features/home/presentation/bloc/single_article_status.dart';

class SingleArticlePage extends StatefulWidget {
  final String id;

  const SingleArticlePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SingleArticlePage> createState() => _SingleArticlePageState();
}

class _SingleArticlePageState extends State<SingleArticlePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context)
        .add(LoadSingleArticleEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          if (homeState.singleArticleStatus is SingleArticleLoading) {
            return Center(
              child: Text("loading"),
            );
          }

          if (homeState.singleArticleStatus is SingleArticleCompleted) {
            return Center(
              child: Text("success"),
            );
          }

          if (homeState.singleArticleStatus is SingleArticleError) {
            return Center(
              child: Text("error"),
            );
          }

          return Container();
        },
      ),
    );
  }
}
// BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, homeState) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(widget.id),
//           ),
//         );
//       },
//     );