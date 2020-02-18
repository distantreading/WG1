WG1 schedule

Tuesday 18/02/2020

    9:00-10:30 Session 1A: WG1 ELTeC

    10:30-11:00 Coffee break

    11:00-12:30 Session 2A: WG1 and WG2: Annotation Schema Level 2

    12:30-14:00 Lunch break

    14:00-15:00 Session 3A: WG1 and WG4: Dissemination. Organisation and workload

    15:00-15:30 Coffee break

    15:30-16:30 Session 4A: WG 1 and WG3: Literary Research with ELTeC

    16:30-18:00 Joint final session: Publishing ELTeC Corpora using TextGrid and/or DraCor, Susan Schreibman on dariahTeach


Session 1A WG1 and ELTeC

Please ask us (Lou, Borja and Carolin), if you do not have access to our gitHub repositories and mailing list!
Discussion on ELTeC criteria made emerge challenges for national collections; however, as benchmark corpus ELTeC had to adopt a pragmatic approach (50% max for female authors was questioned as the whole corpus will be by default unbalanced towards male authors but apparently this cannot be changed at this stage). It should also be noted that a less binary approach to gender might need to be adopted in future iterations of the project (see e.g. note at https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ref-teidata.sex.html).

ELTEC-SPA: 

    achieve 80% for Nov2020

    problem: find non canonical novels


ELTEC-ITA:

    hard to check the metadata in the teiHeader

    need volunteers to help out with the encoding of the metadata (could this be advertised on social media? it might be a useful student intern project)

    achieve 100% for Nov2020


ELTeC-Not

    try to use what is already accessible

    achieve 50% Nov2020


ELTeC-ukr

    just started in the COST Action

    achieve 25 text Nov2020


ELTeC-cro

    just started

    lets see how it will work


ELTeC-lav

    you are not in https://distantreading.github.io/ELTeC/index.html

    start to prepare texts

    achieve 65 texts


ELTeC-ser

    42 text are in the collection in level1

    achieve 60-70 text b Nov2020

    use additionally the extension


ELTeC-slv

    officially released 96 novels

    recently also committed the last 4 (with some changes in the others), so we are now at 100

    this is most likely also the final release for level1 (except for some possible tweaking)


ELTeC-lit

    27 text at the moment, gender balanced is ok, 

    achieve 50 text in Nov2020


ELTeC-hun

    more than 100 hundred novels - check the balancing criteria and use ELTeC-hun-ext

    validation of the data

    achieve 100 texts in level 0 in Nov2020


ELTeC-rom

    31 novels at the moment, validation of the data

    achieve 80 in Nov 2020


ELTeC-pof

    tba.


Notes and hints
- according to the selection criteria: we will select just one novel per author (except for 9.11 authors with exact three novels)
- we got a Naming Convention distribute again in WG1 see https://github.com/distantreading/WG1/wiki/Filenames-and-identifiers
- we got a little sheets from Lou pointing to the most important things for metadata and encoding levels

    https://distantreading.github.io/Training/Budapest/encodingGuide-1.html

    https://distantreading.github.io/Training/Budapest/encodingGuide-2.html


open issue: 
    what about missing collections: 

    we miss Dutch, Modern Greek, Polish (contact Jan Rybicki? he is around), Swedish


Session 2A WG1 and WG2: Annotation schema

Proposal of WG2 for encoding level 2: 
    
    Question: use different tag sets for pos+msd?
    Answer: We need to decide whether we need to have more than one pos-tag represented in TEIencoding level 2 

        we will make a survey in WG1 and WG2, if we need this, we need TEI experts in developing a feasible solution in TEI XML

Question: how do we manage space between words and punctuation?
Answer: space are represented with @join on <w> and <pc>

Question: What about ID for <w>
Answer:  corpus wide unique id for <w> and for <s>, both will be seperately counted (guidelines will be published prior to corpus release to advice on how to generate id unique across the corpus), the ID will consist of file-ID and a number 

    Question: for punctuation as well as <w> and @
    Answer: <pc> could get @pos
        
    Question: normalisation necessary? using a <choice> element -maybe 
Answer: <w> covers just the word form in the texts

    example: if we got French "du" in nove we do not split this word form into "de" and "le". we use <w> for "du" and indicate in lemma="de+le" (or similiar)


HOMEWORK
WG leads will summarzie a proposal and send to WG1 and WG2 + Survey for two weeks in WG1 and WG2: pro/against different postags


Session 3A WG1 and WG4: Dissemination

Task: what other plattform, we can use for accessing/selecting/downloading ELTeC
Criteria for plattforms (CS):

    provide overview collection

    search and browse with project-specific factes

    define subcorpora

    bulk-download

    friendly user interface

    PID for novels


Christof Schöch shortly presents 

    Textgrid https://textgridrep.org/

    extensive tests done by CS and colleagues, overhead in creating metadata

    no ELTeC-specific adaptions possible 

    meant for collaborative work, many members can work on uploading texts

    account via shibbloleth or DARIAH account

    TODO for CS: Ask textgrid about what they can do for adapting Textgrid for ELTeC 

    answer by March (for planning our meeting in June in Berlin)

    Dracor https://dracor.org/

    needs adjustments which cannot be made easily (so out for GP4)


Martina Scholger shortly presents

    GAMS gams.uni-graz.at

    GAMS-Team would like to support us, MS will clarify, how we  

    propose to upload metadata in VLO


Gabor

    proposes to send metadata to europeana

    workflow: Gabor will write a xslt for us, edmXML  (support)

    shows digiohil http://digiphil.hu/o:kd-as.manu.tei.1/sdef:TEI/get?context=ch1


Decisions made in our meeting:

        textgrid and GAMS as candidate for ELTeC

    both will be tested in June WG1+WG4 Meeting (Berlin)

    need for test accounts

    HOMEWORK for everybody: look at these two plattforms, make yourself familiar with it and collect questions/comment/remarks

    provide metadata to europeana

    will be done by Gabor and colleagues :-)

    HOMEWORK  for everybody: look at these two plattforms, make yourself familiar with it and collect 


Session 4 A WG1 and WG3: Literary Research with ELTeC

Suggestion: STSM perspective of in ELTEC?
WG3 suggestion: change the name of critera "canonicty" - into popularity? or something else? re-printindex? 
CS: Ideas/Requiremtens on platforms of WG3

    Susan's idea: approach the voyant people

    create sub collections via filtering

    list of formats: TEI levels, html, epub

    publishing epub seperately

Suggestion: create a list of criteria that needs to be fulfilled (could use MOSCOW prioritisation technique to prioritise requirements: https://www.agilebusiness.org/page/ProjectFramework_10_MoSCoWPrioritisation)
Suggestion: creating a tutorial for accessing  Voyant

Reference to europeana: https://www.europeana.eu/


