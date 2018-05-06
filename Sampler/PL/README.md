## Polish novel from Jan

This is a Wikisource text, downloaded with the following command
`curl https://pl.wikisource.org/wiki/Ogniem_i_mieczem/całość > Orig/ogniem.html`

The source text has one trivial syntactic error (`--` inside an XML comment) and one major problem I didn't discover 
till I had nearly finished: chapters 17 to 22 of volume 3 appear twice.
However, it is clean XHTML (more or less); features identified include
chapter headings and trailers, italicized phrases, poetry, quotation etc. and
even corrections made during transcription. I assume there will be many such texts, so invested some effort in an XSLT stylesheet, retag.xsl, intended preserve all such features and convert them to a TEI-like form. This turned out to be harder than I expected. The current state is not very satisfactory and will be improved as soon as I have learned how to use xsl:for-each-group properly.

Here's the list of features captured in the markup and converted to my pseudo-TEI:

 * page numbers, complete with links to page images 
 * paragraphs
 * corrections (marked with `<choice><orig>...</orig><corr>...</corr></choice>`)
 * links to editorial annotations (`<ref>` and `<note>`)
 * italic (`<hi>`)
 * embedded poetry or quotation are both marked with `<quote>`; poetry is further marked with `<lg>` and `<l>`; indented lines are distinguished by @rend
 * titles and trailers for parts and chapters
 
My current script converts all these to a mix of real TEI and fake
milestone tags such as `<chapStart>`, `<pStart>` `<pEND>` etc. Result is in `ogniem-1.tei` I then used oXygen (search and replace)
to  convert this to proper TEI (`ogniem-1.tei`), clearing up
any chad in the process. I then added a minimal  TEI header and removed or commented out valid
bits of TEI not provided by the ELTeC level 2 schema (specifically @facs, `<trailer>`, and
`<milestone>`)

eltec-1 : no choice, just corr, so i commented the other bits out
no lg

