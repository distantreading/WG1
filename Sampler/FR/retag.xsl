<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">
    
    <xsl:template match="t:principal">
       <respStmt>
           <resp>principal</resp>
           <name><xsl:apply-templates/></name>
       </respStmt> 
    </xsl:template>
    
    <xsl:template match="t:publicationStmt">
        <publicationStmt><p><xsl:comment><xsl:apply-templates/></xsl:comment></p></publicationStmt>
    </xsl:template>
    
    <xsl:template match="t:abstract">
        <xsl:comment><xsl:apply-templates/></xsl:comment>
    </xsl:template>
 
 <xsl:template match="t:seg[@rend]">
     <hi><xsl:apply-templates/></hi>
 </xsl:template>
    
    <xsl:template match="t:milestone">
      <xsl:comment>milestone  <xsl:value-of select="@type"/></xsl:comment>
            <!--<milestone>
                <xsl:attribute name="rend">
                    <xsl:value-of select="@type"/>
                </xsl:attribute>
 </milestone>-->
        
    </xsl:template>
 <xsl:template match="*/@part"/>
    <xsl:template match="*/@cert"/>
    <xsl:template match="*/@subtype"/>
    <xsl:template match="*/@resp"/>
    
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