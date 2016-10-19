use utf8;

# Any configuration directives you include  here will override
# RT's default configuration file, RT_Config.pm
#
# To include a directive here, just copy the equivalent statement
# from RT_Config.pm and change the value. We've included a single
# sample value below.
#
# If this file includes non-ASCII characters, it must be encoded in
# UTF-8.
#
# This file is actually a perl module, so you can include valid
# perl code, as well.
#
# The converse is also true, if this file isn't valid perl, you're
# going to run into trouble. To check your SiteConfig file, use
# this command:
#
#   perl -c /path/to/your/etc/RT_SiteConfig.pm
#
# You must restart your webserver after making changes to this file.

Set( $rtname, 'example.com');
Set( $OwnerEmail, 'joe_developer@example.com' );
Set( $MailCommand, 'mbox' ); # no emails out to world; log to /opt/rt4/var/
Set( $DevelMode, 1 ); # disables mason template/js/css caching
Set( $LogToSTDERR, 'debug' ); # more debuggery
Set( $CommentAddress, '' );
Set( $CorrespondAddress, '' );
Set( $DatabaseHost, 'localhost' );
Set( $DatabaseName, 'rt4' );
Set( $DatabasePort, '' );
Set( $DatabaseType, 'mysql' );
Set( $DatabaseUser, 'rt_user' );
Set( $DatabasePassword, 'thisisatest');
Set( $Organization, 'example.com' );
Set( $SendmailPath, '/usr/sbin/sendmail' );
Set( $WebDomain, 'localhost' );
Set( $WebPort, '80' );
Set( $RTAddressRegexp, 'localhost|127\.0\.0\.1' );

# You must install Plugins on your own, this is only an example
# of the correct syntax to use when activating them:
#     Plugin( "RT::Extension::SLA" );
#     Plugin( "RT::Authen::ExternalAuth" );

1;
