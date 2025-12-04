#!/bin/bash
# media-listen.sh — live song info updates
playerctl -a metadata --format "{{ artist }} - {{ title }}" --follow
