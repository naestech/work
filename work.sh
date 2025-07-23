#!/bin/bash

# function to calculate terminal width and center text
center_text() {
  local input="$1"
  local width=$(tput cols)
  local padding=$(((width - ${#input}) / 2))
  printf "%*s%s" $padding "" "$input"
}

# motivational quotes
quotes=(
  "“the life you want won't wait for you to get comfortable. keep moving, keep learning”"
  "“every bug you fix today is one less thing that'll break tomorrow... probably.”"
  "“if it was easy, everyone would do it. lucky for you, you're not 'everyone'”"
  "“failure’s just the price of admission for success. you’ve already paid, so keep going”"
  "“the real magic isn’t in the tech, it’s in figuring out why your code suddenly works”"
  "“knowledge is power, but consistency turns that power into mastery”"
  "“musicians play notes, engineers play with code. both change the world in their own way”"
  "“when you aim for greatness, you’re allowed to fall, but you’re not allowed to quit”"
  "“don’t just work to live—live to build, learn, and leave a mark”"
  "“if at first you don’t succeed, redefine success”"
  "“success is the sum of small efforts, repeated day in and day out”"
  "“you miss 100% of the shots you don’t take, but hey, at least you don’t have to stress”"
  "“the best way to predict the future is to create it. no pressure”"
  "“a good engineer can make a machine work, a great engineer can make it dance”"
  "“creativity is intelligence having fun. don’t forget to smile!”"
  "“the road to success is dotted with many tempting parking spaces”"
  "“dream big, but don’t forget to take the stairs”"
  "“you can’t connect the dots looking forward; you can only connect them looking back”"
  "“the difference between ordinary and extraordinary is that little extra”"
  "“work hard in silence; let success be your noise”"
  "“every great achievement was once considered impossible, until someone tried”"
  "“progress is impossible without change, and those who cannot change their minds cannot change anything”"
  "“if you think you’re too small to make a difference, try sleeping with a mosquito”"
  "“life is 10% what happens to us and 90% how we react to it”"
  "“you don’t have to be great to start, but you have to start to be great”"
  "“a ship in harbor is safe, but that’s not what ships are built for”"
  "“failure is simply the opportunity to begin again, this time more intelligently”"
  "“if you're not making mistakes, then you're not making anything”"
  "“every failure is a step closer to success, just like every bug is a step closer to stability”"
  "“the only limit to our realization of tomorrow is our doubts of today”"
  "“an engineer without a sense of humor is like a musician without rhythm”"
  "“the best time to plant a tree was 20 years ago. the second best time is now”"
  "“sometimes the best way to solve your own problems is to help someone else solve theirs”"
  "“opportunities don't happen. you create them”"
  "“you can't wait for inspiration. you have to go after it with a club”"
  "“don't watch the clock; do what it does. keep going”"
  "“it's not whether you get knocked down, it's whether you get up”"
  "“life is either a daring adventure or nothing at all”"
  "“success usually comes to those who are too busy to be looking for it”"
  "“the only thing worse than being blind is having sight but no vision”"
  "“you can’t use up creativity. the more you use, the more you have”"
  "“keep your eyes on the stars, and your feet on the ground”"
  "“the secret to getting ahead is getting started”"
  "“you can't build a reputation on what you are going to do”"
  "“perfection is not attainable, but if we chase perfection we can catch excellence”"
  "“creativity takes courage, so don’t be afraid to fail”"
  "“the harder I work, the luckier I get”"
  "“always do your best. what you plant now, you will harvest later”"
  "“success is how high you bounce when you hit bottom”"
  "“in the middle of difficulty lies opportunity”"
  "“you don’t have to be a genius to succeed; just be a little crazy”"
  "“life is short. do stuff that matters”"
  "“you can’t be afraid of what people are going to say, because you’re never going to make everyone happy”"
  "“don’t let yesterday take up too much of today”"
  "“sometimes you will never know the value of a moment until it becomes a memory”"
  "“the future belongs to those who believe in the beauty of their dreams”"
)

# select a random quote
random_quote=${quotes[$RANDOM % ${#quotes[@]}]}

# ascii art
ascii_art=$(
  cat <<"EOF"


⣿⣿⣿⠟⣡⡟⣩⣶⣶⣶⡒⠒⠿⢶⠲⣶⣶⣭⣒⠮⣛⢿⣿⣿⣿⣿
⣿⣿⢡⣾⢏⣌⡙⠃⠀⢀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣷⣬⠳⡝⢿⣿⣿
⣿⠇⣾⠏⠊⠁⠀⠀⢀⣆⠀⠀⡀⠠⠀⠀⠀⠀⠀⠙⢿⣷⡜⣎⢿⣿
⣿⡐⡟⠀⣠⠀⠀⠀⢸⣿⠀⣤⠈⡦⠄⡳⠄⣠⠀⠀⠀⠹⣿⡘⡌⣿
⣿⣧⢡⡞⠃⠀⠀⠐⠘⣿⣧⣹⡗⣴⡟⢛⡧⠹⡄⠀⠀⠀⣸⡇⣿⢸
⣿⣿⡎⢃⡠⠀⠀⠀⣴⡮⠻⣿⣷⣝⣛⣫⠅⠰⣿⠀⠀⢰⣿⢃⣿⢸
⣿⣿⣾⣧⡅⠀⠀⠀⠙⠷⠂⣿⣿⡿⢛⣵⡞⠁⣿⣇⠀⡼⢋⣾⢣⣾
⣿⣿⣿⣿⣄⣦⣠⠀⢿⡗⣒⣵⢞⣫⣿⡟⣼⢣⠀⢴⠾⢟⣵⣿⣿⣿
⣿⣿⣿⣿⢏⣶⡬⣿⣷⣌⡳⢌⡻⠿⣛⣭⡾⣡⢃⣦⢻⣿⣿⣿⣿⣿
⣿⣿⠿⣛⠜⠻⡇⣿⣿⣿⣿⣶⣮⣭⣛⡍⠚⣃⠛⠛⠎⢿⣿⣿⣿⣿
⠟⣵⣾⣿⣿⣷⠡⠹⣿⣿⣿⣿⣿⣿⠋⣰⣿⣿⣿⣦⡀⠀⠘⢿⣿⣿
⣻⣷⣶⣶⣦⡙⡄⣥⠻⣿⣿⣿⣿⠃⣼⣿⣿⣿⣿⣿⡇⠀⠀⠘⣿⣿


EOF
)

# function to display the art, quote, and start the timer
display_centered() {
  local duration=$1
  local mode=${2:-"timer"}

  clear
  draw_static_content
  countdown $duration "$mode"
}

# function to draw static content
draw_static_content() {
  # center ascii art
  while IFS= read -r line; do
    center_text "$line"
    echo ""
  done <<<"$ascii_art"

  echo ""
  # center random quote
  center_text "$random_quote"
  echo ""
}

# countdown function with progress bar
countdown() {
  local total_seconds=$1
  local original_seconds=$1
  local mode=${2:-"timer"}
  local last_width=$(tput cols)

  # hide cursor and set terminal to not echo input
  tput civis
  stty -echo

  # trap to restore terminal on exit
  trap 'tput cnorm; stty echo' EXIT

  local start_time=$(date +%s)
  local end_time=$((start_time + total_seconds))

  while [ $(date +%s) -lt $end_time ]; do
    local current_time=$(date +%s)
    local current_width=$(tput cols)
    local size_changed=false

    if [ $current_width -ne $last_width ]; then
      size_changed=true
      last_width=$current_width
    fi

    local remaining=$((end_time - current_time))
    if [ $remaining -lt 0 ]; then
      remaining=0
    fi

    hours=$((remaining / 3600))
    minutes=$(((remaining / 60) % 60))
    seconds=$((remaining % 60))

    # calculate progress
    local elapsed=$((current_time - start_time))
    local percent=0
    if [ $original_seconds -gt 0 ]; then
      percent=$((elapsed * 100 / original_seconds))
      if [ $percent -gt 100 ]; then
        percent=100
      fi
    fi
    local bar_width=40
    local filled=$((percent * bar_width / 100))
    local empty=$((bar_width - filled))

    # build progress bar
    local bar="|"
    for ((j = 0; j < filled; j++)); do
      bar+="█"
    done
    for ((j = 0; j < empty; j++)); do
      bar+="░"
    done
    bar+="|"

    # add mode indicator to timer
    local mode_indicator=""
    case "$mode" in
    "pomo") mode_indicator="work 𓊝  " ;;
    "break") mode_indicator="break 𓊝  " ;;
    "timer") mode_indicator="" ;;
    esac

    timer_output=$(printf "%stime left: %02d:%02d:%02d" "$mode_indicator" $hours $minutes $seconds)
    progress_output=$(printf "%s %d%%" "$bar" $percent)

    # simplified display update
    if [ "$size_changed" = true ]; then
      clear
      draw_static_content
    fi

    # always update timer display
    printf "\033[2K\r"
    center_text "$timer_output"
    echo ""
    printf "\033[2K\r"
    center_text "$progress_output"
    printf "\033[1A"
    sleep 0.5
  done

  # restore cursor and echo before completion
  tput cnorm
  stty echo

  # clear and show completion message
  echo -e "\r\033[K"
  echo -e "\r\033[K"
  center_text "time's up! take a break."
  echo -e "\n"

  # terminal notification based on mode
  case "$mode" in
  "timer") terminal-notifier -message "timer finished!" -title "𓊝" 2>/dev/null ;;
  "pomo") terminal-notifier -message "time for a break! great work." -title "𓊝" 2>/dev/null ;;
  "break") terminal-notifier -message "break over! back to work." -title "𓊝" 2>/dev/null ;;
  esac
}

# pomodoro mode
pomodoro_mode=false
pomodoro_count=4
work_duration=$((25 * 60)) # default 25 minutes
break_duration=$((5 * 60)) # default 5 minutes

# check for help flag
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "keep track of time with luffy in your terminal!"
  echo ""
  echo "usage:"
  echo "  work           start timer mode"
  echo "    -p, --pomo     start pomodoro mode"
  echo "    -h, --help     show this help message"
  echo ""
  exit 0
fi

# check for pomodoro flag
if [ "$1" == "--pomo" ] || [ "$1" == "-p" ]; then
  pomodoro_mode=true
  echo "pomo pomo no mi !!!"
  echo -n "work duration in minutes (default 25): "
  read work_minutes
  if [ -z "$work_minutes" ] || [ "$work_minutes" -le 0 ] 2>/dev/null; then
    work_minutes=25
  fi
  work_duration=$((work_minutes * 60))

  echo -n "break duration in minutes (default 5): "
  read break_minutes
  if [ -z "$break_minutes" ] || [ "$break_minutes" -le 0 ] 2>/dev/null; then
    break_minutes=5
  fi
  break_duration=$((break_minutes * 60))

  echo -n "how many pomodoro sessions? (default 4): "
  read pomodoro_count
  if [ -z "$pomodoro_count" ] || [ "$pomodoro_count" -le 0 ] 2>/dev/null; then
    pomodoro_count=4
  fi
fi

# normal mode
if [ "$pomodoro_mode" = false ]; then
  echo -n "enter countdown time in minutes: "
  read minutes
  if [ -z "$minutes" ] || [ "$minutes" -le 0 ] 2>/dev/null; then
    echo "invalid input, using 25 minutes"
    minutes=25
  fi
  countdown_time=$((minutes * 60))
  display_centered $countdown_time "timer"
else
  # pomodoro loop
  for ((i = 1; i <= pomodoro_count; i++)); do
    echo "starting pomodoro session $i of $pomodoro_count..."
    display_centered $work_duration "pomo"

    if [ $i -lt $pomodoro_count ]; then
      echo "time for a break!"
      display_centered $break_duration "break"
    fi
  done

  # final completion message and notification
  center_text "all pomodoros complete. great job!"
  echo ""
  terminal-notifier -message "all sessions complete! great job!" -title "𓊝" 2>/dev/null
fi
