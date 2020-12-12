# Winds of Kyoto
# Usage: change to the $root-folder where you stored "Winds_of_Kyoto" 
root = "D:\\4_developing\\ctech\\audio-graphics-workfolder\\02\\Winds_of_Kyoto\\sonicpi\\"

define :path_to_sounds do
  return path_to_sounds = root + "samples/"
end

eval_file root + "parts/instruments.rb"
eval_file root + "parts/motifs.rb"
eval_file root + "parts/phrases.rb"
eval_file root + "parts/sections.rb"

# -------------------------------------------------------
# MAIN PIECE
# --> succession of different passages
# -------------------------------------------------------

define :winds_of_kyoto do

  se_peaceful_temple
  sleep 1
  se_picking_up_the_pace
  sleep 1
  se_passage_to_night
  sleep 1
  se_demonic_ritual
  sleep 1
  se_passage_to_morning
  sleep 1
  se_back_to_peace

end

# ------------------
# PLAY PIECE  
# ------------------

# BPM: 60 (60 Beats is one Minute)

in_thread(name: :metronome) do
  loop do
    sample :drum_bass_hard, amp: 0.1
    sleep 1
  end
end

loop do
  mo_creepy_atmo
end