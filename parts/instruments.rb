
# Helper Functions

define :harmonic do |bf, n|
  return bf * n
end

define :octave do |m| 
  return 12 * m
end

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

# --------------------------------------
# SAMPLE
# Exports Samples as functions
# --------------------------------------

define :s_kshout do
  return s_kshout
end

define :s_bamboowoosh do
  return s_bamboowoosh
end

define :s_bamboochimes do
  return s_bamboochimes
end

define :s_bamboogmni do
  return s_bamboogmni
end

define :s_gongwarm do
  return s_gongwarm
end

define :s_katana do
  return s_katana
end

define :s_chion do
  return s_chion
end

define :s_renchant do
  return s_renchant
end

define :s_wind do
  return s_wind
end

define :s_stream do
  return s_stream
end

define :s_birds do
  return s_birds
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

define :in_beast do  |pitch, growl, amp=1|
  rate = 0.1 + (pitch * 0.02)
  sample s_kshout, start: 0.7, release: 1, rate: rate, attack: growl * 0.4, release: growl, amp: amp
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