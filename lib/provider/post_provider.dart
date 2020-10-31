import 'package:flutter/foundation.dart';
import 'package:nextflow_personal_post/models/post_model.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  addNewPost(String postMessage) {
    var post = Post(message: postMessage, createDate: DateTime.now());
    _posts.insert(0, post);

    notifyListeners();
  }
}
