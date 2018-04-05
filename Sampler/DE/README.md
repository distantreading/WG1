## German novel from Berenike

This is a richly encoded TEI XML file from the DTA. 

The XSLT script `detag.xsl` downtranslates to our schema. Some elements are just silently removed; some are turned into xml comments.

A global regexp search and replace in oXyGen removed 
all end of line hyphenation ( s/-\n([^\s]+)/\1\n/)

Need to review the header for consistency: also this assumes we suppress all liminal things.



