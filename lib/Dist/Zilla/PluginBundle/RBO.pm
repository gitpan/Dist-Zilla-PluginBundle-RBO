package Dist::Zilla::PluginBundle::RBO;
BEGIN {
  $Dist::Zilla::PluginBundle::RBO::VERSION = '0.001';
}
# ABSTRACT: BeLike::RBO when you build your dists


use Moose;
use Moose::Autobox;
use Dist::Zilla 4.102346; # TestRelease
with 'Dist::Zilla::Role::PluginBundle::Easy';


use Dist::Zilla::PluginBundle::Basic;


sub configure {
  my ($self) = @_;

  $self->add_bundle('@Basic');


  $self->add_plugins(qw(
    MetaConfig
    MetaJSON
    Git::NextVersion
    Git::Tag
    Repository
  ));

  $self->add_plugins([
      AutoMetaResources => {
          'bugtracker.rt' => 1,
          'repository.github' => [{ user => 'rbo' }],
          'homepage' => 'http://search.cpan.org/dist/%{dist}',
      }
  ]);

  $self->add_bundle('@Git' => {
      tag_format => 'v%v',
  });


}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
__END__

=head1 NAME

Dist::Zilla::PluginBundle::RBO

=head1 VERSION

=head1 DESCRIPTION

This is the plugin bundle that RBO uses.  

=cut


