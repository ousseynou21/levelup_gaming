import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:levelup_gaming/models/postcontent.dart';
import 'package:levelup_gaming/models/user.dart';
import 'package:levelup_gaming/screens/profile.dart';
import 'package:provider/provider.dart';

class PostData extends StatefulWidget {
  @override
  _PostDataState createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<User>(context);
    final dataRef = FirebaseDatabase.instance.reference().child('posts');
    return StreamBuilder(
        stream: dataRef.onValue,
        builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
          if (snapshot.hasData) {
            if (snapshot != null) {
              List<PostContent> posts = [];
              Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
              print(map);
              print("alright look agove ----");
              map.forEach((k, v) => posts.add(PostContent(
                    name: v['name'],
                    update: v['update'],
                    notes: v['notes'],
                  )));
              print("what is the problem");
              return Games(posts: posts);
            }
          } else {
            return Container();
          }
        });
  }
}

class Games extends StatefulWidget {
  final List<PostContent> posts;

  Games({this.posts});
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Games> {
  // variables for user email & password

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.posts.length,
              itemBuilder: (context, index) {
                return SinglePost(post: widget.posts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SinglePost extends StatelessWidget {
  final PostContent post;
  SinglePost({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              height: 300,
              width: 400,
              padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                border: Border.all(
                  color: Colors.purple,
                  width: 8,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  30,
                  20,
                  30,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          post.name,
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          post.update,
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Text(
                          post.notes,
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
