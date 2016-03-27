# Lingua::EN::Summary

Finds *N* sentences from inside a chunk of text that best summarize the text using [TF-IDF vectors](https://en.wikipedia.org/wiki/Tf%E2%80%93idf) and [PageRank](https://en.wikipedia.org/wiki/PageRank). [![Build Status](https://travis-ci.org/kmwallio/p6-Lingua-EN-Summary.svg?branch=master)](https://travis-ci.org/kmwallio/p6-Lingua-EN-Summary)

This is just an experiment.  It's pretty slow at the moment, looking at speeding up Text::TFIdf and this to make it more usable...

By default, we do 500 iterations.  There is an optional parameter for increasing or decreasing the number of iterations done.

## Installation

```
panda install git://github.com/kmwallio/p6-Text-TFIdf.git
panda install git://github.com/kmwallio/p6-Lingua-EN-Summary.git
```

## Usage

``` perl6
use v6;
use Lingua::EN::Summary;
use Lingua::EN::Sentence;

my @long-winded = "explanation.txt".IO.slurp.sentences;
# Generate 5 sentences
my @nice-and-short = summarize($long-winded, 5);
# Or
# Generate 5 sentences after 1000 iterations
my @nice-and-short = summarize($long-winded, 5, 1000);
```

### [The Amazing Spider-Man](https://en.wikipedia.org/wiki/The_Amazing_Spider-Man_(2012_film)) in 5 Sentences

> Years later, a teenaged Peter attends Midtown Science High School, where he is bullied by Flash Thompson and has caught the eye of the beautiful Gwen Stacy.  After studying Richard's papers, Peter visits the one-armed Connors, reveals he is Richard Parker's son and gives Connors his father's "decay rate algorithm", the missing piece in Connors' experiments on regenerating limbs.  After seeing success with the mouse using lizard DNA, Ratha demands Connors begin human trials immediately if Osborn is to survive.  By the time he gets to the Williamsburg Bridge Connors has become a violent hybrid of lizard and man, tossing cars, including Ratha's, over the side of the bridge.  Spider-Man eventually disperses an antidote cloud instead, restoring Connors and earlier victims to normal, but not before Lizard mortally wounds Captain Stacy.

### [Zootopia](https://en.wikipedia.org/wiki/Zootopia) in 5 Sentences

> In a world populated by anthropomorphic mammals, Judy Hopps, a rabbit from rural Bunnyburrow, fulfills her dream of becoming the first rabbit officer in the police department of nearby city Zootopia.  When Bogo and his reinforcements arrive, Bogo demands Judy's resignation, but Nick takes a stand, insisting they have 10 more hours to solve the case.  They identify the captors as wolves, which Judy believes Manchas and Otterton meant by “night howlers”.  Having developed a friendship with Nick, Judy requests that he joins the Zootopia Police Department and become her partner, which Wilde happily considers.  Fear and discrimination against predators spread across Zootopia, protests spawn with one done by Gazelle, and a guilt-ridden Judy resigns.

Some movies have sad endings...

## Acknowledgements

 * [Lingua::EN::Sentence](https://github.com/dginev/perl6-Lingua-EN-Sentence)
 * [Lingua::EN::Stopwords](https://github.com/kmwallio/p6-Lingua-EN-Stopwords)
 * [Text::TFIdf](https://github.com/kmwallio/p6-Text-TFIdf)
 * [Wikipedia](http://en.wikipedia.org) where we stole synopses from...
