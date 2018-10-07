<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="h t"
    xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">

<xsl:param name="ELTeCid">DE0001</xsl:param>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- simplify header tagging -->
    <xsl:template match="t:author">
        <author>
            <xsl:if test="t:persName">
                <xsl:value-of select="t:persName/t:surname"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="t:persName/t:forename"/>
                <xsl:text>(?-?)</xsl:text>
            </xsl:if>
        </author>
    </xsl:template>

    <xsl:template match="t:persName">
        <name>
            <xsl:value-of select="t:forename"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="t:surname"/>
        </name>

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

    <xsl:template match="t:fileDesc/t:publicationStmt">
        <xsl:copy>
            <p>Demonstration file prepared for the ELTeC Sampler</p>
        </xsl:copy>
    </xsl:template>


    <!-- comment out unwanted content -->
    <xsl:template
        match="t:figure | t:editionStmt | t:biblFull | t:msDesc |
                    t:encodingDesc | t:front | t:back | t:lg">
        <xsl:comment>Suppressed <xsl:value-of select="name(.)"/>: <xsl:value-of select="."/>
      </xsl:comment>
    </xsl:template>

    <!-- completely suppress some unwanted elements  -->
    <xsl:template match="t:lb | t:fw"/>

    <!-- suppress some unwanted attributes --> 
    <xsl:template match="t:pb/@facs | t:p/@part | t:title/@type | t:title/@n | 
        t:bibl/@type | t:bibl/@status"/>

    <!-- suppress unwanted tags but retain content -->
    <xsl:template match="t:resp/t:note | t:hi">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- deal with choice -->
    <xsl:template match="t:choice[t:reg | t:corr]">
        <xsl:value-of select="t:reg"/>
        <xsl:value-of select="t:corr"/>
    </xsl:template>
    <xsl:template match="t:space"> &#160; </xsl:template>
    
 <!-- measure type not supported -->
    <xsl:template match="t:measure">
              <xsl:choose>
                <xsl:when test="@type = 'tokens'">
                    <measure unit="words">
                        <xsl:value-of select="."/>
                    </measure></xsl:when>
                <xsl:otherwise>
                    <xsl:comment>
                        <xsl:text>Suppressed measure unit-type </xsl:text>
                        <xsl:value-of select="@type"/>: <xsl:value-of select="."/></xsl:comment>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>

<!-- milestone attributes tweak -->

<xsl:template match="t:milestone">
    <milestone>
    <xsl:attribute name="type">
        <xsl:value-of select="@unit"/>
    </xsl:attribute>
    <xsl:attribute name="rend">
        <xsl:value-of select="@rendition"/>
    </xsl:attribute>
    </milestone>
</xsl:template>
    
    <!-- textclass tweak -->
    
    <xsl:template match="t:textClass">
       <textClass> <xsl:element name="catRef">
            <xsl:attribute name="target">
                <xsl:value-of 
                    select="t:classCode[@scheme='http://www.deutschestextarchiv.de/doku/klassifikation#DTACorpus']"/>
               
            </xsl:attribute>
        </xsl:element>
    </textClass>
    </xsl:template>
        <xsl:template match="t:text">
        <text>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="$ELTeCid"/>
            </xsl:attribute>
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="lower-case(substring($ELTeCid,1,2))"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </text>
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
