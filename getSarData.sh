#!/bin/bash

# 実行日時の取得
EXEC_DATETME=`date '+%Y%m%d%H%M%S'`

# SARバイナリファイル名 
SAR_BINARY_FILE="sar_$EXEC_DATETME.out"
# SARテキストファイル名 
SAR_TEXT_FILE="sar_$EXEC_DATETME.txt"
# 圧縮後SARテキストファイル名 
COMP_SAR_TEXT_FILE="sar_$EXEC_DATETME.txt.tar.gz"

# １秒間隔でsar情報の取得
sar -A -o $SAR_BINARY_FILE 1  > /dev/null

# 出力したSARバイナリファイルをテキスト化
env LANG=C sar -A -f $SAR_BINARY_FILE  > $SAR_TEXT_FILE

# SAR情報を圧縮
tar zcvf $COMP_SAR_TEXT_FILE $SAR_TEXT_FILE

# SAテキストファイルを削除
rm $SAR_TEXT_FILE

exit 0
