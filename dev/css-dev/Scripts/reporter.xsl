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
                    <xsl:value-of select="count(//t:text)"/>
                </xsl:variable>
                <xsl:variable name="wordCount">
                    <xsl:value-of select="xs:integer(sum(//t:measure[@unit='words']))"/>
                </xsl:variable>
                <xsl:message><xsl:value-of select="$textCount"/><xsl:text> texts found containing </xsl:text>
                    <xsl:value-of select="$wordCount"/> 
                    <xsl:text> words</xsl:text></xsl:message>



                <table class="catalogue">
                    <tr class="label">
                        <td>Identifier</td>
                        <td>Encoding</td>
                        <td>Page count</td>
                        <td>Word count (Size)</td>
                        <td>Date (Slot)</td>
                        <td>Title</td>
                        <td>Author</td>
                        <td>Sex</td>
                         <td>Reprints</td>
                    </tr>
                    <xsl:for-each select="t:teiCorpus/t:TEI/t:text">
                        <tr>
                            <xsl:variable name="wc">
                                <xsl:value-of select="../t:teiHeader/t:fileDesc/t:extent/t:measure[@unit='words']"/>
                            </xsl:variable>
                            <xsl:variable name="pc">
                                <xsl:value-of select="../t:teiHeader/t:fileDesc/t:extent/t:measure[@unit='pages']"/>
                            </xsl:variable>
                            
                            <xsl:variable name="date">
                                <xsl:choose>
                                    <xsl:when test="../t:teiHeader//t:relatedItem[@type='copyText']">
                                        <xsl:value-of select="../t:teiHeader//t:sourceDesc/t:bibl/t:relatedItem[@type='copyText']/t:bibl/t:date"/>
                                    </xsl:when><xsl:when test="../t:teiHeader//t:sourceDesc/t:bibl[@type='copyText']"> 
                                        <xsl:value-of select="../t:teiHeader//t:sourceDesc/t:bibl[@type='copyText']/t:date"/> </xsl:when>
                                    <xsl:when test="../t:teiHeader//t:sourceDesc/t:bibl[@type='edition-first']"> 
                                        <xsl:value-of select="../t:teiHeader//t:sourceDesc/t:bibl[@type='edition-first']/t:date"/> </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>???? </xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                              
                          </xsl:variable>
                     
                            <td>
                                <xsl:value-of select="ancestor::t:TEI/@xml:id"/>
                            </td>
                            <td>
                                <xsl:value-of select="../t:teiHeader/t:encodingDesc/@n"/>
                            </td>
                            <td>
                                <xsl:value-of select="$pc"/> 
                            </td><td>
                                <xsl:value-of select="$wc"/> (<xsl:value-of
                                    select="../t:teiHeader/t:profileDesc/t:textDesc/e:size/@key"
                                />)
                            </td>
                            <td>
                                <xsl:value-of select="$date"/> ( <xsl:value-of
                                    select="../t:teiHeader/t:profileDesc/t:textDesc/e:timeSlot/@key"
                                />)
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
                           <!-- <td>
                                <xsl:value-of
                                    select="../t:teiHeader/t:profileDesc/t:textDesc/e:size/@key"
                                />
                            </td>-->
                            <td>
                                <xsl:value-of
                                    select="../t:teiHeader/t:profileDesc/t:textDesc/e:canonicity/@key"
                                />
                            </td>
                            <!--<td>
                                <xsl:value-of
                                    select="../t:teiHeader/t:profileDesc/t:textDesc/e:timeSlot/@key"
                                />
                            </td>-->


                        </tr>
                    </xsl:for-each>
                </table>
                <table class="balance">
                    <thead>Balance counts </thead>
                    <tr>
                        <xsl:variable name="authorG" select="//e:authorGender"/>
                        <td>Author Gender</td>
                        <xsl:variable name="genderVals">M,F,U</xsl:variable>
                        <xsl:for-each select="tokenize($genderVals, ',')">
                            <xsl:variable name="val">
                                <xsl:value-of select="."/>
                            </xsl:variable>
                            <td>
                                <xsl:value-of select="$val"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of
                                    select="
                                        e:checkBalance($textCount/3,
                                        count($authorG[@key = $val]))"
                                />
                            </td>
                        </xsl:for-each>
                    </tr><tr><xsl:variable name="sizes" select="//e:size"/>
                        <td>Size</td>
                        <xsl:variable name="sizeVals">short,medium,long</xsl:variable>
                        <xsl:for-each select="tokenize($sizeVals, ',')">
                            <xsl:variable name="val">
                                <xsl:value-of select="."/>
                            </xsl:variable>
                            <td>
                                <xsl:value-of select="$val"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of
                                    select="
                                    e:checkBalance($textCount/3,
                                    count($sizes[@key = $val]))"
                                />
                            </td>
                        </xsl:for-each> </tr>
                    <tr><xsl:variable name="canons" select="//e:canonicity"/>
                        <td>Canonicity</td>
                        <xsl:variable name="canonVals">low,medium,high</xsl:variable>
                        <xsl:for-each select="tokenize($canonVals, ',')">
                            <xsl:variable name="val">
                                <xsl:value-of select="."/>
                            </xsl:variable>
                            <td>
                                <xsl:value-of select="$val"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of
                                    select="
                                    e:checkBalance($textCount/3,
                                    count($canons[@key = $val]))"
                                />
                            </td>
                        </xsl:for-each> </tr></table>
                <table class="balance">
                    <tr><xsl:variable name="slots" select="//e:timeSlot"/>
                        <td>Time Slot</td>
                        <xsl:variable name="slotVals">T1,T2,T3,T4</xsl:variable>
                        <xsl:for-each select="tokenize($slotVals, ',')">
                            <xsl:variable name="val">
                                <xsl:value-of select="."/>
                            </xsl:variable>
                            <td>
                                <xsl:value-of select="$val"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of
                                    select="
                                    e:checkBalance($textCount/4,
                                    count($slots[@key = $val]))"
                                />
                            </td>
                        </xsl:for-each> </tr>

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
                <xsl:value-of select="$target - $count"/>
                <xsl:text> more **</xsl:text>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="concat($count, $whoops)"/>

    </xsl:function>

    <xsl:function name="e:word-count" as="xs:integer" xmlns:functx="http://www.functx.com">
        <xsl:param name="arg" as="xs:string?"/>

        <xsl:sequence
            select="
                count(tokenize($arg, '\W+')[. != ''])
                "/>

    </xsl:function>
</xsl:stylesheet>
