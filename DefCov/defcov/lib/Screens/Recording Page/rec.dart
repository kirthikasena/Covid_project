import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:defcov/Components/gradient_button.dart';
import 'package:defcov/api/recorder.dart';
import 'package:defcov/constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:defcov/Screens/Results Page/result_page.dart';
import 'package:defcov/Screens/Results%20Page/positive.dart';
import 'package:defcov/Screens/Results%20Page/negative.dart';

class Recorder extends StatefulWidget {
  final String text;

  const Recorder({Key? key, required this.text}) : super(key: key);

  @override
  _RecorderState createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  final recorder = SoundRecorder();
  var pathfile;
  IconData _recordIcon = Icons.mic;
  String _recordText = 'Click To Start';

  @override
  void initState() {
    super.initState();

    recorder.init();
  }

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var page;
    var url;
    final isRecording = recorder.isRecording;
    final _recordIcon = isRecording ? Icons.stop : Icons.mic;
    return Stack(
      alignment: Alignment.center,
      children: [
        MaterialButton(
          color: Color.fromARGB(255, 204, 193, 255),
          onPressed: () async {
            final isRecording = await recorder.recprocces();
            setState(() {});
            Timer(Duration(seconds: 4), () {
              setState(() async {
                final isRecording = await recorder.recprocces();
                setState(() {});
                pathfile = await recorder.path;
                print(pathfile);

                switch (widget.text) {
                  case "Shallow cough":
                    url = "http://10.0.2.2:5000/shallow_cough";
                    break;

                  case "Vowel O":
                    url = "http://10.0.2.2:5000/vowel_O";
                    break;

                  case "Vowel E":
                    url = "http://10.0.2.2:5000/vowel_E";
                    break;

                  case "Heavy cough":
                    url = "http://10.0.2.2:5000/heavy_cough";
                    break;

                  case "Shallow breath":
                    url = "http://10.0.2.2:5000/shallow_breath";
                    break;

                  case "Fast counting":
                    url = "http://10.0.2.2:5000/fast_counting";
                    break;
                }

                await uploadAudio(url, 'audio', pathfile);

                if (widget.text == "Vowel O") {
                  var result = await getData();

                  child:
                  if (result == "Negative") {
                    page = const ResultPage();
                    ;
                  } else if (result == "Positive") {
                    page = Positive();
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return page;
                  }));
                }
              });
            });
          },
          shape: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Icon(
              _recordIcon,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}

uploadAudio(url, String title, file) async {
  // var req = await http.get(Uri.parse("http://10.0.2.2:5000/shallow_"));
  // print(req);
  // var req =
  //     http.MultipartRequest("GET", Uri.parse("http://10.0.2.2:5000/get"));
  print("hi");
  // var req = await http.get(Uri.parse("http://10.0.2.2:5000/get"));
  var request = http.MultipartRequest("POST", Uri.parse(url));

  request.fields['file'] = "audio";
  request.fields['title'] = "dummyaudio";
  Uri myUri = Uri.parse(file);
  File audioFile = new File.fromUri(myUri);
  Uint8List bytes;
  await audioFile.readAsBytes().then((value) async {
    bytes = Uint8List.fromList(value);
    var audio =
        http.MultipartFile.fromBytes('file', bytes, filename: "temp.wav");
    request.files.add(audio);
    var response = await request.send();
    var resonseData = await response.stream.toBytes();
    var results = String.fromCharCodes(resonseData);
    print(results);

    return results;
  }).catchError((onError) {
    print(
        'Exception Error while reading audio from path:' + onError.toString());
  });
}

Future getData() async {
  var response = await http.get(Uri.parse("http://10.0.2.2:5000/results"));
  // print(response.body);
  var decodedJson = json.decode(response.body);
  var result = decodedJson['covid_status'];
  var prob = decodedJson['probability'];
  print(result);
  // print(prob);
  // var email = _loadCounter();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // setState(() {
  var email = (prefs.getString('email') ?? '');
  await PostResults(email, prob);
  return result;
}
// return response.body;

PostResults(email, prob) async {
  // print(prob);
  var profileData = {'probability': prob};

  Map user = {'email': email};

  Map<String, Map> msg = {
    'profileData': profileData,
    'user': user,
  };
  // print(msg);
  var body = jsonEncode(msg);

  //encode Map to JSON
  // var body = json.encode(data);

  // print(profileData);
  // print(user);

  var response = await http.post(Uri.parse("http://10.0.2.2:8080/api/results"),
      headers: {"Content-Type": "application/json"}, body: body);

  var apiResponseData = jsonDecode(response.body);
  print('apiResponseData: ${apiResponseData['status']}');
  print("${response.statusCode}");
  print("${response.body}");

  // return showDialog(
  //   context: context,
  //   builder: (context) {
  //     return AlertDialog(
  //       content: Text(apiResponseData['message']),
  //     );
  //   },
  // ); // return response;
}
