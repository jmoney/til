# Facts

Facts are a bit of data on the server that configuration frameworks like puppet and ansible can read and take advantage of.  The facts for ansible go in `/etc/ansible/facts.d` and can be a file that contains JSON or INI format or an executable script that returns JSON.  The extension is `.fact`. These facts are then available via `ansible <hostname> -m setup`

`/etc/ansible/facts.d/preferences.fact`
```ini
[general]
asdf=1
bar=2
```

```bash
ansible <hostname> -m setup -a "filter=ansible_local"
```

```json
"ansible_local": {
        "preferences": {
            "general": {
                "asdf" : "1",
                "bar"  : "2"
            }
        }
 }
```