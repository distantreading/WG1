# Data preparation

## Current state of the title data

The title data reflect the working version of ELTeC dated from 10/06.2020. We extracted
the titles and other information from ELTeC summary page which is created an updated by Lou (https://distantreading.github.io/ELTeC/index.html). 
For the Polish language collection, we extracted the necessary data from the XML files uploaded 
in the GitHub repository. 

Changes in the language collection that are included after 10/06/2020 are not considered for 
our title study. The following annotation guidelines were applied to the title data in this folder.

## Annotation Guidelines
Annotation guidelines for title study: 

| Column                   | AvailableTags                                                                    | Description                                                                                                          | Example               |
|--------------------------|----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|-----------------------|
| place                    | yes, no                                                                         | geographical identifable entitites such as cities, countries, houses, if a place is a person's attribute add it here |  The mysteries of **London** |
| placeEntity              | no, "noun"                                                                         | if yes in placeEntity copy place, but they need to be named entities, excluding e.g. "people from the forest"      |    London                   |
| placeAttribution         | yes, no                                                                         | adjectives, genitive attributes and prepositional attributes                                                         |                       |
| placeDeterminer          | def, indef, no, na                                                                 | specify determiner if available, include articles, pronouns and affixes, na= not available in this language       |                       |
| person                   | yes, no                                                                         | person, not modeled as named entity                                                                                                               |  The Story of **Bessie Costrell**  |
| personStatus             | no , "noun"                                                                      | if yes in person copy noun                                                                                         | major, lady, captain   |
| personEntity             | no, "noun"                                                                      | if yes in person copy person                                                                                         |      Bessie Costrell  |
| personAttribution        | yes, no                                                                         | adjectives, genitive attributes and prepositional attributes                                                         |  The **Clever** Woman **of the Family**   |
| personDeterminer         | def, indef, no, na                                                                | specify determiner if available                                                                                      |                       |
| gender                   | m, f, d, no                                                                  | specify the person's gender, d means diverse and indicates several genders or unknown gender                         |                       |
| other                    | one, more, no                                                                  | other entities than persons or places in the title                                                                   |                       |
| otherEntity              | no, "noun"                                                                      | if yes copy the entity                                                                                               |   The Clever Woman **of the Family**                    |
| otherEntitityDeterminer  | def, indef, no, na                                                                 | specify determiner if available                                                                                      |                       |
| otherEntitityAttribution | yes, no                                                                         | adjectives, genitive attributes and prepositional attributes                                                         |                       |
| twoContentElement        | yes, no                                                                       | title of two elements, title and subtitle                                                                            | Modern Flirtations: or, A Month at Harrowgate                      |
| contentElementConnection | interpunc, word, mixed, no                                                  | if yes in twoContentElement, indicate how the elements are separated                                                 |                       |
| genreIndicator           | yes, no                                                                         | reference of a genre indicator in the title                                                                          |                       |
| indicatorEntity          | no, "noun"                                                                      | if yes in genreIndicator copy indicator                                                                              | romance, novel, story |
genreIndicator Role | existence, possessor, possessum, patient, location, agens, attribute, no | specify the basic semantic role: existince=no specification, possessum=thing that an entity possesses, possessor=entity that possesses, location=specifies a location, patient= entity that undergoes an operation, agens=entity that acts, attribute=modifies an entity|
genreIndicator syntax | head, apposition, pregen, postgen, prepmod, adjective, no | specify the basic syntactic category, abbreviations: prepmod=prepositional modifier, pregen=prenominal genitive, postgen=postnominal genitive |
| placeRole                | existence, possessor, possessum, patient, location, agens, attribute, no | specify the basic semantic role: existince=no specification, possessum=thing that an entity possesses, possessor=entity that possesses, location=specifies a location, patient= entity that undergoes an operation, agens=entity that acts, attribute=modifies an entity |                                                                                      |                       |
| placeSyntax              | head, apposition, pregen, postgen, prepmod, adjective, no                  | specify the basic syntactic category, abbreviations: prepmod=prepositional modifier, pregen=prenominal genitive, postgen=postnominal genitive                                                                                |                       |
| personRole               | existence, possessor, possessum, patient, location, agens, attribute, no | specify the basic semantic role: existince=no specification, possessum=thing that an entity possesses, possessor=entity that possesses, location=specifies a location, patient= entity that undergoes an operation, agens=entity that acts, attribute=modifies an entity                                                                                      |                       |
| personSyntax             | head, apposition,  pregen, postgen, prepmod, adjective, no                  | specify the basic syntactic category, abbreviations: prepmod=prepositional modifier, pregen=prenominal genitive, postgen=postnominal genitive                                                                                 |                       |
| personIIRole             | existence, possessor, possessum, patient, location, agens, attribute, no | specify the basic semantic role: existince=no specification, possessum=thing that n entity possesses, possessor=entity that possesses, location=specifies a location, patient= entity that undergoes an operation, agens=entity that acts, attribute=modifies an entity                                                                                      |                       |
| personIISyntax           | head, apposition,  pregen, postgen, prepmod, adjective, no                  | specify the basic syntactic category, abbreviations: prepmod=prepositional modifier, pregen=prenominal genitive, postgen=postnominal genitive                                                                                 |                       |
| otherEntityRole          | existence, possessor, possessum, patient, location, agens, attribute, no | specify the basic semantic role: existince=no specification, possessum=thing that is an entity possesses, possessor=entity that possesses, location=specifies a location, patient= entity that undergoes an operation, agens=entity that acts, attribute=modifiers an entity                                                                                      |                       |
| otherEntitySyntax        | head, apposition, pregen, postgen, prepmod, adjective, no                  | specify the basic syntactic category, abbreviations: prepmod=prepositional modifier, pregen=prenominal genitive, postgen=postnominal genitive                                                                                |                       |
| otherEntityIIRole        | existence, possessor, possessum, patience, location, agens, attribute, no | specify the basic semantic role: existince=no specification, possessum=thing that an entity possesses, possessor=entity that possesses, location=specifies a location, patient= entity that undergoes an operation, agens=entity that acts, attribute=modifies an entity                                                                                      |                       |
| otherEntityIISyntax      | head, apposition, pregen, postgen, prepmod, adjective, no                  | specify the basic syntactic category, abbreviations: prepmod=prepositional modifier, pregen=prenominal genitive, postgen=postnominal genitive                                                                                 |                       |
| titleFocus                         |  copy focus word                                                                                | indicate the main element of the title, the main entity on which the title draws the attention of the reader                                                                                                                      | Ex. The Inheritance of **Evil**                     | 


Things to consider
- copy content from https://distantreading.github.io/ELTeC/index.html (chose language collection)
- check title of the first edition
- categories such as genre indicator applicable to literary concepts
- if something is not clear, we need to coordinate! Annotations need to be first of all consistent!
- column 35 "titleFocus": this is a subjective decision, and we expect them to be divergent when the same titles annotated by two different persons

Specifications after the discussions on 26-29th of May 2020:
- please use only ASCII characters for latin alphabet languages;
- small case for all words, including proper names, when copied in the columns;
- for cyrillic titles, they can stay as they are, but a colum with a transliteration and a rough translation would be highly appreciated; it does not has to be a certified translation, just something to help the non-slavic speaker grasp the main idea. It will be usefull when writing the paper.
- if there are several persons, places or other entities in a title, please duplicate the appropriate columns accordingly (ex. person2, person2Status, person2Attribution, person2Determiner, person2Role, person2Syntax). 
- if the same person has two statuses, mark them in the same column, separated with a coma. Same for the attribution, if there are two of them.
- we do not need to lemmatize when "splitting" the title in the columns - it can stay inflected.


