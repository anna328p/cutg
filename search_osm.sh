#!/usr/bin/env bash

eid="$1"

curl -sSL \
	--get \
	-H 'User-Agent: CU Trans Guide Script v0' \
	-H 'Content-Type: application/json' \
	--data 'addressdetails=1' \
	--data 'format=jsonv2' \
	--data-urlencode "q=$(cat)" \
	"https://nominatim.openstreetmap.org/search.php" \
	| jq '.[0] | (.address | {street: (.house_number + " " + .road), city, state, postcode}) + ({lat, lon} | map_values(tostring | sub("^(?<x>-?........).*"; "\(.x)"))) | '"{$eid: .}" \
	| yj -jy
