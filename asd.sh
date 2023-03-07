#!/bin/bash

echo "Выполнила Скарлухина Александра Игоревна"
echo "Программный скрипт, разработанный для упрощения создания, удаления и перемещения файлов"

# Бесконечный цикл
while true
do
    echo "Выберите операцию: создать, удалить, переместить"
    
    # Считываем ввод пользователя
    read operation
    
    # Обрабатываем ввод пользователя
    case $operation in
        "создать")

            echo "Введите имя нового файла:"
            read filename
            

            if [ -e "$filename" ]
            then
                echo "Ошибка: файл с таким именем уже существует" >&2
            else

                touch "$filename"
                echo "Файл $filename успешно создан"
            fi
            ;;
        "удалить")

            echo "Введите имя файла, который нужно удалить:"
            read filename
            
            if [ -e "$filename" ]
            then

                rm "$filename"
                echo "Файл $filename успешно удален"
            else
                echo "Ошибка: файл с таким именем не существует" >&2
            fi
            ;;
        "переместить")

            echo "Введите имя файла, который нужно переместить:"
            read filename
            
            if [ -e "$filename" ]
            then

                echo "Введите путь к каталогу, в который нужно переместить файл:"
                read directory
                

                if [ -d "$directory" ]
                then

                    mv "$filename" "$directory"
                    echo "Файл $filename успешно перемещен в каталог $directory"
                else
                    echo "Ошибка: указанный каталог не существует" >&2
                fi
            else
                echo "Ошибка: файл с таким именем не существует" >&2
            fi
            ;;
        *)
            echo "Ошибка: некорректная операция" >&2
            ;;
    esac
    

    echo "Продолжить? (да / нет)"
    read response
    if [ "$response" != "да" ]
    then
        # Выходим из цикла
        break
    fi
done

echo "Работа программы завершена"
exit 0
