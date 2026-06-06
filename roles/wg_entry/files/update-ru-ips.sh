#!/bin/bash

set -euo pipefail

ipset create -exist ru_ips hash:net family inet hashsize 4096 maxelem 65536

curl -s "https://stat.ripe.net/data/country-resource-list/data.json?resource=RU" \
  | jq -r '.data.resources.ipv4[]' \
  | while read -r cidr; do ipset add -exist ru_ips "$cidr"; done
