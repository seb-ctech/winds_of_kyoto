# Winds of Kyoto

# Usage: change the root-folder to the path where you stored "Winds_of_Kyoto"
path_to_sounds = "D:/4_developing/ctech/audio-graphics-workfolder/02/Winds_of_Kyoto/sonicpi/samples/"

#percussive
s_kshout = path_to_sounds + "66595__robinhood76__00842-karate-shout-1.wav"
s_bamboowoosh = path_to_sounds + "60013__qubodup__whoosh.flac"
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

kyoto_samples = [s_kshout, s_bamboowoosh, s_bamboogmni, s_bamboochimes, s_gongwarm, s_chion, s_wind, s_katana]

# Helper Functions

define :harmonic do |bf, n|
  return bf * n
end

define :octave do |m| 
  return 12 * m
end

# --------------------------------------
# INSTRUMENTS
# Instruments and Parametrized Samples. To be used to form the motifs
# --------------------------------------

define :short_drum do
  sample s_gongwarm, finish: 0.12, release: 0.5, rate: 0.8
end

define :ren_trance do
  sample s_renchant, rate: 0.7, amp: 0.2
  sample s_renchant, rate: 0.8, amp: 0.3
  sample s_renchant, rate: 0.96
  sample s_renchant, rate: 0.98, amp: 0.7
  sample s_renchant
  sample s_renchant, rate: 1.12, amp: 0.6
  sample s_renchant, rate: 1.14, amp: 0.4
end

define :wind_sweep do
  s = sample s_wind, start: 0, finish: 0.1, amp: 2, rate: 0.5, attack: 0.2, release: 2, pan: -1
  control s, pan: 1, pan_slide: 2
  sleep 2
  control s, pan: -1, pan_slide: 2
end

define :group_hey do
  hey_short
  sleep rrand(0, 0.2)
  hey_short
  sleep rrand(0, 0.2)
  hey_short
end

define :random_woosh do
  sample s_bamboowoosh, rate: rrand(0.5, 2)
end

define :bamchimes do
  sample s_bamboochimes, finish: 0.05, rate: 0.8, amp: 2
end

define :random_word do |bgn, length|
  fnh = bgn + length * 0.001
  sample s_chion, start: bgn, finish: fnh, attack: 0.1, release: 0.2
end

define :hey_short do
  sample s_kshout, start: 0, finish: 0.3, release: 0.2, rate: rrand(0.8, 1.2)
end

define :ghongh do
  with_fx :reverb, room: 0.8 do
    sample s_gongwarm
  end
end

# Substractive Sound (use filters to create interesting sounds out of the)


# Additive Sound (Use synths that overlap to produce interesting flute like sound)
define :synth_flute do |n, su, a|
  attack = 0.15
  s = su - attack - 0.2
  if s < 0
    s = 0
  end
  f = midi_to_hz(n)
  # Fundamental Frequency
  main = synth :sine, note: n, amp: a, attack: attack, attack_level: 1.2, decay: 0.4, release: 0.3, sustain: s
  # Harmonics 
  h2 = synth :sine, note: hz_to_midi( harmonic(f, 2) ), amp: a * 0.8, attack: attack, decay: 0.2, release: 0.2, sustain: s
  h3 = synth :sine, note: hz_to_midi( harmonic(f, 2.5) ), amp: a * 0.05, attack: attack * 1.5, decay: 0.1, release: 0.2, sustain: s
  with_fx :tremolo, phase: 0.4, depth: 0.3 do
    h4 = synth :sine, note: hz_to_midi( harmonic(f, 3) ), amp: a * 0.2, attack: attack * 1.2, decay: 0.2, release: 0.2, sustain: s
    h5 = synth :sine, note: hz_to_midi( harmonic(f, 3.5) ), amp: a * 0.05, attack: attack * 2, decay: 0.2, release: 0.1, sustain: s
    h6 = synth :sine, note: hz_to_midi( harmonic(f, 4) ), amp: a * 0.02, attack: attack * 1.2, decay: 0.2, release: 0.1, sustain: s
    h7 = synth :sine, note: hz_to_midi( harmonic(f, 5) ), amp: a * 0.02, attack: attack * 1.2, decay: 0.2, release: 0.1, sustain: s
    h8 = synth :sine, note: hz_to_midi( harmonic(f, 6) ), amp: a * 0.01, attack: attack * 1.2, decay: 0.2, release: 0.1, sustain: s
    h9 = synth :sine, note: hz_to_midi( harmonic(f, 7) ), amp: a * 0.01, attack: attack * 1.2, decay: 0.2, release: 0.1, sustain: s
  end
  # Noise and Texture
  with_fx :lpf do
    n1 = synth :noise, cutoff: hz_to_midi( harmonic(f, 0.5) ), amp: a * 0.01, attack: attack, decay: 0.2, release: 0.2, sustain: s
  end
  with_fx :band_eq, freq: hz_to_midi(harmonic(f, 4)), res: 0.2, amp: 0.5 do
    n1 = synth :noise, cutoff: n + octave(1), amp: a * 0.2, attack: attack, decay: 0.2, release: 0.2, sustain: s
    n2 = synth :noise, cutoff: hz_to_midi( harmonic(f, 4) ), amp: a * 0.3, attack: attack, decay: 0.2, release: 0.2, sustain: s
  end
  # Frequency Tremolo
  if s > 1
    sleep 1
    frequency = 5
    offset = 0.5
    (2 * s).times do
      period = rrand(0, 0.3)
      shift_neg = -rrand(0, offset)
      shift_pos = rrand(0, offset)
      if one_in(2)
          control main, note: n + shift_neg, note_slide: period
          control h2, note: hz_to_midi( harmonic(f, 2) ) + shift_neg, note_slide: period 
          control h3, note: hz_to_midi( harmonic(f, 2) ) + shift_pos, note_slide: period
          sleep period
      end
      control main, note: n, note_slide: period
      control h2, note: hz_to_midi( harmonic(f, 2) ), note_slide: period
      control h3, note: hz_to_midi( harmonic(f, 2) ), note_slide: period
      sleep 0.1
    end
  end
end

#Effects (EQ,...)
define :eq6 do |s, v1, v2, v3, v4, v5, v6|
  with_fx :band_eq, freq: 40, res: 0.4, db: v1 do
    with_fx :band_eq, freq: 60, res: 0.4, db: v2 do
      with_fx :band_eq, freq: 80, res: 0.4, db: v3 do
        with_fx :band_eq, freq: 90, res: 0.4, db: v4 do
          with_fx :band_eq, freq: 100, res: 0.4, db: v5 do
            with_fx :band_eq, freq: 120, res: 0.4, db: v6 do
              sample s
            end
          end
        end
      end
    end
  end
end

define :sample_test do
  synth_flute :C5, 3, 0.5
  sleep 3
end

#TODO: Create interesting motifs with variable opts and good variations

# ---------------------------------------------
# MOTIFS
# --> Harmonized and Rhythmical, variation through randomnes! And some control over parameters.
# change must be subtle! If you change too much, it will sound to foreign and destroy the cohesion, means of harmonization!
# ---------------------------------------------

define :flute_motif do
  tonic = choose([:c4, :a4])
  4.times do
    dur = choose([0.150, 0.250, 0.5, 1])
    synth_flute scale(tonic, :yu).choose, dur, 0.5
    sleep dur * 1.4
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

#TODO: Make Phrases that sound harmonic and well timed (defined), has an harmonic progression.
# -------------------------------
# PHRASES
# --> repetition and variation of motifs, has a definite rhythm, punctuation and cadence, 4 bars.
# -------------------------------

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

define :peaceful_background_1 do
  sample s_wind
  sample s_stream
  sample s_birds
  sample s_bamboogmni
end

#TODO: Create dramaturgy, so it sounds complete
# --------------------------------
# PASSAGES
# --> how phrases are organized in independent and finished musical ideas. Like scenes in a movie
# period (antecedent and consequent) or sentence (four phrases developing to one cadence)
# --------------------------------

define :peaceful_temple do
  flute_motif
  sleep 10
end

define :picking_up_the_pace do

end

define :passage_to_night do

end

define :demonic_ritual do

end

define :passage_to_morning do

end

define :back_to_peace do

end


# -------------------------------------------------------
# MAIN PIECE
# --> succession of different passages
# -------------------------------------------------------

define :winds_of_kyoto do

  peaceful_temple
  sleep 30
  picking_up_the_pace
  sleep 45
  passage_to_night
  sleep 15
  demonic_ritual
  sleep 45
  passage_to_morning
  sleep 15
  back_to_peace

end

winds_of_kyoto
