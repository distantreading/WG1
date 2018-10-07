## Sample text from the Biblioteca Virtual Miguel de Cervantes Saavedra

- First step is to convert this to TEI-conformant P5: the stylesheet `toTEI.xsl` does this. The original file (BVMC5433-0.xml) had unresolved references to files of character entities; the replacement (BVMC5433.xml) resolves the references  by using online definitions provided at www.oasis-open.org. A side effect of running the stylesheet against this file is that all characters are converted to UTF8. The stylesheet also makes the following changes:
 - Root element is TEI, not TEI.2
 - Change div0 to div type="chapter"
 - Reorganise content of change elements to match current spec; remove non TEI eDate element
 - language/@id is now called @ident
 - change nonTEI attributes  @italic @align and @num to appropriate values for @rend
Other tags are left unchanged. TEI-conformant result is in BVMC5433.tei

Unresolved issues:
  1 I haven't worked out how to resolve a  minor problem caused by the absence of namespace for the input.
  2 The original has no source description.




## CLIGS Spanish text from Christof

- replace PI
- add required @xml:id and @xml:lang on text
- use retag.xsl to 
  - change `<principal>` to `<respStmt>` 
  - remove redundant @part attribute values
  - remove @cert @subtype @resp likewise
  - comment out problematic bits of header and abstract pro tem
  - change `seg[@rend]` to `<hi>`

 
