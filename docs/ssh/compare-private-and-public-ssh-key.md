# Compare Private and Public SSH Key Pair

```bash
diff <( ssh-keygen -y -e -f "id_rsa" ) <( ssh-keygen -y -e -f "id_rsa.pub" )
```

The above can be used to compare the ssh key pair used for ssh to ensure that the public key matches the private key.
