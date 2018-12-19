<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:m="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs m"
    version="2.0">
    
<xsl:template match="/">
    <xsl:message>Found <xsl:value-of select="count(m:modsCollection/m:mods)"/> top level records</xsl:message>
    <listRecords>
    <xsl:for-each select="m:modsCollection/m:mods">
       <xsl:sort select="m:originInfo[@eventType='publisher']/m:dateIssued[1]"/>
       <xsl:apply-templates select="."/>
    </xsl:for-each>
    </listRecords>
</xsl:template>    
    
<xsl:template match="m:mods">
  <xsl:value-of select="m:originInfo[@eventType='publisher']/m:dateIssued[1]"/>
  <xsl:text>| </xsl:text>
  <xsl:value-of select="normalize-space(m:originInfo[@eventType='publisher'])"/><xsl:text>        
</xsl:text>
    <!--
    <record> <xsl:attribute name="n"><xsl:value-of select="m:recordInfo/m:recordIdentifier"/></xsl:attribute>        
    
    <publisher>
        <xsl:value-of select="m:originInfo[@eventType='publisher']/m:publisher"/>
    </publisher>
    <date>
        <xsl:value-of select="m:originInfo[@eventType='publisher']/m:dateIssued"/>       
    </date>
    </record>-->
</xsl:template>    
    
</xsl:stylesheet>
