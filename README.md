# Winds of Kyoto

This is my "Audio Production" project with the theme of Kyoto. Since my Trip to Japan this year which I was very excited for got chancelled, due to the corona outbreak, I wanted to make an hommage by using samples that represent nature and asian culture, to evoke an image of an idillic Japanese Temple somewhere on the country-side of Kyoto, that turns ritualistic and demonic during the night. The overarching Idea is to use sounds that propagate through the air, like swinging sounds, wind-chimes, chants and wind. 
Hence the name of the composition: "Winds of Kyoto".

# Concept

With this project I wanted to experiment how to use simple sounds to tell a story while at the same time have a "real" musique concrete composition. The Piece is structured in three acts. First it starts on a simple establisher to set the mood and create a peaceful atmosphere. The first act unfolds with a training unit of a group of monks which is highly percussive and energetic in contrast to the opening.
After a while we switch the setting and when the sun starts to set, ominous voices announce a dark sect plotting and chanting down the river.
This leads to the second act: an atmospheric and ominous demon summoning dominated by a dark growl and chants. However the demon is kept on a short leash and immediately attacked by the guarding monks. The third act turns into an exchange of hits between dark sect and monks and results in a victory for good. After a final celebration the temple meadow settles back to peace. Or so it seems...

# Technical Details

For the whole piece I used eleven Samples, from which five are solely acustics for the background atmosphere. The other two samples where used to represent the chants of the two parties. Leaving me with four main samples I really "worked with" to create the piece. A highly cheesey karate shout, from which I extracted most shouts and the demon growls by playing with the play rate and cutting it, a bamboo swing, a katana hit and a ghong were used as percussive force.
Additionally I used additive synthesis to design a flute instrument out of 9 sine-wave synthesizers with a slight tremolo for realistic timbre, inspired by a traditional japanese "shakuhaki".

## Setup

The Project was realised with Sonic Pi. To take advantage of a proper setup I developed the code inside "Visual Studio Code" and used the ruby-extension for syntax-highlighting. With the help of the "sonic-pi" extension in Visual Studio Code I can run the code on an opened sonic-pi instance. I also recorded a final "wav" for the final display.

## How to use

After downloading or cloaning the repository you have two options.
You can either run the code by using "run_code" and the path to the files inside a sonic-pi buffer.
Or you can run the code over the Visual Studio Code Extension "sonic-pi" and "Run code with sonic Pi". Then you need to change "root" to match your local path to the root-directory of the project.  
Otherwise just listen to the rendered audio file!

**Enjoy!**

### Quick note to the composition

The composition was layed out like classical music structure. First the basic samples and sonic pi synthesizers where combined to more interesing and concise "Instruments". These instruments where then used to form basic motifs. The motifs contain small sequences and define the rhythm with a sleep function. The motifs then get combined and weaved together in phrases which then get composed to sequences. The whole piece is composed by five sequences. 

### Disclaimer

I got the Samples from [Freesound](https://freesound.org/). 