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

define :sample_preview do
  current_sample = s_stream
  sd = sample_duration(current_sample);
  print sd
    sample current_sample, amp: 2
  sleep sd
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


define :atmo1 do
  with_fx :reverb do
    sample s_wind
    sample s_birds
    bamboo_decoration
  end
  with_fx :echo do
    sample s_stream
  end
end

live_loop :winds_of_kyoto do
  atmo1
  sleep 15
end