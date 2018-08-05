# sitemap-crawler
> Get a list of all URL from a sitemap.xml in command line

This bash script will look for URL from your domain that are stored in the sitemap.xml file.

✅ Tested on macOS 10.12.6.  
⚠️ Not tested on Linux (But should work).  
❌ Not tested on Windows 10 with Bash for Windows.

## How to use it?
- You need to have a sitemap.xml file on the root of your domain.
- You can create an alias to get rid of typing everything each time!

Simply launch `./sitemap-crawler.sh https://yoursite.com`

## Troubleshooting
> permission denied: ./sitemap-crawler.sh

Depending on where you execute this script you maybe need to add `bash` before.  
`bash ./sitemap-crawler.sh https://yoursite.com`