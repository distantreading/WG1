## Czech text from Michael

An epub file. So actually a zip archive containing lots of fluff and one HTML file per chapter. What could possibly go wrong?

* Each HTML file in this epub has a DOCTYPE declaration pointing to an ancient version of the XHTML DTD at "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd". Which apparently embeds some other file, which is no longer available there. This means it takes forever to parse. So I need to pre-process the files to drop the DOCTYPE before handing it on to saxon. xmllint (I discover after some patient googling) will do the job.
* Some of these XHTML files use the named entity reference &amp;nbsp; rather than the numeric entity &#160; ... so I need to preprocess the XHTML files to replace them. Life is short and perl is quick.
* I confect a simple TEI Header by hand rather than trying to concoct one from the metadata provided by the epub

Here's my shell script (it assumes that the .epub file has been unzipped into the Orig directory)

~~~~
cp CS0001-header.eltec CS0001.eltec
for f in Orig/OEBPS/Text/*html; do \
echo $f; \
perl -i -pe"s/nbsp/#160/g" $f; \
xmllint --dropdtd $f | saxon -s:- retag.xsl >> CS0001.eltec; done
~~~~

