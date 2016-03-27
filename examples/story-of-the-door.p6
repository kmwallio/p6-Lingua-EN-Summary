use v6;
use Lingua::EN::Summary;
use Lingua::EN::Sentence;

sub MAIN {
  my $text = slurp 'examples/story-of-the-door.txt';
  my @sentences = $text.sentences;

  say summarize(@sentences, 10).join('  ');
}
