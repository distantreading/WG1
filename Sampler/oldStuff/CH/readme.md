in Oxygen I ran stylesheet tatiana.xslto remove all the facsimile and lb stuff, but retain links to page images.

Then:

remove (most of) the running headers with regexp:  
<p>\s+[A-Z][A-Z\.\s10À\'\!li\-]+\s<\/p>

move (many) page numbers into the right place with regexp:
/>\n\s+<p>\s+(\d+)\s+</p> ->   n="$1"/>\n  (209)


remove "¬ "  (737)
replace (\w+)¬\s*\n\s* by \n$1  (48)

Manually check and correct all pbs

Turn all "11" in text into "Il" (about 70)

Add header

Validate against eltec-0 (turn pb@facs into xml:id)
Fix broken paragraphs with regexp match
</p>([\n\s]+<pb[^>]+>[\n\s]+)<p>\s+([a-z]) -> $1$2

to do:  find chapter breaks
