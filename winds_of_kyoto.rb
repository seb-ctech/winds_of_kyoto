# Winds of Kyoto

# Usage: change to the $root-folder where you stored "Winds_of_Kyoto" + "samples/"
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

define :in_short_drum do
  with_fx :compressor do
    sample s_gongwarm, start:0.02, finish: 0.1, release: 0.1, attack: 0, sustain: 0.4,  rate: 1
  end
end

define :in_ren_trance do |n|
  with_fx :level, amp: 0 do |level|
    dur = 0.2
    sample s_renchant, finish: dur, release: 3
    if n >= 1
      sample s_renchant, rate: 0.7, amp: 0.2, finish: dur, release: 3
      if n >= 2
        sample s_renchant, rate: 0.8, amp: 0.3, finish: dur, release: 3
        if n >= 3
          sample s_renchant, rate: 0.96, finish: dur, release: 3
          if n >= 4
            sample s_renchant, rate: 0.98, amp: 0.7, finish: dur, release: 3
            if n >= 5
              sample s_renchant, rate: 1.12, amp: 0.6, finish: dur, release: 3
              if n >= 6
                sample s_renchant, rate: 1.14, amp: 0.4, finish: dur, release: 3
              end
            end
          end
        end
      end
    end
    control level, amp: 1, amp_slide: 12, finish: dur
    sleep 10
    control level, amp: 0.2, amp_slide: 5, finish: dur
  end
end

define :in_birds do |seed, pitch|
  rate = 1 + pitch * 0.1
  len = 0.07
  srt = seed * 0.001
  fsh = srt + len
  sample s_birds, amp: 0.3, start: srt, finish: fsh, rate: rate, release: 0.5
end

define :in_ren_chore do
  len = rrand(0.01, 0.02)
  bgn = rrand(0, 1 - len)
  fin = bgn + len
  with_fx :reverb, room: 0.8 do
    sample s_renchant, start: bgn, finish: fin, release: 2, amp: 0.4
    sleep 0.1
    sample s_renchant, rate: 0.9, start: bgn, finish: fin, release: 4, amp: 0.2
  end
end

define :in_wind_sweep do
  s = sample s_wind, start: 0, finish: 0.1, amp: 2, rate: 0.5, attack: 0.2, release: 2, pan: -1
  control s, pan: 1, pan_slide: 2
  sleep 2
  control s, pan: -1, pan_slide: 2
end

define :in_water_flow do |dir, mul|
  rate = mul * 0.1 * dir
  sample s_stream, rate: rate, finish: 0.15, release: 1, amp: 0.3
end

define :in_chion_part do |l, a|
  len = l
  amp = a
  rstart = rrand(0, 1 - len)
  sample s_chion, amp: a, pan: rrand(-1,1), start: rstart, finish: rstart + len, release: 2
end

define :in_group_hey do
  in_hey_short
  sleep rrand(0, 0.1)
  in_hey_short
  sleep rrand(0, 0.1)
  in_hey_short
end

define :in_beast do  |pitch, growl|
  rate = 0.1 + (pitch * 0.02)
  sample s_kshout, start: 0.7, release: 1, rate: rate, attack: growl * 0.4, release: growl
end

define :in_ha_shout do |pitch|
  rate = 1 + (pitch * 0.1);
  sample s_kshout, start: 0.7, release: 1, rate: rate
end

define :in_random_woosh do
  sample s_bamboowoosh, rate: rrand(0.5, 2)
end

define :in_woosh do |pitch|
  rate = 1 + (pitch * 0.2)
  sample s_bamboowoosh, rate: rate
end

define :in_bamchimes do
  sample s_bamboochimes, finish: 0.05, rate: 0.8, amp: 0.6
end

define :in_word do |bgn, length|
  fnh = bgn + length * 0.001
  sample s_chion, start: bgn, finish: fnh, attack: 0.1, release: 0.2
end

define :in_random_word do
  with_fx :reverb do
    len = rrand(0, 10) * 0.001
    bgn = rrand(len, 1) - len
    fnh = bgn + len
    sample s_chion, start: bgn, finish: fnh, attack: 0.1, release: 0.2
  end
end

define :in_hey_short do
  sample s_kshout, start: 0, finish: 0.3, release: 0.2, rate: rrand(0.8, 1.2)
end

define :in_ghongh do
  with_fx :reverb, room: 0.8 do
    sample s_gongwarm
  end
end

define :in_katana do |pitch|
  rate = 1 + pitch * 0.1
  sample s_katana, rate: rate, amp: 0.6
end

# Substractive Sound (use filters to create interesting sounds out of the)


# Additive Sound (Use synths that overlap to produce interesting flute like sound)
define :in_flute do |n, su, a|
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
      sleep 0.05
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

#TODO: Create interesting motifs with variable opts and good variations

# ---------------------------------------------
# MOTIFS
# --> Harmonized and Rhythmical, variation through randomnes! And some control over parameters.
# change must be subtle! If you change too much, it will sound to foreign and destroy the cohesion, means of harmonization!
# ---------------------------------------------

define :mo_beast_awakenes do
  with_fx :reverb do
    in_beast -8, 2
  end
end

define :mo_fighting_the_beast do
  in_ha_shout -8
end

define :mo_chion do 
  3.times do
    dur = rrand(0.01, 0.02)
    in_chion_part dur, rrand(0.2, 0.4)
    sleep dur * sample_duration(s_chion) * 1.05
  end
end

define :mo_flute_calm do |t|
  tonic = t
  with_fx :reverb do
    in_flute scale(tonic, :yu).choose, 3, 0.1
    sleep 0.5
    2.times do
      in_flute scale(tonic, :yu).tick, 0.1, rrand(0.05, 0.1)
      sleep 0.5
    end
  end
end
  
define :mo_double_woosh do
  2.times do
    in_random_woosh
    sleep [0.25, 0,5, 1].choose
  end
end

define :mo_training do
  in_ha_shout -2
  sleep 1
  in_ha_shout -1
  sleep [0.5, 1].tick
  in_ha_shout rrand_i(-3, 3)
  if one_in(3)
    sleep [1, 0.5].choose
    in_group_hey
  end
end

define :mo_panshout do
  with_fx :reverb, room: rrand(0, 1) do
    shout = sample s_kshout, pan: -1, pan_slide: 1
    sleep 0.2
    control shout, pan: 1
  end
end

define :mo_creepy_atmo do
  with_fx :reverb, room: 0.7 do
    sample s_wind
    if one_in(4)
      sample s_birds
    end
  end
  with_fx :echo do
    sample s_stream
  end
end

define :mo_water_pranks do
  in_water_flow 1, 10
  sleep 1
  in_water_flow 1, 15
  sleep 0.5
  in_water_flow 1, 3
  sleep 1
  in_water_flow -1, 5
  sleep 2
  in_water_flow -1, 2
end

define :mo_katana_combat do
  sample s_katana, rate: 1.0
  sleep [0.125, 0.5, 1].choose
  sample s_katana, rate: 0.6
  sleep [0.125, 0.250].choose
  sample s_katana, rate: 1.4
  sleep [0.250, 0.075].choose
  sample s_katana, rate: 1.0
end

define :mo_strong_river do
  sample s_stream, amp: 0.5, rate: 2, release: 1
end

define :mo_summoning do
  in_ren_chore
  sleep 2
  in_ren_chore
  sleep [2, 3, 1.5].choose
  in_ren_chore
  sleep [0.5, 1, 2].tick
  in_ren_chore
end

define :mo_drumbeats do |intense=false|
  4.times do
    in_short_drum
    in_thread do
      sleep [0.5, 0.2].choose
      if one_in(2)
        if intense
          in_woosh -3
        end
      else
        if intense
          in_woosh -3
        end
        sleep 0.2
        in_woosh -3
      end
    end
    sleep 1
  end
end

define :mo_creepy_flute do
  with_fx :reverb, room: 0.9 do
    in_flute :a3, 2, 0.2
    sleep 1
    in_flute :g3, 0.5, 0.1
    sleep 1
    in_flute :f3, 0.25, 0.2
    sleep 1
    in_flute :fs3, 2, 0.2
  end
end

define :mo_bamboo_decoration do
  len = 0.3
  st = rrand(0, 1 - len);
  bamboo = sample choose([s_bamboogmni, s_bamboochimes]), start: st, finish: st + len, pan: 0, pan_slide: 0.2, attack: 2, release: 3
  sleep 2
  control bamboo, pan: [-1, -0.6, -0.2].tick
  sleep 2
  control bamboo, pan: [1, 0.6, 0.2].tick
end

define :mo_evil_birds do
  with_fx :echo do
    in_birds 432, -2
    sleep 2
    in_birds 65, -9
    sleep 2
    in_birds 675, -8
  end
end

define :mo_slasher do
  in_katana -8
  sleep 1 
  in_katana -6
  sleep 0.5
  in_katana -2
  sleep 0.3
  in_katana 0
  sleep 0.8
  in_katana -6
end

define :mo_chimes do
  in_bamchimes
  sleep 2
  in_bamchimes
end

define :mo_shouts do
  in_ha_shout -2
  sleep 0.5
  in_beast 4, 2
  sleep 2
  in_beast 6, 1
  sleep 1
  in_ha_shout 0
  sleep 0.5
  in_ha_shout 2
end

#TODO: Make Phrases that sound harmonic and well timed (defined), has an harmonic progression.
# -------------------------------
# PHRASES
# --> repetition and variation of motifs, has a definite rhythm, punctuation and cadence, 4 bars.
# -------------------------------

define :ph_bamboo_game do
  # --- Background
  2.times do
    mo_bamboo_decoration
    4.times do
      mo_drumbeats
      if one_in(2)
        in_random_word
      end
      if one_in(3)
        mo_training
      end
      4.times do
        mo_double_woosh
        sleep 0.5
      end
      sleep 2
    end
  end
end

define :ph_demon_song do
  # --- Background
  in_thread do
    2.times do
      mo_beast_awakenes
      sleep 8
    end
  end
  in_thread do
    4.times do
      mo_creepy_flute
      sleep 2
    end
  end
  in_thread do
    2.times do
      sleep 4
      mo_evil_birds
      sleep 2
    end
  end
  in_thread do
    2.times do
      mo_water_pranks
      sleep 2
    end
  end
  # --- Foreground
  in_thread do
    4.times do
      mo_chimes
      sleep 4
    end
  end
  in_thread do
    4.times do
      in_ren_chore 
      sleep 4
    end
  end
end

define :ph_peaceful_atmo do |flute = false, chion = false|
  # --- Background
  in_thread do
    sample s_wind, finish: 0.6, amp: 0.3
    sample s_stream, amp: 0.2
    sample s_birds
    sample s_bamboogmni, finish: 0.55
  end
  # --- Foreground
  if flute
    sleep 4
    in_thread do
      sleep 1 
      mo_flute_calm :c4
      sleep 4
      mo_flute_calm :c4
    end
  end
  if chion
    sleep 8
    in_thread do
      mo_chion
    end
  end
end

define :ph_combat do
  # --- Background
  in_thread do
    mo_strong_river
    if one_in(2)
      in_wind_sweep
    else
      sample s_wind, finish: 0.2, release: 2
    end
  end
  in_thread do
    if one_in(2)
      2.times do
        mo_drumbeats
      end
    end
  end
  # --- Foreground
  in_thread do
    4.times do
      if one_in(2)
        mo_katana_combat
      else 
        mo_double_woosh
      end
      sleep 2
    end
  end
  in_thread do
    4.times do
      if one_in(2)
        in_group_hey
        sleep 4
      else 
        mo_shouts
        sleep 4
      end
    end
  end
  in_thread do
    4.times do
      if one_in(3)
        mo_slasher
      end
    end
  end
end

define :ph_ceremony do
  # --- Background
  in_thread do
    mo_creepy_atmo
  end
  in_thread do
    mo_strong_river
  end
  in_thread do
    if one_in(3)
      in_wind_sweep
    end
  end
  # --- Foreground
  in_thread do
    mo_chion
  end
  in_thread do
    in_ren_chore
  end
end

#TODO: Create dramaturgy, so it sounds complete
# --------------------------------
# PASSAGES
# --> how phrases are organized in independent and finished musical ideas. Like scenes in a movie
# period (antecedent and consequent) or sentence (four phrases developing to one cadence)
# --------------------------------

define :se_peaceful_temple do
  ph_peaceful_atmo 
  sleep 12
  ph_peaceful_atmo true, true
  sleep 12
  ph_peaceful_atmo false, true
end

define :se_picking_up_the_pace do
  in_ghongh
  sleep 1
  mo_panshout
  sleep 2
  4.times do
    ph_bamboo_game
    sleep 16
  end
  in_ghongh
end

define :se_passage_to_night do
  2.times do 
    ph_ceremony
    sleep 10
  end
  sleep 1
  in_ren_trance
end

define :se_demonic_ritual do
  mo_beast_awakenes
  sleep 10
  2.times do
    ph_demon_song
    sleep 20
  end
  2.times do
    ph_combat
    sleep 20
  end
end

define :se_passage_to_morning do
  mo_monster_awakenes #backwards or higher pitch
  in_group_hey
  2.times do
    ph_bamboo_game #somehow changed
  end
end

define :se_back_to_peace do
  ph_peaceful_atmo true, false
  mo_beast_awakenes #low and differetent
  mo_chion
  ph_peaceful_atmo
  in_ghongh
end


# -------------------------------------------------------
# MAIN PIECE
# --> succession of different passages
# -------------------------------------------------------

define :winds_of_kyoto do

  se_peaceful_temple
  sleep 5
  se_picking_up_the_pace
  sleep 5
  se_passage_to_night
  sleep 15
  se_demonic_ritual
  sleep 45
  se_passage_to_morning
  sleep 15
  se_back_to_peace

end

# ------------------
# PLAY PIECE  
# ------------------

# BPM: 60 (60 Beats is one Minute)

in_thread(name: :metronome) do
  loop do
    sample :drum_bass_hard, amp: 0.05
    sleep 1
  end
end

# winds_of_kyoto


ph_bamboo_game