#!/bin/bash
# Write Build / Version Number into README.md, AUTO-CONFIGURATION.md and MANUAL-CONFIGURATION.md files
# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/HeronSantosCom/nginx-ultimate-bad-bot-blocker

##############################################################################                                                                
#       _  __     _                                                          #
#      / |/ /__ _(_)__ __ __                                                 #
#     /    / _ `/ / _ \\ \ /                                                 #
#    /_/|_/\_, /_/_//_/_\_\                                                  #
#       __/___/      __   ___       __     ___  __         __                #
#      / _ )___ ____/ /  / _ )___  / /_   / _ )/ /__  ____/ /_____ ____      #
#     / _  / _ `/ _  /  / _  / _ \/ __/  / _  / / _ \/ __/  '_/ -_) __/      #
#    /____/\_,_/\_,_/  /____/\___/\__/  /____/_/\___/\__/_/\_\\__/_/         #
#                                                                            #
##############################################################################                                                                

# MIT License

# Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
# https://github.com/mitchellkrogza

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# ******************
# Set Some Variables
# ******************

YEAR=$(date +%Y)
MONTH=$(date +%m)
MY_GIT_TAG=V3.$YEAR.$MONTH.$TRAVIS_BUILD_NUMBER
BAD_REFERRERS=$(wc -l < $TRAVIS_BUILD_DIR/_generator_lists/bad-referrers.list)
BAD_BOTS=$(wc -l < $TRAVIS_BUILD_DIR/_generator_lists/bad-user-agents.list)

# **********************************
# Temporary database files we create
# **********************************

_inputdbA=/tmp/lastupdated.db
_tmpnginxA=tmpnginxA

# ***************************************************************
# Start and End Strings to Search for to do inserts into template
# ***************************************************************

_startmarker="_______________"
_endmarker="____________________"

# ****************************************
# PRINT VERSION INFORMATION INTO README.md
# ****************************************

printf '%s\n%s%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Bad Referrer Count: " "$BAD_REFERRERS" "#### Bad Bot Count: " "$BAD_BOTS" "$_endmarker" >> "$_tmpnginxA"
mv $_tmpnginxA $_inputdbA
ed -s $_inputdbA<<\IN
1,/_______________/d
/____________________/,$d
,d
.r /home/travis/build/HeronSantosCom/nginx-ultimate-bad-bot-blocker/README.md
/_______________/x
.t.
.,/____________________/-d
#,p
#,p used to print output replaced with w below to write
w /home/travis/build/HeronSantosCom/nginx-ultimate-bad-bot-blocker/README.md
q
IN
rm $_inputdbA

# ****************************************************
# PRINT VERSION INFORMATION INTO AUTO-CONFIGURATION.md
# ****************************************************

printf '%s\n%s%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Bad Referrer Count: " "$BAD_REFERRERS" "#### Bad Bot Count: " "$BAD_BOTS" "$_endmarker" >> "$_tmpnginxA"
mv $_tmpnginxA $_inputdbA
ed -s $_inputdbA<<\IN
1,/_______________/d
/____________________/,$d
,d
.r /home/travis/build/HeronSantosCom/nginx-ultimate-bad-bot-blocker/AUTO-CONFIGURATION.md
/_______________/x
.t.
.,/____________________/-d
#,p
#,p used to print output replaced with w below to write
w /home/travis/build/HeronSantosCom/nginx-ultimate-bad-bot-blocker/AUTO-CONFIGURATION.md
q
IN
rm $_inputdbA

# ******************************************************
# PRINT VERSION INFORMATION INTO MANUAL-CONFIGURATION.md
# ******************************************************

printf '%s\n%s%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Bad Referrer Count: " "$BAD_REFERRERS" "#### Bad Bot Count: " "$BAD_BOTS" "$_endmarker" >> "$_tmpnginxA"
mv $_tmpnginxA $_inputdbA
ed -s $_inputdbA<<\IN
1,/_______________/d
/____________________/,$d
,d
.r /home/travis/build/HeronSantosCom/nginx-ultimate-bad-bot-blocker/MANUAL-CONFIGURATION.md
/_______________/x
.t.
.,/____________________/-d
#,p
#,p used to print output replaced with w below to write
w /home/travis/build/HeronSantosCom/nginx-ultimate-bad-bot-blocker/MANUAL-CONFIGURATION.md
q
IN
rm $_inputdbA

# *******************************************************
# PRINT VERSION INFORMATION INTO Google Ghost Spam README
# *******************************************************

printf '%s\n%s%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Bad Referrer Count: " "$BAD_REFERRERS" "#### Bad Bot Count: " "$BAD_BOTS" "$_endmarker" >> "$_tmpnginxA"
mv $_tmpnginxA $_inputdbA
ed -s $_inputdbA<<\IN
1,/_______________/d
/____________________/,$d
,d
.r /home/travis/build/HeronSantosCom/nginx-ultimate-bad-bot-blocker/_google_analytics_ghost_spam/README.md
/_______________/x
.t.
.,/____________________/-d
#,p
#,p used to print output replaced with w below to write
w /home/travis/build/HeronSantosCom/nginx-ultimate-bad-bot-blocker/_google_analytics_ghost_spam/README.md
q
IN
rm $_inputdbA


exit 0

# MIT License

# Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
# https://github.com/mitchellkrogza

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.