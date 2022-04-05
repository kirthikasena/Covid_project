// import { useState } from "react";
import axios from "axios";
import React from "react";
import  styles from "./styles.module.css";
import rec from "recorderjs";
import { useReactMediaRecorder } from "react-media-recorder";
import { Link, useNavigate } from "react-router-dom";
import { useState } from "react";
import { ReactMic } from 'react-mic'; 
import AudioAnalyser from "react-audio-analyser";



// import { Link, useNavigate } from "react-router-dom";

export default class Recordaudio extends  React.Component {
  constructor(props) {
    super(props);
    this.state = {
      status: ""
    };
  }

  controlAudio(status) {
    this.setState({
      status
    });
  }

  changeScheme(e) {
    this.setState({
      audioType: e.target.value
    });
  }

  componentDidMount() {
    this.setState({
      audioType: "audio/wav"
    });
  }


  render() {
    const { status, audioSrc, audioType } = this.state;
    const {error, setError} = this.state;
   
    const audioProps = {
      audioType,
      status,
      audioSrc,
     
      timeslice: 1000,
      startCallback: e => {
        console.log("succ start", e);
      },
      pauseCallback: e => {
        console.log("succ pause", e);
      },
      stopCallback: e => {
        this.setState({
           audioSrc: window.URL.createObjectURL(e),
          

        });
        console.log("succ stop", e);
      },
      onRecordCallback: e => {
        console.log("recording", e);
      },
      errorCallback: err => {
        console.log("error", err);
      }
    };

    



    const handleSubmit = async (e) => {
      e.preventDefault();
      try {
             
              console.log("deed",Audio)

              const blob = await fetch(audioSrc)
              .then(response => response.blob());
              
              console.log(blob)
              let data = new FormData()
             
              data.append('file', blob, 'demo.wav');
              fetch('http://127.0.0.1:5000/receive', {
                method: 'POST',
                body: data
      

        }).then(response => response.json()
        ).then(json => {
            console.log(json)
        });

		} catch (error) {
			if (
				
				error.response &&
				error.response.status >= 400 &&
				error.response.status <= 500
			) {
				console.log(error);
				setError(error.response.data.message);
				
			}
		}
	};



    return (
      <div>
        <AudioAnalyser {...audioProps}>
          <div className="btn-box">
            <button
              className="btn"
              onClick={() => this.controlAudio("recording")}
            >
              Start
            </button>
            <button className="btn" onClick={() => this.controlAudio("paused")}>
              Pause
            </button>
            <button
              className="btn"
              onClick={() => this.controlAudio("inactive")}
            >
              Stop
            </button>
            <button className="btn" onClick={handleSubmit}>
              submit
            </button>
          </div>
        </AudioAnalyser>
      </div>
    );
  }
}



// export default Recordaudio;


