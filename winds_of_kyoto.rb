# Winds of Kyoto

path_to_sounds = "D:/4_developing/ctech/theoretical-bg-audio-graphics/02/Winds_of_Kyoto/sounds/"

#percussive
s_kshout = path_to_sounds + "66595__robinhood76__00842-karate-shout-1.wav"
s_bamboowoosh = path_to_sounds + "60013__qubodup__whoosh.flac"
s_bamboowhip = path_to_sounds + "191766__underlineddesigns__bamboo-whip-sound-effect.wav"
s_gongwarm = path_to_sounds + "207168__veiler__warm-gong.wav"
s_katana = path_to_sounds + "215033__taira-komori__katana1.wav"

#chants
s_chion = path_to_sounds + "329630__rtb45__chion-in-temple-kyoto.wav"
s_renchant = path_to_sounds + "22371__gezortenplotz__nichi-ren-chant.wav"

#atmo
s_wind = path_to_sounds + "457318__stek59__autumn-wind-and-dry-leaves.wav" #42 secs.
s_stream = path_to_sounds + "stream-japan.wav"
s_bamboochimes = path_to_sounds + "401040__inspectorj__bamboo-chimes-a.wav"
s_bamboogmni = path_to_sounds + "67046__gmni__bamboo.wav"
s_birds = path_to_sounds + "bird-chirping-in-Japan.wav" #rate 0.2 to 2 makes for excellent change of pith and bird timbre, 19 secs.

kyoto_samples = [s_kshout, s_bamboowoosh, s_bamboogmni, s_bamboowhip, s_bamboochimes, s_gongwarm, s_chion, s_wind, s_katana]


define :octave do |m| 
  return 12 * m
end
# Instruments and Parametrized Samples. To be used to form the motifs

# Samples


# Substractive Sound (use filters to create interesting sounds out of the)


# Additive Sound (Use synths that overlap to produce interesting flute like sound)
define :synth_flute do |n, s|
  attack = 0.05
  synth :sine, note: n - octave(1) + 4, amp: 0.05, attack: attack, decay: 0.2, release: 0.3, sustain: s
  main = synth :sine, note: n, attack: attack, decay: 0.2, release: 0.3, sustain: s
  h1 = synth :sine, note: n + octave(1), amp: 0.2, attack: attack, decay: 0.2, release: 0.3, sustain: s
  h2 = synth :sine, note: n + octave(2) - 0.1, amp: 0.02, attack: attack, decay: 0.2, release: 0.3, sustain: s
  h3 = synth :sine, note: n + octave(2), amp: 0.01, attack: attack * 1.2, decay: 0.2, release: 0.3, sustain: s
  h4 = synth :sine, note: n + octave(2) + 0.1, amp: 0.02, attack: attack, decay: 0.2, release: 0.3, sustain: s
  h5 = synth :sine, note: n + octave(3) + 0.2, amp: 0.02, attack: attack * 1.2, decay: 0.2, release: 0.3, sustain: s
  h6 = synth :sine, note: n + octave(3) + 0.3, amp: 0.01, attack: attack * 1.5, decay: 0.2, release: 0.3, sustain: s
  sleep 0.5
  20.times do
    if one_in(3) do
      shift = rrand(-1, 1)
      shift_big = rrand(-2, 2)
      control main, note: n + shift, note_slide: 0.3
      control h1, note: n + + octave(1) + shift, note_slide: 0.5
      control h2, note: n + octave(2) + shift, note_slide: 0.4
      control h3, note: n + octave(2) + shift_big, note_slide: 0.2
      control h4, note: n + octave(2) + shift_big, note_slide: 0.2
    end
    control main, note: n, note_slide: 0.3
    control h1, note: n + octave(1), note_slide: 0.5
    control h2, note: n + octave(2), note_slide: 0.4
    control h3, note: n + octave(2), note_slide: 0.2
    control h4, note: n + octave(2) + 0.1, note_slide: 0.2
    sleep 0.5
  end
end

#Effects (EQ,...)


#TODO: Create interesting motifs with variable opts and good variations
## motifs --> Harmonized and Rhythmical, variation through randomness, they musn't change too much in Rhythm!
# change must be subtle! If you change too much, it will sound to foreign and destroy the cohesion

define :hey_short do
  if one_in(2)
    sample s_kshout, start: 0, finish: 0.3, release: 0.2, rate: rrand(0.7, 1.2)
  end
end

define :ghongh do
  with_fx :reverb, room: 0.8 do
    sample s_gongwarm
  end
end

define :panshout do
  with_fx :reverb, room: rrand(0, 1) do
    shout = sample s_kshout, pan: -1, pan_slide: 1
    sleep 0.2
    control shout, pan: 1
  end
end

define :katana_combat do
  sample s_katana, rate: 1.0
  sleep [0.125, 0.5, 1].choose
  sample s_katana, rate: 0.6
  sleep [0.125, 0.250].choose
  sample s_katana, rate: 1.4
  sleep [0.250, 0.075].choose
  sample s_katana, rate: 1.0
end

#TODO: Make Phrases that sound harmonic and well timed (defined), has an harmonic progression.
# phrases --> repetition and variation, has a definite rhythm, punctuation, 4 bars.

define :combat1 do
    hey_short
    sleep [1, 2].choose
    hey_short
    sleep [0.5, 1].choose
    katana_combat
    if one_in(4)
      panshout
    end
end

#TODO: Create dramaturgy, so it sounds complete
# passages --> how phrases are organized in musical structure

define :atmo1 do
  with_fx :reverb, room: 0.7 do
    sample s_wind
    if one_in(4)
      sample s_birds
    end
    bamboo_decoration
  end
  ghongh
  with_fx :echo do
    sample s_stream
  end
end

define :sample_preview do
  current_sample = s_stream
  sd = sample_duration(current_sample);
  print sd
    sample current_sample, amp: 2
  sleep sd
end

define :combat_sequence1 do
  rrand_i(3,9).times do
    combat1
  end
  sleep 1
end

define :bamboo_decoration do
  if one_in(3)
    bamboo = sample choose([s_bamboogmni, s_bamboochimes]), start: rrand(0, 0.5), finish: rrand(0.5, 1), pan: 0, pan_slide: 0.2, attack: 2, release: 3
    sleep 2
    control bamboo, pan: [-1, -0.6, -0.2].tick
    sleep 2
    control bamboo, pan: [1, 0.6, 0.2].tick
  end
end


#TODO: Make an intro, 3 random (for development) and a final passage.
# loops --> succession of different passages

in_thread(name: :winds_of_kyoto) do 
  loop do
    synth_flute :c5, 2
    sleep 1
    synth_flute :d5, 1
    sleep 2
    synth_flute :f5, 0.5
    sleep 0.5
    synth_flute :a4, 3
    sleep 3

    #combat_sequence1
    #sleep rrand_i(10, 20)
  end
end
