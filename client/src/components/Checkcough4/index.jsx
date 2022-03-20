import { ReactMic } from "react-mic";
import React from "react";
import  "./checkcough4.css";
import MicRecorder from 'mic-recorder-to-mp3';
import im2 from "../../images/im2.png";
import { Link, useNavigate } from "react-router-dom";
const Mp3Recorder = new MicRecorder({ bitRate: 128 });

class Checkcough4 extends React.Component {
  
  constructor(props) {
    super(props);
    this.state = {
      isRecording: false,
      blobURL: '',
      isBlocked: false,
    };
  }
  

  
  start = () => {
    this.setState({ record: true });
    if (this.state.isBlocked) {
      console.log('Permission Denied');
    } else {
      Mp3Recorder
        .start()
        .then(() => {
          this.setState({ isRecording: true });
        }).catch((e) => console.error(e));
    }
    
  };

  stop = () => {
    this.setState({ record: false });
    Mp3Recorder
      .stop()
      .getMp3()
      .then(([buffer, blob]) => {
        const blobURL = URL.createObjectURL(blob)
        this.setState({ blobURL, isRecording: false });
      }).catch((e) => console.log(e));
      this.setState({ isRecording: false });
  };
  

  onData(recordedBlob) {
    console.log("chunk of real-time data is: ", recordedBlob);
  }

  onStop(recordedBlob) {
    console.log("recordedBlob is: ", recordedBlob);
  }

  componentDidMount() {
    navigator.getUserMedia({ audio: true },
      () => {
        console.log('Permission Granted');
        this.setState({ isBlocked: false });
      },
      () => {
        console.log('Permission Denied');
        this.setState({ isBlocked: true })
      },
    );
  }
  render() {
    return (
      <div class="chbackground">
        <img src={im2} alt="image" class="chimg2"></img>
        <img src={im2} alt="image" class="chimg3"></img>
        <h1 class="ch4line1">Record the Vowel 'E' sound for 4 seconds</h1>
        <div class="animationbox">
          <ReactMic 
          record={this.state.record}
          className="sound-wave"
          onStop={this.onStop}
          onData={this.onData}
          strokeColor="#000000"
          ackgroundColor="#FFFFFF"
        /></div>
          <button onClick={this.start} disabled={this.state.isRecording} class="chbtn1">Record</button>
          <button onClick={this.stop} disabled={!this.state.isRecording} class="chbtn2">Stop</button>
          <Link to="/Checkcough5"><button class="chbtn3">Next</button></Link>
          <audio src={this.state.blobURL} controls="controls" class="audiobox"/>
      </div>
    );
    }
  }

export default Checkcough4;
