use v6;
use Lingua::EN::Stopwords::Short;
use Text::TFIdf;

=begin pod

=head1 NAME

Lingua::EN::Summary

=head1 DESCRIPTION

Lingua::EN::Summary calculates the top N sentences given an array of text.  It does this using TF-IDF vectors and the Page Rank algorithm.

TF-IDF vectors scores describe how related sentences are.  This can be normalized and used as a transition matrix for Page Rank.  We can use the top ranked sentences as a best guess summary for the overall content.

=head2 Examples

    use v6;
    use Lingua::EN::Summary;
    use Lingua::EN::Sentence;

    sub MAIN {
      my $text = slurp 'examples/zootopia.txt';
      my @sentences = $text.sentences;

      say summarize(@sentences, 5).join('  ');
    }

This example will select the top 5 sentences from a plot summary of Zootopia.

=end pod

module Lingua::EN::Summary {
  sub summarize(@text, Int $len, Int $iterations = 500) is export {
    # Create a TF-IDF object
    my $tfidf = TFIdf.new(:trim(True), :stop-list(%stop-words));

    # Add every sentences to the object
    @text.map(-> $s { $tfidf.add($s) } );

    # Create a transition matrix.  We will normalize(?) the
    # TD-IDF scores from each sentences to every other sentence
    my @rat = @text.map(-> $s { $tfidf.tfids($s)});
    my @tran = @rat.map(-> @tr {
      my @num = @tr <<+>> 0.001; # Say there's always a way to any other sentence
      my $den = @num.reduce(*+*);
      my @row = @num <</>> $den; # Normalize(?)
      @row
    });

    # Create a random surfer to go over our matrix
    my @surfer = @text.map({ 0 });
    @surfer[0] = 1;

    # Surf the matrix
    for [0..$iterations] -> $i {
      my @next = @tran.map(-> @p { (@p <<*>> @surfer).reduce(*+*) });
      @surfer = @next;
    }

    # Sort by the surfers visit log
    my %res = @surfer.pairs;
    my @best = sort -> $a, $b { %res{$b} <=> %res{$a}}, %res.keys;
    my @summed = @best[0..($len - 1)];
    my @res = @summed.sort: {$^a > $^b};

    # Return the top sentences in the order the originally appeared
    return @res.map(-> $i { @text[$i] });
  }
}
