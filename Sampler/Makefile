ECHO=
LOCAL=/home/lou/Public/WG1
SCHEMA=$(LOCAL)/distantreading.github.io/Schema/eltec-1.rng
CORPUS=$(LOCAL)/Sampler/Test
CORPUSHDR=corpHeaderStart.txt
REPORTER=$(LOCAL)/Sampler/reporter.xsl
CURRENT=`pwd`

validate:
	cd $(CORPUS); for f in *.eltec ; do \
		echo $$f; \
		jing  $(SCHEMA) \
		$$f ; done; cd $(CURRENT);

driver:
	echo rebuild driver file
	cp $(CORPUSHDR) $(CORPUS)_driver.tei;\
		for f in $(CORPUS)/*.eltec ; do \
		echo "<xi:include href='$$f'/>" >> $(CORPUS)_driver.tei; \
	done; echo "</teiCorpus>" >> $(CORPUS)_driver.tei

schema: 
	echo rebuild schemas from ODD
	cd /home/lou/Public/WG1/
	teitoodd --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec.xml eltec-compiled.xml
	teitorelaxng  --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec-0.xml distantreading.github.io/Schema/eltec-0.rng
	teitorelaxng  --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec-1.xml distantreading.github.io/Schema/eltec-1.rng
	teitohtml --odd --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec-0.xml distantreading.github.io/eltec-0.html
	teitohtml --odd --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec-1.xml distantreading.github.io/eltec-1.html
	cd $(CURRENT)
report:
	echo report on corpus balance
	saxon $(CORPUS)_driver.tei $(REPORTER) 
