#!/bin/bash

# function to calculate terminal width and center text
center_text() {
  local input="$1"
  local width=$(tput cols)
  local padding=$(( (width - ${#input}) / 2 ))
  printf "%*s%s" $padding "" "$input"
}

# motivational quotes
quotes=(
    "“the life you want won't wait for you to get comfortable. keep moving, keep learning”"
    "“every bug you fix today is one less thing that'll break tomorrow... probabl.”"
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
ascii_art=$(cat << "EOF"


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
  clear

  # center ascii art
  while IFS= read -r line; do
    center_text "$line"
    echo ""
  done <<< "$ascii_art"

  echo ""
  # center random quote
  center_text "$random_quote"
  echo ""

  # start the timer
  countdown $1
}

# helper function for countdown
countdown() {
  local total_seconds=$1

  while [ $total_seconds -gt 0 ]; do
    hours=$((total_seconds / 3600))
    minutes=$(( (total_seconds / 60) % 60 ))
    seconds=$((total_seconds % 60))

    timer_output=$(printf "Time left: %02d:%02d:%02d" $hours $minutes $seconds)
    # center the timer on the screen
    printf "\r"
    center_text "$timer_output"
    sleep 1
    total_seconds=$((total_seconds - 1))
  done

  # center "Time's up!" message
  echo -e "\r\033[K"
  center_text "time's up! take a break."
  echo -e "\n"
  tput bel  # this will trigger the terminal bell sound
}

# pomodoro mode
pomodoro_mode=false
pomodoro_count=4
work_duration=$((25 * 60))  # default 25 minutes
break_duration=$((5 * 60))  # default 5 minutes

# check for pomodoro flag
if [ "$1" == "-pomo" ]; then
  pomodoro_mode=true
  echo "pomodoro mode activated!"
  echo -n "how many pomodoros would you like to complete? "
  read pomodoro_count
fi

# normal mode (input time)
if [ "$pomodoro_mode" = false ]; then
  echo -n "enter countdown time in minutes: "
  read minutes
  countdown_time=$((minutes * 60))
  display_centered $countdown_time
else
  # pomodoro loop
  for ((i=1; i<=pomodoro_count; i++)); do
    echo "starting pomodoro session $i of $pomodoro_count..."
    display_centered $work_duration

    if [ $i -lt $pomodoro_count ]; then
      echo "time for a break!"
      display_centered $break_duration
      echo -e "\a"  # alert sound after break
    else
      echo "all pomodoros complete. great job!"
    fi
  done
fi
