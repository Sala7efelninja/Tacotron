#!/usr/bin/env bash
if [ -n "$1" ]; then
    output=$1
else
    output="output"
fi
mkdir -p "$output/"
python inference.py --tacotron2 "nvidia_tacotron2pyt_fp32_20190427" --waveglow "waveglow_256channels_ljs_v3.pt" -o "$output/" -i phrases/phrase.txt --amp-run