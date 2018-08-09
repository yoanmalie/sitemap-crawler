#!/bin/bash

#######################################################

# What is it?
#     This bash script will look for URL that are
#     stored in the specified sitemap.xml file

# How to use?
#     Open your console and launch: 
#     ./sitemap-crawler.sh https://yoursite.com

# About:
#     github.com/yoanmalie/sitemap-crawler
#     yoan-malie.fr
#     twitter.com/yoanmalie

#######################################################



# Global
DOMAIN_NAME=$1
declare -i nb=0

# Colors
MAGENTA="\033[0;35m"
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
NC="\033[0m"



# Check if DOMAIN_NAME is empty.
# If not, continue.
if [ "$1" = "" ]; then
    printf "${RED}You need to pass an URL to fetch!${NC}\n"
    exit 1;
else
    printf "${BLUE}Start fetching data from $DOMAIN_NAME/sitemap.xml${NC}\n"
fi



# Filtered domain name.
ESCAPE_DOMAIN_NAME=$(echo "$DOMAIN_NAME" | sed 's#http[s]*://##g; s#\.#-#g;')



# Create a local temporary file for the sitemap.
sitemapTempfile=`mktemp "${TMPDIR:-/tmp}"/$ESCAPE_DOMAIN_NAME-sitemap-XXXXXXXX`
trap "rm -f $sitemapTempfile" 0 1 2 5 15



# Call sitemap.xml and save it in the temporary file with a perfect indented XML format.
curl -s -S $DOMAIN_NAME/sitemap.xml | xmllint --format - >> $sitemapTempfile

# Search and show URL who are between the `loc` tag in the sitemap.
grep -E -o "<loc>(.*)</loc>" $sitemapTempfile | while read -r line ; do
    nb=$nb+1
    printf "$nb - ${MAGENTA}Visit${NC} $(echo "$line" | sed 's#<[^>]*>##g') \n"
done



printf "${GREEN}$DOMAIN_NAME/sitemap.xml fetched!${NC}\n"

