import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:symptotrack/album.dart';
import 'package:symptotrack/result.dart';

Future<Album> createAlbum(File imagefile) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://2d28-103-51-148-39.ngrok-free.app/predict'));
  request.files.add(await http.MultipartFile.fromPath('image', imagefile.path));

  var response = await request.send();

  if (response.statusCode == 200) {
    var responseString = await response.stream.bytesToString();
    var json = jsonDecode(responseString);
    return Album.fromJson(json);
  } else {
    throw Exception('Failed to create album.');
  }
}

Future<File> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}

class HomeScreen extends StatefulWidget {
  static String route = 'Route';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File imageFile;
  Future<Album> _futureAlbum;
  int k = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          'Sympto track',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        child: imageFile == null && _futureAlbum == null
            ? Center(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Let's check if you have Malaria!!!",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 30),
                      ),
                    ),
                    Center(
                      child: Lottie.asset(
                        'assets/sick.json', // Replace with your animation file path
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            //color: Colors.greenAccent,
                            onPressed: () async {
                              //pickImage;
                              imageFile = await pickImage();
                              setState(() {
                                _futureAlbum = createAlbum(imageFile);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              onPrimary: Theme.of(context).canvasColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 24.0,
                              ),
                            ),
                            child: Text(
                              "Let's check",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).canvasColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : FutureBuilder<Album>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Result(snapshot.data.result, imageFile);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  );
                },
              ),
      )),
    );
  }
}
