# Winds of Kyoto
# Usage: 1. change to the set the "root" to the path where you stored "Winds_of_Kyoto"
#        2. set the "key" you would like the flute to play in
#        3. set the random "seed" you would like to use
#        4. Run code with Sonic Pi!
#        5. Enjoy!

root = "D:\\4_developing\\ctech\\audio-graphics-workfolder\\02\\Winds_of_Kyoto\\sonicpi\\"
key = :g3
seed = 0

define :path_to_sounds do
  return path_to_sounds = root + "samples/"
end

define :get_tonic do
  return key
end

eval_file root + "parts/instruments.rb"
eval_file root + "parts/motifs.rb"
eval_file root + "parts/phrases.rb"
eval_file root + "parts/sections.rb"

# -------------------------------------------------------
# MAIN PIECE
# --> succession of different sections
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

use_random_seed 0
winds_of_kyoto