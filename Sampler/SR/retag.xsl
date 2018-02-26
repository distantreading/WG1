<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="h t"
    xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:body">
        <body>
            <xsl:for-each select="t:p[@rend = 'Tekst']">
                <xsl:choose>
                    <xsl:when test="t:hi[@style = 'font-size:16pt']">
                        <divStart/>
                        <head>
                            <xsl:value-of select="t:hi[@style = 'font-size:16pt']"/>
                        </head>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>
                            <xsl:apply-templates/>
                        </p>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </body>
        <!--<xsl:for-each-group select="*" group-starting-with="t:p[t:hi[@style = 'font-size:16pt']]">
            <xsl:for-each select="current-group()">
                <div type="pismo">
                    <xsl:message>Found chapter</xsl:message>
                    <head>
                        <xsl:value-of select="."/>
                    </head>
                    <xsl:apply-templates/>
                </div>
            </xsl:for-each>
        </xsl:for-each-group>-->
    </xsl:template>
    <!--  <xsl:template match="t:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>-->
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
