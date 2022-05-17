import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
// import 'package:flutter/material.dart';
import 'package:defcov/Screens/Results%20Page/negative.dart';
import 'package:defcov/Screens/Results%20Page/positive.dart';
import 'package:flutter/services.dart';
import 'package:defcov/Screens/Results Page/result_page.dart'
    as results_decsison;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String filePath = '/storage/emulated/0/Android/temp.wav';

class SoundRecorder {
  var path;
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecordingStarted = false;
  bool get isRecording => _audioRecorder!.isRecording;

  Future init() async {
    _audioRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException("Microphone permission is needed");
    }
    await _audioRecorder!.openRecorder();
    _isRecordingStarted = true;
  }

  void dispose() {
    if (!_isRecordingStarted) return;

    _audioRecorder!.closeRecorder();
    _audioRecorder = null;
    _isRecordingStarted = false;
  }

  Future _record() async {
    if (!_isRecordingStarted) return;
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      Directory? appDirectory = await getExternalStorageDirectory();
      if (appDirectory != null) {
        filePath = appDirectory.path +
            DateTime.now().millisecondsSinceEpoch.toString() +
            'temp.wav';
        print(filePath);
        path = filePath;
        print(path);
        // getpath(path);
      }
    }
    await _audioRecorder!.startRecorder(
      codec: Codec.pcm16WAV,
      toFile: filePath,
    );
  }

  Future _stop() async {
    if (!_isRecordingStarted) return;
    await _audioRecorder!.stopRecorder();

//  await uploadAudio('audio', filePath);
    // var result = getData();

    // final parsedJson = jsonDecode(result);

    // if (result == "Negative") {
    //   Negative();
    // }else if(result == "positive"){
    //   Positive();

    // }
  }

  Future recprocces() async {
    if (_audioRecorder!.isStopped) {
      await _record();
    } else {
      await _stop();
    }
  }

  Future getpath(path) async {
    return path;
  }
}

// uploadAudio(String title, file) async {
//   var request =
//       http.MultipartRequest("POST", Uri.parse("http://10.0.2.2:5000/receive"));

//   request.fields['file'] = "audio";
//   request.fields['title'] = "dummyaudio";
//   Uri myUri = Uri.parse(file);
//   File audioFile = new File.fromUri(myUri);
//   Uint8List bytes;
//   await audioFile.readAsBytes().then((value) async {
//     bytes = Uint8List.fromList(value);
//     var audio =
//         http.MultipartFile.fromBytes('file', bytes, filename: "temp.wav");
//     request.files.add(audio);
//     var response = await request.send();
//     var resonseData = await response.stream.toBytes();
//     var results = String.fromCharCodes(resonseData);

//     return results;

//     // print(result);
//   }).catchError((onError) {
//     print(
//         'Exception Error while reading audio from path:' + onError.toString());
//   });
// }

// _loadCounter() {}

// Future<String> _loadCounter() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   // setState(() {
//   var email_ = (prefs.getString('email') ?? '');
//   String email = email_.toString();
//   // print(email);
//   return email;
//   // });
// }

// Future getData() async {
//   var response = await http.get(Uri.parse("http://10.0.2.2:5000/results"));
//   // print(response.body);
//   var decodedJson = json.decode(response.body);
//   var result = decodedJson['covid_status'];
//   var prob = decodedJson['probability'];
//   // print(result);
//   // print(prob);
//   // var email = _loadCounter();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   // setState(() {
//   var email = (prefs.getString('email') ?? '');
//   await PostResults(email, prob);
//   return result;
//   // return response.body;
// }

// PostResults(email, prob) async {
//   print(prob);
//   var profileData = {'probability': prob};

//   Map user = {'email': email};

//   Map<String, Map> msg = {
//     'profileData': profileData,
//     'user': user,
//   };
//   print(msg);
//   var body = jsonEncode(msg);

//   //encode Map to JSON
//   // var body = json.encode(data);

//   // print(profileData);
//   // print(user);

//   var response = await http.post(Uri.parse("http://10.0.2.2:8080/api/results"),
//       headers: {"Content-Type": "application/json"}, body: body);

//   var apiResponseData = jsonDecode(response.body);
//   print('apiResponseData: ${apiResponseData['status']}');
//   print("${response.statusCode}");
//   print("${response.body}");

//   // return showDialog(
//   //   context: context,
//   //   builder: (context) {
//   //     return AlertDialog(
//   //       content: Text(apiResponseData['message']),
//   //     );
//   //   },
//   // ); // return response;
// }

