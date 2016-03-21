curl -i -n -X POST --header "Content-Type: application/json" -d@- http://zabbix-server/zabbix/api_jsonrpc.php

### Authentication

{
    "jsonrpc": "2.0",
    "method": "user.login",
    "params": {
        "user": "username",
        "password": "password"
    },
    "id": 1,
    "auth": null
}


### Retrieving hosts
{
    "jsonrpc": "2.0",
    "method": "host.get",
    "params": {
        "output": [
            "hostid",
            "host"
        ],
        "selectInterfaces": [
            "interfaceid",
            "ip"
        ]
    },
    "id": 1,
    "auth": "183f8e229113f5efe0fe558f86b7369b"
}

### Creating a new item

{
    "jsonrpc": "2.0",
    "method": "item.create",
    "params": {
        "name": "Free disk space on $1",
        "key_": "vfs.fs.size[/home/joe/,free]",
        "hostid": "10084",
        "type": 0,
        "value_type": 3,
        "interfaceid": "1",
        "delay": 30
    },
    "auth": "183f8e229113f5efe0fe558f86b7369b",
    "id": 1
}
