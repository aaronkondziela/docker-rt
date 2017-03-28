use utf8;

Set( $rtname, 'example.com');
Set( $OwnerEmail, 'joe_developer@example.com' );
Set( $MailCommand, 'mbox' ); # no emails out to world; log to /opt/rt4/var/

Set( $DevelMode, 1 ); # disables mason template/js/css caching
Set( $LogToSTDERR, 'debug' ); # more debuggery
Set( $StatementLog, 1 ); # Get SQL dumped

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

#     Plugin( "RT::Extension::SLA" );

1;
