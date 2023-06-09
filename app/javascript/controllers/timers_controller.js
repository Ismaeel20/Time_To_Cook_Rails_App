import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timers"
export default class extends Controller {
  static targets = ['button']
  connect() {
    console.log("testing")
    // console.log(this)
    this.nIntervId;
  }

  start(event) {

    this.countdown = event.currentTarget.innerText
    if (!this.nIntervId) {
      this.intervalId = window.setInterval(() => {this.myTimer()}, 1000)
    }
    // this.buttonTarget.innerText = this.countdown
  }

  myTimer() {

    let time = ''
    // let countdown = (event.currentTarget.innerText)

    if ((this.countdown.split(':').length) === 2) {
      time = (parseFloat(this.countdown.split(":")[0]) * 60) + parseFloat(this.countdown.split(":")[1])
    } else if ((this.countdown.split(':').length) === 3) {
      time = ((parseFloat(this.countdown.split(":")[0]) * 60) * 60) + (parseFloat(this.countdown.split(":")[1]) * 60) + parseFloat(this.countdown.split(":")[2])
    }

    // let time = (parseFloat(this.countdown.split(":")[0]) * 60) + parseFloat(this.countdown.split(":")[1])
  // let elapsed = '0.0';
    // console.log(time)
    let elapsed = "0.0"
    // console.log(time)
    // let elapsed = ""

    if (time >= 0) {
      time -= 1
      // console.log(time)
    }
    console.log(time)

    if (time === 0.0) {
      // elapsed = "00:00"
      console.log("timer is zero")
      window.clearInterval(this.nIntervId)

      this.intervalId = null;
      elapsed = "00:00"
      this.buttonTarget.innerText = elapsed

      this.intervalId = null;
      return elapsed
    }

    if (time < 60) {
      if (Number.isInteger(time)) {
        elapsed = "00:" + time
       } else {
         elapsed = "00:" + time.toString();
       }
    } else if (time >= 60 && time < 3600){
      let minutes = Math.floor(time / 60);
      let extraSeconds = time % 60;
      minutes = minutes < 10 ? "0" + minutes : minutes;
      extraSeconds = extraSeconds < 10 ? "0" + extraSeconds : extraSeconds;
      elapsed = minutes + ':' + extraSeconds
    } else if (time >= 3600) {
      let totalMinutes = Math.floor(time / 60);
      let extraSeconds = time % 60;
      let hours = Math.floor(totalMinutes / 60);
      let minutes = totalMinutes % 60
      hours = hours < 10 ? '0' + hours : hours;
      minutes = minutes < 10 ? "0" + minutes : minutes;
      extraSeconds = extraSeconds < 10 ? "0" + extraSeconds : extraSeconds;
      elapsed = hours + ':' + minutes + ':' + extraSeconds
    }
    this.countdown = elapsed;
    this.buttonTarget.innerText = this.countdown

  // console.log(countdown)

  }

}
