# Lingua::EN::Summary

Finds *N* sentences from inside a chunk of text that best summarize the text using [TF-IDF vectors](https://en.wikipedia.org/wiki/Tf%E2%80%93idf) and [PageRank](https://en.wikipedia.org/wiki/PageRank). [![Build Status](https://travis-ci.org/kmwallio/p6-Lingua-EN-Summary.svg?branch=master)](https://travis-ci.org/kmwallio/p6-Lingua-EN-Summary)

This is just an experiment.  It's pretty slow at the moment, looking at speeding up Text::TFIdf and this to make it more usable...

By default, we do 250 iterations.  There is an optional parameter for increasing or decreasing the number of iterations done.

## Installation

```
panda install git://github.com/kmwallio/p6-Lingua-EN-Summary.git
```

## Usage

``` perl6
use v6;
use Lingua::EN::Summary;
use Lingua::EN::Sentence;

my @long-winded = "explanation.txt".IO.slurp.sentences;
# Generate 5 sentences
my @nice-and-short = summarize(@long-winded, 5);
# Or
# Generate 5 sentences after 1000 iterations
my @nice-and-short = summarize(@long-winded, 5, 1000);
```

### [The Amazing Spider-Man](https://en.wikipedia.org/wiki/The_Amazing_Spider-Man_(2012_film)) in 5 sentences

> Years later, a teenaged Peter attends Midtown Science High School, where he is bullied by Flash Thompson and has caught the eye of the beautiful Gwen Stacy.  After studying Richard's papers, Peter visits the one-armed Connors, reveals he is Richard Parker's son and gives Connors his father's "decay rate algorithm", the missing piece in Connors' experiments on regenerating limbs.  After seeing success with the mouse using lizard DNA, Ratha demands Connors begin human trials immediately if Osborn is to survive.  By the time he gets to the Williamsburg Bridge Connors has become a violent hybrid of lizard and man, tossing cars, including Ratha's, over the side of the bridge.  Spider-Man eventually disperses an antidote cloud instead, restoring Connors and earlier victims to normal, but not before Lizard mortally wounds Captain Stacy.

### [Zootopia](https://en.wikipedia.org/wiki/Zootopia) in 5 sentences

> In a world populated by anthropomorphic mammals, Judy Hopps, a rabbit from rural Bunnyburrow, fulfills her dream of becoming the first rabbit officer in the police department of nearby city Zootopia.  When Bogo and his reinforcements arrive, Bogo demands Judy's resignation, but Nick takes a stand, insisting they have 10 more hours to solve the case.  They identify the captors as wolves, which Judy believes Manchas and Otterton meant by “night howlers”.  Having developed a friendship with Nick, Judy requests that he joins the Zootopia Police Department and become her partner, which Wilde happily considers.  Fear and discrimination against predators spread across Zootopia, protests spawn with one done by Gazelle, and a guilt-ridden Judy resigns.

Some movies have sad endings...

### [Story of the Door from The Strange Case of Dr. Jekyll and Mr. Hyde by Robert Louis Stevenson](https://www.gutenberg.org/ebooks/43) in 5 sentences?

> He was austere with himself; drank gin when he was alone, to mortify a taste for vintages; and though he enjoyed the theatre, had not crossed the doors of one for twenty years.  Even on Sunday, when it veiled its more florid charms and lay comparatively empty of passage, the street shone out in contrast to its dingy neighbourhood, like a fire in a forest; and with its freshly painted shutters, well-polished brasses, and general cleanliness and gaiety of note, instantly caught and pleased the eye of the passenger.  Two doors from one corner, on the left hand going east the line was broken by the entry of a court; and just at that point a certain sinister block of building thrust forward its gable on the street.  It was two storeys high; showed no window, nothing but a door on the lower storey and a blind forehead of discoloured wall on the upper; and bore in every feature, the marks of prolonged and sordid negligence.  All at once, I saw two figures: one a little man who was stumping along eastward at a good walk, and the other a girl of maybe eight or ten who was running as hard as she was able down a cross street.

#### in 10 sentences...

> Mr. Utterson the lawyer was a man of a rugged countenance that was never lighted by a smile; cold, scanty and embarrassed in discourse; backward in sentiment; lean, long, dusty, dreary and yet somehow lovable.  He was austere with himself; drank gin when he was alone, to mortify a taste for vintages; and though he enjoyed the theatre, had not crossed the doors of one for twenty years.  Even on Sunday, when it veiled its more florid charms and lay comparatively empty of passage, the street shone out in contrast to its dingy neighbourhood, like a fire in a forest; and with its freshly painted shutters, well-polished brasses, and general cleanliness and gaiety of note, instantly caught and pleased the eye of the passenger.  Two doors from one corner, on the left hand going east the line was broken by the entry of a court; and just at that point a certain sinister block of building thrust forward its gable on the street.  It was two storeys high; showed no window, nothing but a door on the lower storey and a blind forehead of discoloured wall on the upper; and bore in every feature, the marks of prolonged and sordid negligence.  Tramps slouched into the recess and struck matches on the panels; children kept shop upon the steps; the schoolboy had tried his knife on the mouldings; and for close on a generation, no one had appeared to drive away these random visitors or to repair their ravages.  Mr. Enfield and the lawyer were on the other side of the by-street; but when they came abreast of the entry, the former lifted up his cane and pointed.  All at once, I saw two figures: one a little man who was stumping along eastward at a good walk, and the other a girl of maybe eight or ten who was running as hard as she was able down a cross street.  Well, sir, the two ran into one another naturally enough at the corner; and then came the horrible part of the thing; for the man trampled calmly over the child's body and left her screaming on the ground.  You sit quietly on the top of a hill; and away the stone goes, starting others; and presently some bland old bird (the last you would have thought of) is knocked on the head in his own back garden and the family have to change their name.

## Acknowledgements

 * [Lingua::EN::Sentence](https://github.com/dginev/perl6-Lingua-EN-Sentence)
 * [Lingua::EN::Stopwords](https://github.com/kmwallio/p6-Lingua-EN-Stopwords)
 * [Text::TFIdf](https://github.com/kmwallio/p6-Text-TFIdf)
 * [Wikipedia](http://en.wikipedia.org) where we stole synopses from...
