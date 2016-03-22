#!/usr/bin/perl

use strict;
use warnings;
use JSON::RPC::Legacy::Client;
use Data::Dumper;

# Authenticate yourself
my $client = new JSON::RPC::Legacy::Client;
my $url = 'http://127.0.0.1/zabbix/api_jsonrpc.php';
my $authID;
my $response;
my $username = " ";
my $password = ' ';

my $json = {
        jsonrpc => "2.0",
        method => "user.login",
        params => {
                user => "$username",
                password => "$password" },
        id => 1
};

$response = $client->call($url, $json);
# Check if response was successful
die "Authentication failed\n" unless $response->content->{'result'};
# Print full response to console
print Dumper($response);

# Extract AuthID from returned object.
$authID = $response->content->{'result'};
print "Authentication successful. Auth ID: " . $authID . "\n";

# Get list of all hosts using authID
$json = {
        jsonrpc=> '2.0',
        method => 'host.get',
        params => {
                output => ['hostid','name'], # get only host id and host name
                sortfield => 'name' },       # sort by host name
        id => 1,
        auth => "$authID",
        };
$response = $client->call($url, $json);
# Check if response was successful
die "host.get failed\n" unless $response->content->{result};
# print Dumper($response);
print "List of hosts\n-----------------------------\n";
foreach my $host (@{$response->content->{result}}) {
	print "Host ID: ".$host->{hostid}. " Host: ".$host->{name}."\n";
}
