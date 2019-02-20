<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    
    <!-- transform an eltec-1 text to an eltec-0 one -->
    
    <xsl:template match="processing-instruction(xml-model)">
        <xsl:processing-instruction name="xml-model">
            <xsl:attribute name="href">https://distantreading.github.io/Schema/eltec-0.rnc</xsl:attribute>
            <xsl:attribute name="type">application/relax-ng-compact-syntax</xsl:attribute>
        </xsl:processing-instruction>
    </xsl:template>
    
    <!-- copy header unchanged -->
    
    <xsl:template match="t:teiHeader">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <!-- copy everything not otherwise specified -->
    
    <xsl:template match="* | @* | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
        <!-- could normalize() here -->
    </xsl:template>
    
    <!-- erode semantic distinctions -->
        
    <xsl:template match="t:emph|t:foreign|t:title">
        <hi>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    
    <!-- remove both tags and content-->
    
    <xsl:template match="t:gap|t:milestone|t:note|t:ref"/>
    <xsl:template match="t:front/t:div[@type='titlepage']"/>
    
    <!-- remove tags but retain content -->
    
    <xsl:template match="t:quote|t:corr">
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>