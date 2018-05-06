## Portuguese text from Diana

A plain text version, almost entirely innocent of markup, but not encoded in Unicode. I wrote a simple perl script to introduce paragraph and chapter boundaries, and to act upon the `<poesia>` tags kindly introduced by whoever was responsible for the text.


~~~~
iconv -f iso-8859-1 -t UTF8 Orig/JD_As_Pupilas_do_Senhor_Reitor.txt | perl tagit.prl > reitor-0.tei
~~~~

When I loaded this into oXygen, I discovered a strange `<estrang>` tag used to indicate that the following lines were in Italian: since this was a unique occurrence, I just fixed it by hand. As I did the misplaced </div> introduced by my lazy perl coding.

TODO: add a header
    subdivide the `<lg>`s ?
    