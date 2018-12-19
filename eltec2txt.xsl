<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:e="http://distantreading.net/ns" exclude-result-prefixes="xs" version="2.0">

    <xsl:output omit-xml-declaration="yes" encoding="UTF-8" method="text"/>
<xsl:strip-space elements="*"/>
    <xsl:variable name="punx">,_"'“”’!;:. 
</xsl:variable>
    <xsl:variable name="nl"><xsl:text>
</xsl:text></xsl:variable>

    <xsl:template match="/">
        <xsl:apply-templates select="//t:p"/>
    </xsl:template>

    <xsl:template match="t:head">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}
</xsl:text> 
    </xsl:template>
    
    <xsl:template match="t:p">
        <xsl:value-of select="concat(normalize-space(translate(., $nl, ' ')), $nl)"/>
    </xsl:template>
<!--
    <xsl:template match="t:p">
        <xsl:variable name="string">
            <xsl:value-of select="translate(normalize-space(replace(translate(., $punx, '               '), '—',' — ')),'?.', concat($nl,$nl))"/>
        </xsl:variable>
        <!-\-<xsl:text>|</xsl:text><xsl:value-of select="$string"/>
        <xsl:text>|
</xsl:text>-\->
      <xsl:for-each select="tokenize($string, ' ')">
            <xsl:value-of select="."/>
     <!-\-       <xsl:text> </xsl:text>
          <xsl:if test="(position() mod 10 eq 0)">
   -\->             <xsl:text>
</xsl:text>
            <!-\-</xsl:if>-\->
        </xsl:for-each>
  <!-\-      <xsl:value-of select="$string"/>
       <xsl:value-of select="replace($string, concat($nl,' '), $nl )"/>
    </xsl:template>
-\-></xsl:template>
-->

</xsl:stylesheet>
