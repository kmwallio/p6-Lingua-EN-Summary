use v6;
use Lingua::EN::Summary;
use Lingua::EN::Sentence;
use Test;

my $text = slurp 'examples/zootopia.txt';
my @sentences = $text.sentences;

ok summarize(@sentences, 5).elems == 5, "Should get 5 sentences";
