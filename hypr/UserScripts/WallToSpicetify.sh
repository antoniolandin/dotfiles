#!/bin/bash

spicetify update
rm ~/.Xresources
cp $HOME/.cache/wal/colors.Xresources $HOME
mv $HOME/colors.Xresources $HOME/.Xresources
xrdb -merge ~/.Xresources
