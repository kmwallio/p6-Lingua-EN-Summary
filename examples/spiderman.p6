use v6;
use Lingua::EN::Summary;
use Lingua::EN::Sentence;

sub MAIN {
  my $text = slurp 'examples/spiderman.txt';
  my @sentences = $text.sentences;

  say summarize(@sentences, 5).join('  ');
}
