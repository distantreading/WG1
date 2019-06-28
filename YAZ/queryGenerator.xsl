<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs t"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output  method="text" omit-xml-declaration="yes"></xsl:output>
    <xsl:template match="/">
        <xsl:apply-templates select="t:teiCorpus/t:TEI/t:teiHeader/t:fileDesc/t:titleStmt"/>
    </xsl:template>
    
    <xsl:template match="t:titleStmt">
        
<xsl:text>find @and @attr 1=1003 "</xsl:text>
        <xsl:value-of select="t:sanitize(substring-before(t:author,','))"/>
        <xsl:text>" @attr 1=4 "</xsl:text>        
        <xsl:value-of select="replace(replace(replace(substring-before(t:sanitize(t:title),'eltec'),'the ',' '),' or ',' '),' and ',' ')"/>
        <xsl:text>"   
set_marcdump </xsl:text> <xsl:value-of select="ancestor::t:TEI/@xml:id"/>
        <xsl:text>.usmarc
show all

</xsl:text>

    
    </xsl:template>
    
    <xsl:function name="t:sanitize" as="xs:string" >
        <xsl:param name="text"/>
        <xsl:variable name="alltext">
            <xsl:value-of select="$text" separator=" "/>
        </xsl:variable>
        <xsl:variable name="result"
            select="
            lower-case(normalize-space(replace($alltext,'[.,:]','')))"/>
        <xsl:value-of
            select="
            if (string-length($result) &gt; 127) then
            substring($result, 1, 127)
            else
            $result"
        />
    </xsl:function>
</xsl:stylesheet>