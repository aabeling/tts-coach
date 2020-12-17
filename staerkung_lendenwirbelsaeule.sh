#!/bin/bash

PAUSE_AFTER_EXPLANATION=2
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

function entspannen() {

  # mary spricht entspannen ansonsten mit einem spitzen S aus
  say "enschpannen"
  sleep $PAUSE_AFTER_EXERCISE
}

function uebung1() {
  explainExercise "Übung 1: Entspannung" "Füße mit leichtem Druck gegen die Wand und Wirbelsäule gegen den Boden pressen, danach Spannung wieder abbauen."

  for i in $(seq 1 3); do
    say "Wiederholung $i. Pressen!"
    sleep $EXERCISE_DURATION
    entspannen
  done
}

function uebung2() {
  explainExercise "Übung 2: Grundspannung Rückenlage" "Fußspitzen anziehen, Fersen auf den Boden drücken, Bauch- und Gesäßmuskulatur anspannen und Lendenwirbelsäule auf den Boden pressen."

  for i in $(seq 1 3); do
    say "Wiederholung $i"
    sleep $EXERCISE_DURATION
    entspannen
  done
}

function uebung3() {
  explainExercise "Übung 3: Rückenlage" "Kopf und Schulter anheben, dann Arme leicht anheben und gegen einen gedachten Widerstand drücken"

  for i in $(seq 1 3); do
    say "Wiederholung $i"
    sleep $EXERCISE_DURATION
    entspannen
  done
}

function uebung4() {

  explainExercise "Übung 4: Grundspannung Rückenlage" "Beine anwinkeln. Mit der rechten Hand das linke Bein berühren und zehn Sekunden halten. Danach wechseln."

  for i in $(seq 1 3); do
    say "Wiederholung $i: rechte Hand an linkes Bein"
    sleep $EXERCISE_DURATION
    entspannen

    say "und Seite wechseln: linke Hand an rechtes Bein"
    sleep $EXERCISE_DURATION
    entspannen
  done
}

function uebung5() {

  explainExercise "Übung 5: Rückenlage" "Linken Arm und rechtes Bein auf den Boden drücken. Mit der rechten Hand gegen das linke Bein drücken. Danach Seitenwechsel."

  for i in $(seq 1 3); do
    say "Wiederholung $i: mit der rechten Hand gegen das linke Bein drücken"
    sleep $EXERCISE_DURATION
    say "und Seite wechseln: mit der linken Hand gegen das rechte Bein drücken"
    sleep $EXERCISE_DURATION
  done
}

function uebung6() {

  explainExercise "Übung 6: Rückenlage" "Gesäß und Wirbelsäule anheben und Bauch und Gesäßmuskulatur anspannen."

  for i in $(seq 1 3); do
    say "Wiederholung $i: hoch mit dir, wird's bald!"
    sleep $EXERCISE_DURATION
    entspannen
  done
}

function uebung7() {

  explainExercise "Übung 7: Rückenlage" "Ein Knie mit beiden Händen umfassen und zur Brust ziehen. Dann Arme strecken und Knie gegen den Händewiderstand drücken."

  say "Mit dem linken Bein"
  sleep $EXERCISE_DURATION

  say "Mit dem rechten Bein"
  sleep $EXERCISE_DURATION
}

function uebung8() {

  explainExercise "Übung 8: Grundspannung Bauchlage" "Fersen wegdrücken, Oberkörper leicht anheben. Hals nicht überstrecken."

  for i in $(seq 1 3); do
    say "Wiederholung $i: hoch mit dir, fauler Hund!"
    sleep $EXERCISE_DURATION
    entspannen
  done
}

function uebung9() {

  explainExercise "Übung 9: Bauchlage" "Arme in U-Form anheben und die Schulterblätter Richtung Wirbelsäule zusammenschieben."

  for i in $(seq 1 3); do
    say "Wiederholung $i: hoch mit dir, Lusche!"
    sleep $EXERCISE_DURATION
    entspannen    
  done
}

function uebung10() {

  explainExercise "Übung 10: Bauchlage" "Arme und Oberkörper leicht anheben und nach beiden Seiten leicht verlagern. Hals nicht überstrecken."

  say "und hoch für 30 Sekunden"
  sleep 30
}

function uebung11() {

  explainExercise "Übung 11: Vierfüßlerstand" "Beine und Arme kreuzweise in der Waagerechten halten."

  for i in $(seq 1 3); do
    say "Wiederholung $i. Rechter Arm und linkes Bein"
    sleep $EXERCISE_DURATION
    say "und die Seite wechseln"
    sleep $EXERCISE_DURATION
  done
}

function uebung12() {

  explainExercise "Übung 12: Vierfüßlerstand" "Katzenbuckel bilden"

  for i in $(seq 1 3); do
    say "Wiederholung $i: buckel dich!"
    sleep $EXERCISE_DURATION
    entspannen
  done
}

startMaryTts

# mary spricht träning besser aus als training!
say "Rückenträning für die Lendenwirbelsäule"

uebung1
uebung2
uebung3
uebung4
uebung5
uebung6
uebung7
uebung8
uebung9
uebung10
uebung11
uebung12