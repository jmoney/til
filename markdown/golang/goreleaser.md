# goreleaser

When releasing binaries built in golang the currect defacto release tool is [goreleaser](https://goreleaser.com/).  Personally, I love to have homebrew versions of my tooling but creating and managing taps can be annoying.  Luckily, gorelaser has a nice hook into doing that.  Just add the following snippet.

```yaml
brews:
  - github:
      owner: jmoney8080
      name: homebrew-aws
    folder: Formula
    homepage:  https://www.jmoney8080.dev
    description: Collection of scripts that analyze easily correctable items to save money in AWS.
    test: |
      system "#{bin}/aws-cost-maintenance -h"
```
