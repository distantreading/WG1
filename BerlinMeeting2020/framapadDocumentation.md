################ FINAL COPY from FRAMAPAD ###############

# Virtual WG1 WG4 Meeting -- ELTeC Dissemination strategiesGoal
# Evaluation of the corpus infrastructures and services for ELTeC

##Session A Welcome, introduction, goals, state of the play

LB: if the aim is to have multiple dissemination methods, then it's probably a good idea to ensure there is a single consistent form of what is being disseminated. It would be unfortunate if dissemination method A makes changes to texts which are not available to dissemination method B.
CO: in addition to this we could deal or focus on the persistent version on zenodo when disseminating/publishing ELteC somewhere else?

1. Information on https://distantreading.github.io/ELTeC/index.html
1. Add information on the teiHeader concerning possible digitised versions of the novels
1. example: https://distantreading.github.io/ELTeC/eng/ENG18400.html
1. who could take charge of this and create recommendations on how to put these information into the teiHeader [I am happy to draft a set of suggestions LB]

## Session B Textgrid

Christof Schöch presents Textgrid :-) https://textgrid.de/en/
discussion: which kind of search options exist already on Textgrid, what would be possible/necessary?

Questions for us

- do we want to have our own epubs?
    - Answer: we want to create own ones for reading purposes (nice epubs are provided by us)
    - LB: could add a TEI transformation from TEI XML to epub
- citation and referencing system NEEDS to be adjusted
    - Answer: it can be adjusted
    - are data manipulated to be included in textgrid?
    - Answer: we need to use python scripts to import the data
- There are problems with our date information that are not iso-format (LB: could add @when to date element and make this required in sourceDesc)
    - Answer: we need to use a java program  called kolibri to import data into texgrid
- what kind of workload is it /will it be to import eltec data? Can we do it on our own?
    - use scripts pre-production of import files with py scripts
    - session IDs are personal and expire (basically authentification)
    - collection ID can be shared between people contributing to textgrid
- Is there a way to handle versions in TextGrid?
    - Answer: Yes, earlier versions can be stored (and revisions can remain available), but I need to check with the TextGrid people to learn how exactly this works.
- how is it possible to refresh/correct the already ingested XMLs? 
    - Answer: Using the same Kolibri Java client, specific items or entire collections can be removed and replaced with updated versions.
- Is it possible to automatically align Github and TextGrid files?
    - Answer: I don't think so.
- Is it possible to annotate XMLs? To put NLP tagged XML in TextGrid? Answer: I'm sure tagged XML (our eltec-2 encoded texts!) can be uploaded alongside the "plain" XML-TEI, but we have not tested this yet.
    - Authenification via shibboleth

##Session C GAMS

Martina Scholger presents GAMS :-) https://gams.uni-graz.at/

- are data manipulated to be included in GAMS?
    - add to data persistent identifier und references to collections
- Manipulation of the interface
    - possible: Intergrate and display images: can we point to textdisplay and images?
- METS source needed, book viewer needed
    - There are standard templates to display collection and cannot be manipulated by GAMS people whcih we can define or manipulate for our own purposes with GAMS people, the content of the pages can be edited by us via client
- collaborative work possible?
    - Answer. Yes is possible.
- Authentificaiton: At the moment only password - in progress shibboleth
- citation?
    - new client/repository: when will be ready/testable?
    - Answer: in a few months

##Session D Break Out Session

Questions and Evaluation: some preliminary thoughts

- It is not necessarily the case that we need to decide between textgrid or GAMS, we could use both services
    - we need to take into account that we need at least do something
    - more work and time to invest for action members
    - coordination with GAMS and textGrid people
- Pros and cons of the services and fitting for ELTeC
    - in Textgrid, we cannot add thing easily on our selves
    - in GAMS we can  develop our own template when it comes to displaying things
    - in GAMS and textgrid, we cannot change search and filter mechnisms on our own
- Connections to other collections
    - in Textgrid we have an open system which searches within different collections, not only ELTeC
    - thats why customization are not so easy for Textgrid to adjust
    - everything is first one system and you can make it specific
    - in GAMS we can only search within ELTeC, for the users
    - everything is separated (in some way to the user) and it could be possible to connect collections

## Test links to play with the services

- GAMS:  http://glossa.uni-graz.at/context:eltec
- Textgrid: https://dev.textgridrep.org/?lang=en

## Requirements Analysis


###Obvious 

- Available as a public-facing repository website
    - TextGrid: yes
    - GAMS: yes
- Provides bulk import with metadata (OK both, with a client)
    - TextGrid: yes
    - GAMS: ye


###Essential 

- Search and filter/facet functions on relevant (including project-specific) metadata
    - Textgrid: all for the search, most of them for the facets
    - GAMS: can implement everything but needs to be done
    - author, title, publication year, time period, size, reprint count, author-gender,text-type keywords (homework for our COST Action)
- Software is open source, stable and actively maintained
    - TextGrid: yes
    - GAMS: yes
- There is sufficient (English-language) documentation
    - TextGrid: lots of detailed documentation (BUT check whether it is in English)
    - GAMS: pledge to improve documentation
- What level of support can we expect from the maintainers?
    - both are maintained in bigger projects/institutional environments that are trustworthy
    - TextGrid: have shown committment to supporting ELTeC and CS has provided a demonstration together with Textgrid
    - GAMS: have shown committment to supporting ELTeC and have provided a demonstration
- Open interface : ability to link to and from other tools
    - TextGrid: yes (API) (BUT: check whether it is open / how open)
    - GAMS: standard fedora interface
- Full-text search
    - TextGrid: yes
    - GAMS: yes


###Important 

- Basket and bulk download functions
    - TextGrid: yes
    - GAMS: not yet
- Long-term hosting, maintenance and storage solved
    - GAMS: yes (PID, CoreTrustSeal)
    - TextGrid: yes (PID, CoreTrustSeal)
- Provide summarized overall view of  ELTeC contents
    - TextGrid: possible but not implemented
    - GAMS: yes
- Ability to  customize interface on our own, including a branded landing page
    - TextgGrid: Landing page can be customized, Filter and search cannot be customized on our selves
    - GAMS: Landing page can be customized, Filter no, development can be together with GAMS people


## Session Reporting and Conclusion

Discussion about the core/extension concept

- The  "core" vs. "extension" terminology may be offensive or at least exclusionary to some
    - Maybe add metadata which indicate the extent to which the composition criteria are met
- The "core" could be then a balanced sub collection of the whole (unbalanced) collection
    - Maybe ensure that the README for each collection documents this
- Preface to the collection in the readme of each language collection
    - explains how the specific language collection was created (based on publication history etc.)
- Do we want to drop the composition criteria
    - for some collections, they are simply not achievable
    - but they are important for comparability of collections and also for users who don't want to have to define their own corpus
- The GAMS/TextGrid presentation of ELTeC could provide different balancing patterns, of which "core" is one
    - Write a proposal on how to change this and let the WG 1 decide
- Do we plan to publish only ELTeC core or also the extensions of ELTeC in the services GAMS, Zenodo and Textgrid?
    - if we treat  "extensions" and "core" as exclusive division then the "extension" part will be even more unbalanced

**Creation of Task Force I ELTeC composition criteria**

- Christof, Lou, Anda, Martina, ((Gábor maybe?))
- Define a deadline for writing the proposal on composition and phrasing of core and extension

**Creation of task force II Roadmaps for serivces**

We ask both teams (GAMS and Textgrid) for a road map on which we can decide if and how we would like use the services

- Ask for input of WG4, WG2 and WG1
    - Create Task Force II that cares about the roadmap
    - .Gabor, Christof, Lou, Martina, (Justin Sep 2020), Jana
- We ask the WG members, if they would like to contribute to this
- Deadlines (could be changed)
    - Textgrid Chsriof will talk to Textgrid by End of sep 2020
    - GAMS Martina will talk to Textgrid by end of sep 2020
    - DD/MM/YYYY Define changes in metadata in the teiHeader (for the Services)
    - DD/MM/YYYY Decision which services we would like to use
    - 30/11/2020 Release of ELTeC on Zenodo
    - 30/03/2020 Release of ELTeC Version on the services


**Homework for us in the COST Action**

- Organise a session on "Analyzing ELTeC" with services
    - e.g. TXM or others
    - Invite WG2
- Provide a TXM-corpus version of ELTeC for download
    - maybe for the next release in nov2020
    - ask Ranka and colleagues
- We need to define where we put citation references
    - best way would be to put in into the teiHeader and hand this information over to the services
    - where in the teiHeader?
 - Define formal release parameters for a zenodo release
    - write  it down and agree on it
    - what can be included when and how
    - CS has a document on this :) as a first suggestion
 - Discussion on how to deal and organise ELTeC after the Action's end
    - responsibilities and organisation
    - needs a further discussion on the entire Action
- Sample scenarios for interfacing with other systems, e.g. what does txm need?


