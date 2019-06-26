<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:e="http://distant-reading.net/ns"
    exclude-result-prefixes="xs e" version="2.0">
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:param name="docId"/>
    <xsl:template match="/">

        <xsl:apply-templates select="rex"/>
    </xsl:template>

    <xsl:template match="rex">
        <xsl:if test="count(record) lt 1">
            <xsl:message>No records for <xsl:value-of select="substring-before($docId, '.')"
                /></xsl:message>
        </xsl:if>
        <xsl:if test="count(record) gt 0">
            <bibl>
                <xsl:attribute name="count">
                    <xsl:value-of select="format-number(count(record[F260 | F264 | F210]), '0000')"
                    />
                </xsl:attribute>
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="substring-before($docId, '.')"/>
                </xsl:attribute>
                <title>
                    <xsl:value-of select="record[1]/F200[1]/fa[1]"/>
                </title>
                <xsl:for-each select="record[F210]">
                    <xsl:sort select="e:theYr(F210[1]/fd[1])"/>
                    <imprint>
                        <xsl:attribute name="n">
                            <xsl:value-of select="e:theYr(F210[1]/fd[1])"/>
                        </xsl:attribute>
                        <xsl:for-each select="F210[1]/*">
                            <xsl:value-of select="."/>
                            <xsl:text> </xsl:text>
                        </xsl:for-each>
                    </imprint>
                </xsl:for-each>
            </bibl>
            <xsl:text>
</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:function name="e:theYr">
        <xsl:param name="str"/>
        <xsl:variable name="yrPat">^.*(1[89]|20)\d\d</xsl:variable>
        <xsl:if test="$str">

            <xsl:if test="e:number-of-matches($str, '(1[89]|20)\d\d') gt 1">
                <xsl:message><xsl:value-of select="$str"/> is ambiguous: choosing first</xsl:message>
            </xsl:if>

            <xsl:analyze-string select="$str" regex="^.*?((1[89]|20)\d\d)">
                <xsl:matching-substring>
                    <xsl:value-of select="regex-group(1)[1]"/>
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:if>

        <xsl:if test="not($str)">
            <xsl:message>Empty imprint field</xsl:message>
        </xsl:if>

    </xsl:function>
    <xsl:function name="e:number-of-matches" as="xs:integer">
        <xsl:param name="arg" as="xs:string?"/>
        <xsl:param name="pattern" as="xs:string"/>

        <xsl:sequence select="
                count(tokenize($arg, $pattern)) - 1
                "/>

    </xsl:function>
</xsl:stylesheet>
