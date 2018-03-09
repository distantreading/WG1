<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all"
    xmlns:h="http://www.w3.org/1999/xhtml"      
    version="2.0">

    <xsl:template match="*:TEI.2">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/><xsl:value-of select="@year"/>
        </TEI>
    </xsl:template>

    <xsl:template match="*:teiHeader">
        <teiHeader>
            <xsl:apply-templates/>
        </teiHeader>
    </xsl:template>
  
    <xsl:template match="*:div0">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="*:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

<xsl:template match="change">
   <change> <xsl:attribute name="when">
        <xsl:value-of select="eDate/@year"/>
        <xsl:value-of select="eDate/@month"/>
        <xsl:value-of select="eDate/@day"/>       
    </xsl:attribute>
    <xsl:value-of select="item"/>
       <xsl:text> : </xsl:text>
    <xsl:value-of select="respStmt/name"/>
    <xsl:text> (</xsl:text>
    <xsl:value-of select="respStmt/resp"/>
   <xsl:text>)</xsl:text></change>
</xsl:template>
  
<xsl:template match="language">
    <language>
        <xsl:attribute name="ident">
            <xsl:value-of select="@id"/>
        </xsl:attribute>
        <xsl:apply-templates/>
    </language>
</xsl:template>
    <xsl:template match="hi[@italic]">
        <hi rend="italic">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>

<xsl:template match="eDate">
    <date>
        <xsl:attribute name="when">
            <xsl:value-of select="@year"/>
            <xsl:value-of select="@month"/>
            <xsl:value-of select="@day"/>       
        </xsl:attribute> 
    </date>
</xsl:template>
    <xsl:template match="*/@lang">
        <xsl:attribute name="xml:lang">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="*/@align">
        <xsl:attribute name="rend">
            <xsl:value-of select="concat('align-', .)"/>
        </xsl:attribute>
    </xsl:template>

<xsl:template match="*/@num"/>
    <xsl:template match="*/@indent"/>
    
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
