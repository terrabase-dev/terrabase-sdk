# terrabase-sdk

Protobuf definitions and generated client libraries for the Terrabase API. Publishes a Go module and an npm package on each tagged release.

## Packages

| Language | Package | Install |
|----------|---------|---------|
| Go | `github.com/terrabase-dev/terrabase-sdk` | `go get github.com/terrabase-dev/terrabase-sdk@latest` |
| TypeScript | `@terrabase-dev/terrabase-sdk` | `npm install @terrabase-dev/terrabase-sdk` |

## Structure

```
proto/          # protobuf source definitions
specs/          # generated Go stubs (do not edit)
ts/             # generated TypeScript stubs (do not edit)
docs/
  descriptor.bin  # compiled FileDescriptorSet, attached to each release
```

## Usage

### Go

```go
import (
    applicationv1 "github.com/terrabase-dev/terrabase-sdk/specs/application/v1"
    authv1 "github.com/terrabase-dev/terrabase-sdk/specs/auth/v1"
)
```

### TypeScript

```ts
import { Application } from "@terrabase-dev/terrabase-sdk/application/v1/application_pb"
import { AuthService } from "@terrabase-dev/terrabase-sdk/auth/v1/auth_pb"
```

The npm package is hosted on GitHub Packages. Even though this repo is public, GitHub Packages requires authentication to install. Add the following to `.npmrc` in the consuming repo:

```
@terrabase-dev:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=YOUR_TOKEN
```

A GitHub personal access token with `read:packages` scope is sufficient.

## Regenerating

Generated files are committed. To regenerate after editing a `.proto` file:

```bash
make generate
```

Requires the [buf CLI](https://buf.build/docs/installation).

## Releasing

Push a semver tag. The [publish workflow](.github/workflows/publish.yaml) creates a GitHub release with `descriptor.bin` attached, stamps the npm package version, and publishes both packages automatically.

```bash
git tag v1.2.3
git push origin v1.2.3
```
