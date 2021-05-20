# Cannot Connect to Localhost

This one is more of a bug TIL that has been annoying me lately.

Somewhat recently IntelliJ started to fail connecting to localhost when syncing an maven based project.

```plaintext
Caused by: java.rmi.ConnectException: Connection refused to host: 127.0.0.1; nested exception is: 
 java.net.ConnectException: Connection refused (Connection refused)
 at java.rmi/sun.rmi.transport.tcp.TCPEndpoint.newSocket(TCPEndpoint.java:619)
 at java.rmi/sun.rmi.transport.tcp.TCPChannel.createConnection(TCPChannel.java:209)
 at java.rmi/sun.rmi.transport.tcp.TCPChannel.newConnection(TCPChannel.java:196)
```

During troubleshooting, the caches were invalidated/restarted and the `.idea` directory was wiped and re-built but to no avail.

Found an [article](https://intellij-support.jetbrains.com/hc/en-us/articles/360014262940-Unable-to-import-Maven-project-import-fails-with-error-Cannot-reconnect) that was the exact problem.

Turns out, docker-for-desktop was adding a localhost line to the `/etc/hosts` file and for whatever reason DNS in intellij did not like that.

```plaintext
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1             localhost
# Added by Docker Desktop
# To allow the same kube context to work on the host and the container:
127.0.0.1 kubernetes.docker.internal
# End of section
```

Removing the lines for docker-for-desktop fixed the issue.

