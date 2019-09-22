<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:a="http://www.abbyy.com/FineReader_xml/FineReader10-schema-v1.xml"   
     exclude-result-prefixes="xs a"
    version="2.0">
<xsl:output exclude-result-prefixes="#all" omit-xml-declaration="yes" />
    
    <xsl:template match="a:block[@blockType = 'Picture']">
        <gap desc="picture"/>
    </xsl:template>
    <xsl:template match="a:block[@blockType = 'Separator']"><xsl:text>-</xsl:text></xsl:template>
    <xsl:template match="a:block[@blockType = 'Text']">
        <xsl:apply-templates select="a:text"/>
    </xsl:template>
    
<xsl:template match="a:block/text()"/>

<xsl:template match="a:page">
<pb/>
    <xsl:apply-templates select="a:block[@blockType = 'Text']"/>
</xsl:template>
    
<xsl:template match="a:region"/>

<xsl:template match="a:par[string-length(.) gt 0]">
<p><xsl:apply-templates/></p></xsl:template>

<xsl:template match="a:line">
<!--<lb/>-->
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="a:formatting[@italic]">
    <hi><xsl:apply-templates/></hi>
</xsl:template>


</xsl:stylesheet>