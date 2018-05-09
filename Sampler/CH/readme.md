in Oxygen I ran stylesheet tatiana.xslto remove all the facsimile and lb stuff, but retain links to page images.

Then:

ran this regexp to remove (most of) the running headers

<p>\s+[A-Z][A-Z\.\s10À\'\!li\-]+\s<\/p>

followed by this one to drag the page numbers into the right place

/>\n\s+<p>\s+(\d+)\s+</p> ->   n="$1"/>\n  (209)


remove "¬ "  (737)
replace (\w+)¬\s*\n\s* by \n$1  (48)

Manual checking of pbs