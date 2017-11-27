#!/bin/bash
# Migrates from PEG to pest
# Warning: this is a super hacky script

sed 's/\//|/g' zantufa-1.2.peg \
        | sed 's/\./any/g' \
        | sed 's/  / /g' \
        | sed 's/^space_char.*$/space_char = _{("\." | "\\t" | "\\n" | "\\r" | "?" | "!" | "\\u{0020}")}/g' \
        | sed 's/\[\(.\)\(.*\)\]/\("\1" | \[\2\]/g' \
        | sed 's/\[\(.\)\(.*\)\]/"\1" | \[\2\]/g' \
        | sed 's/\[\(.\)\(.*\)\]/"\1" | \[\2\]/g' \
        | sed 's/\[\(.\)\(.*\)\]/"\1" | \[\2\]/g' \
        | sed 's/\[\(.\)\(.*\)\]/"\1" | \[\2\]/g' \
        | sed 's/ | \[\]/\)/g' \
        | sed 's/\([a-zA-Z0-9_?*+)]\) \([a-zA-Z0-9_!&(]\)/\1 ~ \2/g' \
        | sed 's/\([a-zA-Z0-9_?*+)]\) \([a-zA-Z0-9_!&(]\)/\1 ~ \2/g' \
        | sed 's/ <- \(.*\)/ = { \1 }/g' \
        | sed 's/;\(.*\)$/\/\/\1/g' \
              > ../src/zantufa-1.2.pest
