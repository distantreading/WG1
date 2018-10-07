<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="h t"
    xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">

<xsl:param name="ELTeCid">CH0001</xsl:param>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

<xsl:template match="t:facsimile"/>
<xsl:template match="@facs"/>    
    
<xsl:template match="t:pb">
    <xsl:variable name="imgID">
        <xsl:value-of select="substring-after(@facs,'#')"/>
    </xsl:variable>
   <xsl:element name="pb">
<xsl:attribute name="facs">
        <xsl:value-of
            select="concat(substring-after(substring-before(//t:facsimile[@xml:id=$imgID]/t:surface/t:graphic
            /@url, '_Tat'),'0'),'.jpg')"/>
    </xsl:attribute></xsl:element>  
</xsl:template>

<xsl:template match="t:lb"/>
    
    
    <!-- copy everything  else -->
    <xsl:template match="* | @* | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
        <!-- could normalize() here -->
    </xsl:template>
</xsl:stylesheet>
