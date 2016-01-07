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
# SAR情報の取得期間(秒)
SAR_EXEC_TIME=999

# 開始メッセージ
echo SAR情報の取得を開始します\(ctl+cで停止\)

# １秒間隔でsar情報の取得
sar -A -o $SAR_BINARY_FILE 1 $SAR_EXEC_TIME 1>/dev/null 2>&1

# 出力したSARバイナリファイルをテキスト化
env LANG=C sar -A -f $SAR_BINARY_FILE  > $SAR_TEXT_FILE 1>/dev/null 2>&1

# SAR情報を圧縮
tar zcvf $COMP_SAR_TEXT_FILE $SAR_TEXT_FILE 1>/dev/null 2>&1

# SAテキストファイルを削除
rm $SAR_TEXT_FILE

# 終了メッセージ
echo 
echo SAR情報の取得が終了しました
echo 出力SARバイナリファイル名: $SAR_BINARY_FILE
echo 出力SARファイル名: $COMP_SAR_TEXT_FILE
echo 

exit 0
