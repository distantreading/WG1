<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h t"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    
    xmlns="http://www.tei-c.org/ns/1.0" 
    version="2.0">
    
    <xsl:template match="t:titleStmt">
        <titleStmt>
            <title>
                <xsl:value-of select="concat(t:title[@type='main'],' : ELTeC edition')"/>
            </title>
            <author>
                <xsl:value-of select="concat(t:author/t:name[@type='full'],' (?-?)')"/>
            </author>
        </titleStmt>
    </xsl:template>
    <xsl:template match="t:principal">
       <respStmt>
           <resp>principal</resp>
           <name><xsl:apply-templates/></name>
       </respStmt> 
    </xsl:template>
    <xsl:template match="t:measure[@unit ne 'words']"/>
    
    <xsl:template match="t:publicationStmt">
        <publicationStmt><p>Incorporated into the ELTeC <date>????-??-??</date>
            <xsl:comment><xsl:apply-templates/></xsl:comment></p></publicationStmt>
    </xsl:template>
    <xsl:template match="t:textClass">
        <textClass>
            <catRef target="#unknown"/>
            <xsl:comment><xsl:apply-templates/></xsl:comment>
            </textClass>
    </xsl:template>
    
    <xsl:template match="t:lg"><xsl:apply-templates/></xsl:template>
 
 <xsl:template match="*/@part"/>
 
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