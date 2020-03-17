#!/usr/bin/env bash
if [ -n "$1" ]; then
    output=$1
else
    output="output"
fi
mkdir -p "$output/"
python inference.py --tacotron2 "$output/checkpoint_Tacotron2_150" --waveglow "$output/checkpoint_WaveGlow_100" -o "$output/" -i phrases/phrase.txt --amp-run