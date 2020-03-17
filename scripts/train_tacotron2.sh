#!/usr/bin/env bash
if [ -n $1 ]; then
    output = $1
else
    output="output"
mkdir -p "$output/"
--epochs-per-checkpoint 50
# python -m multiproc train.py -m Tacotron2 -o ./output/ --training-files filelists/ljs_audio_text_train_subset_625_filelist.txt -lr 1e-3 --epochs 1501 -bs 104 --weight-decay 1e-6 --grad-clip-thresh 1.0 --cudnn-enabled --log-file nvlog.json --anneal-steps 500 1000 1500 --anneal-factor 0.1 --amp-run
python -m multiproc train.py -m Tacotron2 -o "$output/" --training-files filelists/ljs_audio_text_train_subset_625_filelist.txt -lr 1e-3 --epochs-per-checkpoint 50 --epochs 151 -bs 104 --weight-decay 1e-6 --grad-clip-thresh 1.0 --cudnn-enabled --log-file nvlog.json --anneal-steps 500 1000 1500 --anneal-factor 0.1 --amp-run
