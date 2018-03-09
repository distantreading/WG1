## Sample text from the Biblioteca Virtual Miguel de Cervantes Saavedra

- First step is to convert this to pure TEI-conformant P5: the stylesheet `toTEI.xsl` does this. This involves converting named character entities  to Unicode, and suppressing several  non-TEI attributes. There is an unresolved namespace problem, which means the output needs hand editing. The result is in `BVMC5433.tei`




## CLIGS Spanish text from Christof

- replace PI
- add required @xml:id and @xml:lang on text
- use retag.xsl to 
  - change `<principal>` to `<respStmt>` 
  - remove redundant @part attribute values
  - remove @cert @subtype @resp likewise
  - comment out problematic bits of header and abstract pro tem
  - change `seg[@rend]` to `<hi>`

 
