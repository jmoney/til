# Regex

The tl;dr - need to be careful with regex's in javascript and the `g` flag as this can cause some caching to happen when using regex.

```javascript
const userMatcher = /user=(.+?)(?:;\s?|$)/g

function getUser(cookie) {
  const matches = userMatcher.exec(cookie);
  
  if (!matches || matches.length < 2) {
    return '';
  }
  
  return matches[1];
}

let cookie, user;

cookie = `other=110011; user=aaBBccDDeeFFgg; other=12345`;
user = getUser(cookie);

console.log({ user }); // should be 'aaBBccDDeeFFgg'

cookie = `user=112233445566; other=12345`;
user = getUser(cookie);

console.log({ user }); // should be '112233445566'
```

## The Problem
userMatcher has the g flag on, so the regex keeps track of the last match position and starts from there on a second call to exec.

## The Fix
Removing the g flag did it for me. But if you can’t, reset the regex by setting lastIndex=0 after each use.