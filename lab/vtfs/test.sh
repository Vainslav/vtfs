#!/bin/sh

FS_NAME="vtfs"
MOUNT_POINT="/mnt/vtfs"
MODULE="vtfs.ko"

set -e

echo "=============================="
echo " VTFS test script"
echo "=============================="


echo "[1] Проверка ls -la"
ls -la $MOUNT_POINT

echo "[2] Создание файла и запись"
echo "hello kernel vtfs" > $MOUNT_POINT/file1.txt

echo "[3] Чтение файла"
cat $MOUNT_POINT/file1.txt
ls -la $MOUNT_POINT


echo "[4] Создание каталога"
mkdir $MOUNT_POINT/dir1
sudo chmod 777 $MOUNT_POINT/dir1
ls -la $MOUNT_POINT

echo "[5] Файл внутри каталога"
echo "inside dir" > $MOUNT_POINT/dir1/inner.txt
cat $MOUNT_POINT/dir1/inner.txt
ls -la $MOUNT_POINT/dir1


echo "[6] Hard link"
ln $MOUNT_POINT/file1.txt $MOUNT_POINT/file1_link.txt
ls -lai $MOUNT_POINT

echo "[7] Проверка общих данных"
echo " + appended" >> $MOUNT_POINT/file1_link.txt
cat $MOUNT_POINT/file1.txt

echo "[8] Unlink файла"
rm $MOUNT_POINT/file1.txt
ls -l $MOUNT_POINT

echo "[9] Удаление каталога"
rm $MOUNT_POINT/dir1/inner.txt
rmdir $MOUNT_POINT/dir1
ls -la $MOUNT_POINT



echo "=============================="
echo " VTFS tests finished"
echo "=============================="