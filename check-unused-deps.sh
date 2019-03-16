# Using jq

# returns the dependencies property from package.json
jq '.dependencies' package.json

# Piping with jq - this returns an array of keys
jq '.dependencies | keys' package.json

# Breaks out the output into seperate lines so we can loop through them
jq '.dependencies | keys | .[]' package.json

# The -r flag gets you the raw output
jq -r '.dependencies | keys | .[]' package.json

# Example usage

# if we can't find a dependency, then mark it for removal
# wild cards around the dependency name just because it could have single quotes or double quotes
# recursive and quiet
# exclude node-modules, and then have it search in the current directory
for dep in $(jq -r '.dependencies | keys | .[]' package.json); do
  if ! grep "require\(.*$dep.*\)" -Rq --exclude-dir="node_modules" .; then
    echo "You can probably remove $dep"
  fi
done