#!/usr/bin/env bash

set -e

copy_files () {
    fileName=$1
    while IFS=\| read -ra line
    do
      x=$(basename "${line[0]}" '\')
      x="${x%.*}"
      cp -v "./drive/My Drive/dataset/$DATADIR/wavs/$x.wav" "$DATADIR/wavs/$x.wav" &
      cp -v "./drive/My Drive/dataset/$DATADIR/mels/$x.pt" "$DATADIR/mels/$x.pt" &
    done < "$fileName"
}
DATADIR="LJSpeech-1.1"
FILELISTSDIR="filelists"

TESTLIST="$FILELISTSDIR/ljs_audio_text_test_filelist.txt"
TRAINLIST="$FILELISTSDIR/ljs_audio_text_train_subset_625_filelist.txt"
VALLIST="$FILELISTSDIR/ljs_audio_text_val_filelist.txt"

TESTLIST_MEL="$FILELISTSDIR/ljs_mel_text_test_filelist.txt"
TRAINLIST_MEL="$FILELISTSDIR/ljs_mel_text_train_subset_625_filelist.txt"
VALLIST_MEL="$FILELISTSDIR/ljs_mel_text_val_filelist.txt"

mkdir -p "$DATADIR/mels"
mkdir -p "$DATADIR/wavs"
# cp -v "./drive/My Drive/dataset/$DATADIR/metadata.csv" "$DATADIR/metadata.csv" &
sort $TESTLIST $TRAINLIST $VALLLIST |uniq >/tmp/LIST
tmp="/tmp/LIST"
copy_files $tmp
# copy_files $TRAINLIST
# copy_files $VALLIST