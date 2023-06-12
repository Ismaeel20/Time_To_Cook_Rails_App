import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timers"
export default class extends Controller {
  static targets = ['button']
  connect() {
    console.log("testing")
    // console.log(this)
    this.timePassed = 0
    this.full_dash_array = 283;
    this.remainingPathColor = 'green'
    const WARNING_THRESHOLD = 60;
    const ALERT_THRESHOLD = 5;
    this.timer_active = false
    this.countdown = this.buttonTarget.innerText
    this.full_time = (parseFloat(this.countdown.split(":")[0]) * 60) + parseFloat(this.countdown.split(":")[1])
    this.element.innerHTML = `
    <div class="base-timer">
      <svg class="base-timer__svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
        <g class="base-timer__circle">
          <circle class="base-timer__path-elapsed" cx="50" cy="50" r="45"></circle>
          <path
            id="base-timer-path-remaining"
            stroke-dasharray="283"
            class="base-timer__path-remaining inactive"
            d="
              M 50, 50
              m -45, 0
              a 45,45 0 1,0 90,0
              a 45,45 0 1,0 -90,0
            "
          ></path>
        </g>
      </svg>
      <span id="base-timer-label" class="base-timer__label">${this.#formatTime(
        this.full_time
      )}</span>
    </div>
    `;

    this.color_codes = {
      info: {
        color: "green"
      },
      warning: {
        color: "orange",
        threshold: WARNING_THRESHOLD
      },
      alert: {
        color: "red",
        threshold: ALERT_THRESHOLD
      }
    };
  }

  start(event) {
    if (!this.timer_active) {
      this.intervalId = window.setInterval(() => {this.myTimer()}, 1000)
      this.timer_active = true
    }
    // this.element.classList.add('active')

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
    // let elapsed = "0.0"
    // console.log(time)
    // let elapsed = ""

    // if (time >= 0) {
    //   time -= 1
    //   // console.log(time)
    // }
    // console.log(time)

    // if (time === 0.0) {
    //   // elapsed = "00:00"
    //   console.log("timer is zero")
    //   window.clearInterval(this.nIntervId)

    //   this.intervalId = null;
    //   elapsed = "00:00"
    //   this.buttonTarget.innerText = elapsed

    //   this.intervalId = null;
    //   return elapsed
    // }

    // if (time < 60) {
    //   if (Number.isInteger(time)) {
    //     elapsed = "00:" + time
    //    } else {
    //      elapsed = "00:" + time.toString();
    //    }
    // } else if (time >= 60 && time < 3600){
    //   let minutes = Math.floor(time / 60);
    //   let extraSeconds = time % 60;
    //   minutes = minutes < 10 ? "0" + minutes : minutes;
    //   extraSeconds = extraSeconds < 10 ? "0" + extraSeconds : extraSeconds;
    //   elapsed = minutes + ':' + extraSeconds
    // } else if (time >= 3600) {
    //   let totalMinutes = Math.floor(time / 60);
    //   let extraSeconds = time % 60;
    //   let hours = Math.floor(totalMinutes / 60);
    //   let minutes = totalMinutes % 60
    //   hours = hours < 10 ? '0' + hours : hours;
    //   minutes = minutes < 10 ? "0" + minutes : minutes;
    //   extraSeconds = extraSeconds < 10 ? "0" + extraSeconds : extraSeconds;
    //   elapsed = hours + ':' + minutes + ':' + extraSeconds
    // }
    // this.countdown = elapsed;
    // this.buttonTarget.innerText = this.countdown

    this.timePassed = this.timePassed += 1;
    this.timeLeft = this.full_time - this.timePassed;

  // console.log(countdown)
  this.element.innerHTML = `
  <div class="base-timer">
    <svg class="base-timer__svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
      <g class="base-timer__circle">
        <circle class="base-timer__path-elapsed" cx="50" cy="50" r="45"></circle>
        <path
          id="base-timer-path-remaining"
          stroke-dasharray="283"
          class="base-timer__path-remaining ${this.remainingPathColor}"
          d="
            M 50, 50
            m -45, 0
            a 45,45 0 1,0 90,0
            a 45,45 0 1,0 -90,0
          "
        ></path>
      </g>
    </svg>
    <span id="base-timer-label" class="base-timer__label">${this.#formatTime(
      this.timeLeft
    )}</span>
  </div>
  `;

  this.#setCircleDasharray();
  this.#setRemainingPathColor(this.timeLeft);

  }

  #formatTime(time) {
    const minutes = Math.floor(time / 60);
    let seconds = time % 60;

    if (seconds < 10) {
      seconds = `0${seconds}`;
    }

    return `${minutes}:${seconds}`;
  }

  #setRemainingPathColor(timeLeft) {
    const { alert, warning, info } = this.color_codes;
    if (timeLeft <= alert.threshold) {
      this.element
        .querySelector("#base-timer-path-remaining")
        .classList.remove(warning.color);
      this.element
        .querySelector("#base-timer-path-remaining")
        .classList.add(alert.color);
    } else if (timeLeft <= warning.threshold) {
      this.element
        .querySelector("#base-timer-path-remaining")
        .classList.remove(info.color);
      this.element
        .querySelector("#base-timer-path-remaining")
        .classList.add(warning.color);
    }
  }

  #setCircleDasharray() {
    const circleDasharray = `${(
      this.#calculateTimeFraction() * this.full_dash_array
    ).toFixed(0)} 283`;
    this.element
      .querySelector("#base-timer-path-remaining")
      .setAttribute("stroke-dasharray", circleDasharray);
  }

  #calculateTimeFraction() {
    const rawTimeFraction = this.timeLeft / this.full_time;
    return rawTimeFraction - (1 / this.full_time) * (1 - rawTimeFraction);
  }
}


// Below is code for toggle dark mode!

// const darkModeIcon = document.querySelector('#darkModeIcon');

// darkModeIcon.addEventListener('click', () => {
//   document.documentElement.classList.toggle('dark-mode');
// });





// .......................................
