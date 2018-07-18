<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:e="http://distantreading.net/eltec/ns" exclude-result-prefixes="xs t e" version="2.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html"/>
                <title>ELTeC test report</title>
            </head>
            <body>
                <xsl:variable name="textCount">
                    <xsl:value-of select="count(//text)"/>
                </xsl:variable>


                <table class="catalogue">
                    <tr class="label">
                        <td>Language</td>
                        <td>Actual wordcount</td>
                        <td>Title</td>
                        <td>Author</td>
                        <td>AuthorGender code</td>
                        <td>Size code</td>
                        <td>Canonicity code</td>
                        <td>Time slot code</td>
                    </tr>
                    <xsl:for-each select="//t:text">
                        <tr>
                            <xsl:variable name="wc">
                                <xsl:value-of
                                    select="
                                        string-length(normalize-space(.)) -
                                        string-length(translate(normalize-space(.), ' ,.:', ''))"
                                />
                            </xsl:variable>
                            <xsl:variable name="wcn">
                                <xsl:choose>
                                    <xsl:when test="$wc &lt; 50000">short</xsl:when>
                                    <xsl:when test="$wc &lt; 200000">medium</xsl:when>
                                    <xsl:when test="$wc &gt; 200000">long</xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <td>
                                <xsl:value-of select="@xml:lang"/>
                            </td>
                            <td>
                                <xsl:value-of select="concat($wcn, concat(' (', $wc), ')')"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="../t:teiHeader/t:fileDesc/t:titleStmt/t:title[1]"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="../t:teiHeader/t:fileDesc/t:titleStmt/t:author[1]/text()"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="../t:teiHeader/t:profileDesc/t:textDesc/e:authorGender/@key"
                                />
                            </td>
                            <td>
                                <xsl:variable name="claimedWcn">
                                    <xsl:value-of
                                        select="../t:teiHeader/t:profileDesc/t:textDesc/e:size/@key"
                                    />
                                </xsl:variable>
                                <xsl:if test="not($wcn = $claimedWcn)">
                                    <xsl:attribute name="class">dodgy</xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="$claimedWcn"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="../t:teiHeader/t:profileDesc/t:textDesc/e:canonicity/@key"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="../t:teiHeader/t:profileDesc/t:textDesc/e:timeSlot/@key"
                                />
                            </td>


                        </tr>
                    </xsl:for-each>
                </table>
                <table class="balance">
                    <thead>Balance counts </thead>
                    <tr>
                        <td>authorGender</td>
                        <td>
                            <xsl:text>M : </xsl:text>
                            <xsl:value-of select="e:checkBalance($textCount/3,
                                count(//e:authorGender[@key = 'M']))"/>
                        </td>
                        <td>
                            <xsl:text>F : </xsl:text>
                            <xsl:value-of select="e:checkBalance($textCount/3,count(//e:authorGender[@key = 'F']))"/>
                        </td>
                        <td>
                            <xsl:text>U : </xsl:text>
                            <xsl:value-of select="count(//e:authorGender[@key = 'U'])"/>
                        </td>
                    </tr>
                    <tr>
                        <td>size</td>
                        <td>
                            <xsl:text>short : </xsl:text>
                            <xsl:value-of select="count(//e:size[@key = 'short'])"/>
                        </td>
                        <td>
                            <xsl:text>medium : </xsl:text>
                            <xsl:value-of select="count(//e:size[@key = 'medium'])"/>
                        </td>
                        <td>
                            <xsl:text>long : </xsl:text>
                            <xsl:value-of select="count(//e:size[@key = 'long'])"/>
                        </td>
                    </tr>
                    <tr>
                        <td>canonicity</td>
                        <td>
                            <xsl:text>low : </xsl:text>
                            <xsl:value-of select="count(//e:canonicity[@key = 'low'])"/>
                        </td>
                        <td>
                            <xsl:text>high : </xsl:text>
                            <xsl:value-of select="count(//e:canonicity[@key = 'high'])"/>
                        </td>
                        <td>
                            <xsl:text>unknown : </xsl:text>
                            <xsl:value-of select="count(//e:canonicity[@key = 'unknown'])"/>
                        </td>
                    </tr>
                    <tr>
                        <td>timeslot</td>
                        <td>
                            <xsl:text>T1 : </xsl:text>
                            <xsl:value-of select="count(//e:timeSlot[@key = 'T1'])"/>
                        </td>
                        <td>
                            <xsl:text>T2 : </xsl:text>
                            <xsl:value-of select="count(//e:timeSlot[@key = 'T2'])"/>
                        </td>
                        <td>
                            <xsl:text>T3 : </xsl:text>
                            <xsl:value-of select="count(//e:timeSlot[@key = 'T3'])"/>
                        </td>
                        <td>
                            <xsl:text>T4 : </xsl:text>
                            <xsl:value-of select="count(//e:timeSlot[@key = 'T4'])"/>
                        </td>
                    </tr>




                </table>
            </body>
        </html>


    </xsl:template>
    
    <xsl:function name="e:checkBalance" as="xs:string">
        <xsl:param name="target" as="xs:integer"/>
        <xsl:param name="count" as="xs:integer"/>
        <xsl:variable name="whoops">
            <xsl:if test="$count lt $target">
              <xsl:text> ** Unbalanced : need at least </xsl:text>
              <xsl:value-of select="$target - $count"/> <xsl:text> more **</xsl:text>
                  </xsl:if>
        </xsl:variable>
        <xsl:value-of select="concat($count, $whoops)" />
        
    </xsl:function>
    
    <!-- <xsl:template match="t:teiHeader">
        
            <td>
                <xsl:value-of select="t:fileDesc/t:titleStmt/t:title[1]"/>
            </td>
            <td>
                <xsl:value-of select="t:fileDesc/t:titleStmt/t:author[1]/text()"/>
            </td>
            <td>
                <xsl:value-of select="t:profileDesc/t:textDesc/e:authorGender/@key"/>
            </td>
            <td>
               
                <xsl:value-of select="t:profileDesc/t:textDesc/e:size/@key"/>
            </td>
            <td>
                <xsl:value-of select="t:profileDesc/t:textDesc/e:canonicity/@key"/>
            </td>
            <td>
                <xsl:value-of select="t:profileDesc/t:textDesc/e:timeSlot/@key"/>
            </td>

        
    </xsl:template>-->
</xsl:stylesheet>
