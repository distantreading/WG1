## The WG1 Sampler 

This directory contains preliminary versions of ELTeC candidate documents, created from a variety of different input formats, supplied by WG1 members following the Prague meeting.

It contains several subdirectories, each named for a different language. Within each subdirectory the organization and file naming conventions should be identical.
- there is a subdirectory `Orig` containing one or more files in the form in which they were originally submitted, or downloaded
- there is a README.md file explaining briefly how the file was processed and commenting on any residual problems
- the ELTeC version is in a file named XXdddd.eltec (corresponding with the xml:id value for the `<text>`element)
- there may be other intermediate files (named with an extension `.tei`)
- there will usually be one or more script files (e.g. in XSLT, or perl) used to effect the conversion, as described by the README

The ELTeC file is validated against the schema file indicated  by an `xml-model` PI at the start of each file. At present, only the initial `encoding_proposal.rnc` schema has been used for this purpose.

These are the input formats handled :
----|------------------------
CH | Simple XML (from OCR)
CS | epub
DE | TEI XML (DTA)
DU | epub
EN | gutenberg
FR | TEI XML (CLIGS)
HR | epub
IT | TEI XML (CLIGS)
LV | basic HTML
PL | wikisource HTML
SP | TEI P3+ 
SR | docx

