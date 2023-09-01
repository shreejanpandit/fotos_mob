import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:fotos_mobile/repository/image_open_repository.dart';
import 'package:fotos_mobile/res/app_urls.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/utils.dart';

final imgOpenRepo = ImageOpenRepository(); // Initialize imgOpenRepo

class Test extends StatefulWidget {
  final Map<String, dynamic> data;

  Test(this.data);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List<Map<String, dynamic>> filedata = []; // Initialize as an empty list

  @override
  void initState() {
    super.initState();
    // var comments = widget.data['data']['comments'][0]['commented_user']['name'];
    // print(comments);
    if (widget.data['data']['comments'].length == 0) {
      filedata = [];
    } else {
      for (var i = widget.data['data']['comments'].length - 1; i >= 0; i--) {
        String imagePath = widget.data['data']['comments'][i]['commented_user']
                ['image_path']
            .toString();
        String imageUrl;

        if (imagePath.startsWith('http')) {
          imageUrl = imagePath;
        } else {
          imageUrl = '$imagePath';
        }

        print(
            'comment done by ${widget.data['data']['comments'][i]['commented_user']['name']}');

        var value = {
          'name': widget.data['data']['comments'][i]['commented_user']['name'],
          'pic': imageUrl,
          'message': widget.data['data']['comments'][i]['comment'],
          'date': widget.data['data']['comments'][i]['media']['created_at'],
        };

        filedata.add(value);
      }
    }

    // for (var comment in comments) {
    //   var commentedUserData = comment['commented_user'];
    //   var value = {
    //     'name': commentedUserData['name'],
    //     'pic': commentedUserData['image_path'],
    //     'message': comment['comment'],
    //     'date': comment['created_at'],
    //   };
    //   filedata.add(value);
    // }
  }

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'] == null
                              ? 'assets/branding/images/avatar.png'
                              : '${AppUrl.baseImageStorageUrl}${data[i]['pic']}')),
                  // onError: (exception, stackTrace) {
                  //   // If loading the network image fails, use the default asset image.
                  //   return AssetImage('assets/branding/images/avatar.png');
                  // },
                ),
              ),
              title: Text(
                data[i]['name'] ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message'] ?? ''),
              trailing:
                  Text(data[i]['date'] ?? '', style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Section"),
        backgroundColor: CustomTheme.secondaryColor,
      ),
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "assets/branding/images/avatar.png"),
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () async {
            if (formKey.currentState!.validate()) {
              print(commentController.text);

              Map data = {
                "media_id": widget.data['data']['id'],
                "comment": commentController.text.trim().toString()
              };
              print('comment : $data');
              try {
                dynamic response = await imgOpenRepo.postComment(data);
                var commentedUserData = response['data']['commented_user'];
                var comment = response['data']['comment'];

                setState(() {
                  var value = {
                    'name': commentedUserData['name'],
                    'pic': commentedUserData['image_path'],
                    'message': comment,
                    'date': '${DateTime.now()}',
                  };
                  filedata.insert(0, value);
                });

                Utils.flushBarSucessMessage(
                  'Comment posted successfully',
                  context,
                );
              } catch (error) {
                print('Error posting comment message: $error');
                // Handle the error or show a message to the user
              }

              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: CustomTheme.primaryColor,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(home: Test()));
// }
