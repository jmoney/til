# Handlers

Sometimes you want to trigger other tasks only if certain tasks have changed.  This is where the notify attribute and handlers come into play.

```yaml
tasks:
    - template:
        src: "README.md.j2"
        dest: "README.md"
      notify: commit and push

  handlers:
    - name: commit and push
      shell: |
        git config user.name "CircleCI"
        git config user.email "noreply@circleci.com"
        git add README.md
        git commit -m "Added newly generated README"
        git push origin master
```
