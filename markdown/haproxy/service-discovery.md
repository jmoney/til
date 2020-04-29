# Service Discovery

HAProxy can actually leverage DNS SRV records and build a service discovery setup using these SRV records.

First we need to configure some resolver options

```
resolvers mydns
    nameserver dns1 <name server>
    accepted_payload_size 8192 # allow larger DNS payloads
```

The key here is the `accept_payload_size`.  We need to increase this as SRV records can be a lot and do not fit in the default payload size.

Next we need to configure what is called `server-template`s. Server templates are a server line under the backend that expands to the maximum entries.  If you have `server-template 5` it will expand to 5 backend server lines based on the number of SRV records returned.

```
backend webservers
    balance roundrobin
    server-template web 5 myservice.example.local:80 check resolvers mydns init-addr none
```