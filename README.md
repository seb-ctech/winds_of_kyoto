# Winds of Kyoto

This is my "Audio Production" project with the theme of Kyoto. Since my Trip to Japan that I planned this year got chancelled, due to the corona outbreak I wanted to make an hommage by using samples that represent nature and asian culture, to evoke an image of an idillic
Japanese Temple somewhere on the country-side of Kyoto, that turns ritualistic and demonic during the night. The overarching Idea is to use
sounds that propagate through the air, like swinging sounds, wind-chimes, chants and wind. Hence the name of the composition: "Winds of Kyoto".

## Setup

The Project was realised with Sonic Pi. To take advantage of a proper setup I developed the code inside "Visual Studio Code" and used the ruby-extension for syntax-highlighting. With the help of the "sonic-pi" extension in Visual Studio Code I can run the code on an opened sonic-pi instance. I also recorded a final "wav" for the final display.

## How to use

You can either copy and paste my code in sonic-pi and run it, but that would produce errors, because of the missing samples.
You can download my repository and run the code over the Visual Studio Code Extension "sonic-pi". Then you need to change "path_to_sounds" to match your local path to the root-directory (Sonic-Pi specific problem). For that you first need to run sonic pi seperately and then use the command-pallete to "Run Code on Sonic Pi". Otherwise just listen to the rendered audio file!

**Enjoy!**

### Quick note to the composition

*The composition is organized in an intro and outro with an A and a B section in the middle, that raises the pace and the tension.
The middle part uses many programming techniques to randomize the outcome and will sound differently on every run, if you change the "random_seed" because of how sonic-pi threats randomness.

### Disclaimer

I got the Sounds and Samples from [Freesound](https://freesound.org/). 