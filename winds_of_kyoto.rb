# Winds of Kyoto

path_to_sounds = "D:/4_developing/ctech/theoretical-bg-audio-graphics/02/Winds_of_Kyoto/sounds/"

s_kshout = path_to_sounds + "66595__robinhood76__00842-karate-shout-1.wav"
s_bamboowoosh = path_to_sounds + "60013__qubodup__whoosh.flac"
s_bamboogmni = path_to_sounds + "67046__gmni__bamboo.wav"
s_bamboowhip = path_to_sounds + "191766__underlineddesigns__bamboo-whip-sound-effect.wav"
s_bamboochimes = path_to_sounds + "401040__inspectorj__bamboo-chimes-a.wav"
s_gongwarm = path_to_sounds + "207168__veiler__warm-gong.wav"
s_chion = path_to_sounds + "329630__rtb45__chion-in-temple-kyoto.wav"
s_renchant = path_to_sounds + "22371__gezortenplotz__nichi-ren-chant.wav"
s_wind = path_to_sounds + "457318__stek59__autumn-wind-and-dry-leaves.wav"
s_katana = path_to_sounds + "215033__taira-komori__katana1.wav"

kyoto_samples = [s_kshout, s_bamboowoosh, s_bamboogmni, s_bamboowhip, s_bamboochimes, s_gongwarm, s_chion, s_wind, s_katana]

live_loop :sample_preview do
  current_sample = kyoto_samples.tick
  print (current_sample)
  with_fx :reverb do
    sample current_sample
  end
  sleep sample_duration(current_sample)
end