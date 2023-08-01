import 'package:flutter/material.dart';
import '../../model/posts_model.dart';
import '../../service/repository/post_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postModel = [];

  @override
  void initState() {
    super.initState();
    ApiServices.postRepository().then((value) {
      postModel = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: postModel.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("${postModel[index].id}"),
              title: Text(postModel[index].title),
              subtitle: Text(postModel[index].body),
            );
          }),
    );
  }
}
