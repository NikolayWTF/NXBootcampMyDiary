#!/bin/bash
echo "Добро пожаловать в дневник!"
echo "Для начала работы укажите путь к Дневнику"
echo "Например: Desktop/MyFavoriteDiary"
read DIARY
export DIARYFILE=$DIARY

./mainscript.sh

