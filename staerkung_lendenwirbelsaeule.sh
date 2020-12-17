#!/bin/bash

PAUSE_AFTER_EXPLANATION=5
EXERCISE_DURATION=10
PAUSE_AFTER_EXERCISE=5

function startMaryTts() {
  echo "marytts wird gestartet"
  docker stop -t 0 marytts
  docker run -d --rm --name marytts -p 59125:59125 synesthesiam/marytts:5.2
  sleep 10
}

function sayWithMaryTts() {

  curl -s -G \
    --data-urlencode "INPUT_TEXT=$1" \
    'http://localhost:59125/process?INPUT_TYPE=TEXT&OUTPUT_TYPE=AUDIO&VOICE_SELECTIONS=bits1-hsmm%20de%20female%20hmm&AUDIO_OUT=WAVE_FILE&LOCALE=de&VOICE=bits1-hsmm&AUDIO=WAVE_FILE' |aplay -q
}

function say() {
  #spd-say -w -x -l de -t male1 -r -10 -p -10 "$1"
  sayWithMaryTts "$1"
}

function explainExercise() {

    say "$1"
    sleep 2
    say "$2"
    sleep $PAUSE_AFTER_EXPLANATION
    say "Es geht los in drei, zwei, eins, los!"
}

function uebung1() {
  explainExercise "Übung 1: Entspannung" "Füße mit leichtem Druck gegen die Wand und Wirbelsäule gegen den Boden pressen, danach Spannung wieder abbauen."

  say "Wiederholung 1"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "Wiederholung 2"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "Wiederholung 3"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE
}

function uebung2() {
  explainExercise "Übung 2: Grundspannung Rückenlage" "Fußspitzen anziehen, Fersen auf den Boden drücken, Bauch- und Gesäßmuskulatur anspannen und Lendenwirbelsäule auf den Boden pressen."

  say "Wiederholung 1"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "Wiederholung 2"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "Wiederholung 3"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE
}

function uebung3() {
  explainExercise "Übung 3: Rückenlage" "Kopf und Schulter anheben, dann Arme leicht anheben und gegen einen gedachten Widerstand drücken"

  say "Wiederholung 1"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "Wiederholung 2"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "Wiederholung 3"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE
}

function uebung4() {
  explainExercise "Übung 4: Grundspannung Rückenlage" "Beine anwinkeln. Mit der rechten Hand das linke Bein berühren und zehn Sekunden halten. Danach wechseln."

  say "Wiederholung 1: rechte Hand an linkes Bein"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "linke Hand an rechtes Bein"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "Wiederholung 2: rechte Hand an linkes Bein"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "linke Hand an rechtes Bein"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "Wiederholung 3: rechte Hand an linkes Bein"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE

  say "linke Hand an rechtes Bein"
  sleep $EXERCISE_DURATION
  say "Entspannen"
  sleep $PAUSE_AFTER_EXERCISE
}

startMaryTts

say "Rückentraining für die Lendenwirbelsäule"
sleep 1
say "bitte fertig machen"

uebung1
uebung2
uebung3
uebung4
