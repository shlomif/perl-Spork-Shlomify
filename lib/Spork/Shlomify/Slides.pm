package Spork::Shlomify::Slides;

use strict;
use warnings;
use Spork;

use Spork::Slides -Base;

sub make_css_file {
    my $output = $self->hub->template->process('slide.css',
        %{$self->top_config},
        slides => $self->slide_index,
        spork_version => "Spork v$Spork::VERSION",
        next_slide => 'start.html',
    );
    my $file_name = $self->config->slides_directory . '/slide.css';
    $output > io($file_name)->assert;
}

sub make_slides {
    $self->SUPER::make_slides();
    $self->make_css_file();
}

1;

=head1 NAME

Spork::Shlomif::Slides - the slides generation class for Spork::Shlomify

=head1 FUNCTIONS

=head2 $self->make_slides()

Overrides Spork's make_slides to generate a slide.css file.

=head2 $self->make_css_file()

Generates the CSS file.

=head1 AUTHOR

Shlomi Fish, C<< shlomif@iglu.org.il >>

=head1 LICENSE

MIT X11 License.

=head1 SEE ALSO

L<Spork::Shlomify>

