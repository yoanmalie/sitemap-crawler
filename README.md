# sitemap-crawler
> Get a list of all URL from a sitemap.xml in command line

This bash script will look for URL that are stored in the specified sitemap.xml file.

✅ Tested on macOS 10.12.6.  
⚠️ Not tested on Linux (But should work).  
❌ Not tested on Windows 10 with Bash for Windows.

## How to use it?
Simply launch `./sitemap-crawler.sh https://yoursite.com/sitemap.xml`  
It's work also for local file `./sitemap-crawler.sh ./path/to/your/sitemap.xml`

## Troubleshooting
> permission denied: ./sitemap-crawler.sh

Depending on where you execute this script you maybe need to add `bash` before.  
`bash ./sitemap-crawler.sh https://yoursite.com/sitemap.xml`