<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="h t"
    xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
   
   <xsl:template match="t:persName">
       <name><xsl:value-of select="t:forename"/><xsl:text> </xsl:text>
       <xsl:value-of select="t:surname"/></name>
   </xsl:template>
    
    <xsl:template match="t:editor">
        <respStmt>
            <resp>editor</resp>
            <xsl:apply-templates/>
        </respStmt>
    </xsl:template>
    
    <xsl:template match="t:orgName">
        <name type="org">
            <xsl:apply-templates/>
        </name>
    </xsl:template>
   
   <xsl:template match="t:fw|t:figure|t:editionStmt|t:biblFull|t:msDesc|t:encodingDesc|t:front|t:back">
      <xsl:comment>
         Suppressed <xsl:value-of select="name(.)"/>: <xsl:value-of select="."/>
      </xsl:comment>
   </xsl:template>
 
    <xsl:template match="t:milestone|t:lb|t:p/@part"/>
    
    <xsl:template match="t:pb/@facs"/> <!-- mistake -->
    
   <xsl:template match="t:resp/t:note|t:hi">
       <xsl:apply-templates/>
   </xsl:template> 
    
    <xsl:template match="t:fileDesc/t:publicationStmt">
        <xsl:copy><p>Demonstration file prepared for the ELTeC Sampler</p>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="t:space">
        &#160;
    </xsl:template>
   <!-- copy everything else -->
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
