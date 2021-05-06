#!/bin/bash

echo ""
echo "Что вы хотите сделать?"
echo "1 Сделать запись"
echo "2 Открыть список всех записей"
echo "3 Открыть корзину"
echo "4 Закончить работу"
echo "Введите соответствующую цифру (1 2 3 4)"
read comand

if [ "$comand" == "1" ]; then

	touch diary.txt
        mv diary.txt $HOME/$DIARYFILE 
	nano $HOME/$DIARYFILE/diary.txt
	echo ""
	echo ""
	echo "Введите 'save' чтобы сохранить запись"
	echo "Введите 'delete' чтобы удалить запись"
	read ans

	while [  $ans != save -a $ans != delete ]; do
		echo ""
		echo "Команда не распознана. Введите save или delete"
		echo ""
		read ans
	done

	if [ "$ans" == "save" ]; then

		cat $HOME/$DIARYFILE/newsms.txt >> $HOME/$DIARYFILE/alldiary.txt
		cat $HOME/$DIARYFILE/diary.txt >> $HOME/$DIARYFILE/alldiary.txt
		rm $HOME/$DIARYFILE/diary.txt
		echo "Запись сохранена успешно!"
		$HOME/$DIARYFILE/mainscript.sh
	elif [ "$ans" == "delete" ]; then
		cat $HOME/$DIARYFILE/newsms.txt >> $HOME/$DIARYFILE/basket.txt
                cat $HOME/$DIARYFILE/diary.txt >> $HOME/$DIARYFILE/basket.txt
                rm $HOME/$DIARYFILE/diary.txt
		echo "Запись удалена успешно!"
		$HOME/$DIARYFILE/mainscript.sh
	fi

elif [ "$comand" == "2" ]; then
	touch alldiary.txt
	mv alldiary.txt $HOME/$DIARYFILE
	nano $HOME/$DIARYFILE/alldiary.txt
	$HOME/$DIARYFILE/mainscript.sh
elif [ "$comand" == "3" ]; then
	touch basket.txt
        mv basket.txt $HOME/$DIARYFILE
	nano $HOME/$DIARYFILE/basket.txt
	$HOME/$DIARYFILE/mainscript.sh
elif [ "$comand" == "4" ]; then
	echo "Работа завершена"
else echo "Команда не распознана. Повторите попытку и введите цифру от 1 до 4"
     $HOME/$DIARYFILE/mainscript.sh
fi
