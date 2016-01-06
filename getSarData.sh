#!/bin/bash
# getSarData.sh
#
# -----------------------------------------------------------------------------
# Purpose : sarコマンドにてリソース情報を取得する
# -----------------------------------------------------------------------------
# 2016.01.06 created  
#
# Description :
#   1. sarコマンドにてリソース情報を取得
#   2. SARバイナリをテキストファイル化
#   3. tar.gz形式に圧縮
#
# Usage :
#   $ getSarData.sh
#   Example) $ getSarData.sh
#   停止方法) ctl+c
#
# -----------------------------------------------------------------------------

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
