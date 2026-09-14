#!/bin/sh

set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$script_dir/.."

version=$(tr -d '[:space:]' < VERSION)

case "$version" in
  ''|*[!0-9]*)
    printf 'VERSION must contain one integer\n' >&2
    exit 1
    ;;
esac

previous_version=$((version - 1))
migration="migrations/v${previous_version}-to-v${version}.md"

test -f BOOTSTRAP.md
test -f CHANGELOG.md
test -f MAINTENANCE.md
test -f "$migration"
test -f templates/.ai-engineering.yml
test -f .github/workflows/verify-baseline.yml
test -x scripts/verify-release.sh

grep -Fqx "**Baseline version: v${version}**" BOOTSTRAP.md
grep -Fqx "Current version: **v${version}**." README.md
grep -Fqx "  version: ${version}" templates/.ai-engineering.yml
grep -Fqx '  id: ai-engineering-bootstrap' templates/.ai-engineering.yml
grep -Fqx '  repository: jkrogsgaard/AI-Engineering' templates/.ai-engineering.yml
grep -Fqx '  source_commit: "<exact-upstream-commit>"' templates/.ai-engineering.yml
grep -Fqx "# Migration: v${previous_version} to v${version}" "$migration"
grep -Eq "^## v${version} - [0-9]{4}-[0-9]{2}-[0-9]{2}$" CHANGELOG.md
grep -Fqx '        run: ./scripts/verify-release.sh' .github/workflows/verify-baseline.yml

for heading in Added Changed Removed Reassess Preserve Verification; do
  grep -Fqx "## ${heading}" "$migration"
done

release_section=$(awk -v prefix="## v${version} " '
  index($0, prefix) == 1 { active = 1 }
  active && /^## v[0-9]+ / && index($0, prefix) != 1 { exit }
  active { print }
' CHANGELOG.md)

printf '%s\n' "$release_section" | grep -Fqx '### Removed'
printf '%s\n' "$release_section" | grep -Fqx '### Maintenance review'

if printf '%s\n' "$release_section" | grep -Eqi 'maintenance review pending|self-audit pending'; then
  printf 'Current changelog maintenance review is still pending\n' >&2
  exit 1
fi

chain_version=4
while [ "$chain_version" -lt "$version" ]; do
  next_version=$((chain_version + 1))
  test -f "migrations/v${chain_version}-to-v${next_version}.md"
  chain_version=$next_version
done

references=$(grep -rhoE 'v[0-9]+-to-v[0-9]+' BOOTSTRAP.md README.md CHANGELOG.md migrations | sort -u)
for reference in $references; do
  test -f "migrations/${reference}.md"
done

for skill in skills/*/; do
  skill_name=$(basename "$skill")
  skill_file="${skill}SKILL.md"
  test -f "$skill_file"
  test "$(sed -n '1p' "$skill_file")" = '---'
  grep -Fqx "name: ${skill_name}" "$skill_file"
  grep -Eq '^description: ' "$skill_file"
  for target in $(grep -oE '\]\([^)#]+\)' "$skill_file" | sed 's/^](//; s/)$//' | grep -Ev '^[a-z]+://'); do
    test -e "${skill}${target}"
  done
  if [ -f "${skill}evals/evals.json" ]; then
    python3 -c 'import json,sys; d=json.load(open(sys.argv[1])); sys.exit(0 if d.get("skill_name")==sys.argv[2] else 1)' "${skill}evals/evals.json" "$skill_name"
  fi
done

printf 'Baseline v%s release verification passed\n' "$version"
