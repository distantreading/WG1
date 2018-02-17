# Latvian novel from Eva
1. The link given provided a page of links, one to each chapter of the novel. I downloaded that page, and hand edited with emacs to produce a shell script (LV_grab) to download each chapter to a separate file (files are in Orig)
2. On inspection I identified the following necessary changes:
   - convert char encoding from windows-1257 to UTF-8
   - strip out initial and final HTML tagging
   - wrap the text in a `<div>`
   - convert chapter titles (marked with `<big>` in HTML) to <head>
   - convert `<br>` tags to `</p><p>`
   - convert `&nbsp;` to `&#160;` 
3. I decided to do these at the command line, using the unix iconv utility to manage the character conversion, and a tiny perl script (retag.prl) to do the rest
4. I wrote a minimal TEI Header for the file, and ran a shell script (LV_conv) to convert and then append each chapter file to it.
 
