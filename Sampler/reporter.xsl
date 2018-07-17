<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:e="http://distantreading.net/eltec/ns" exclude-result-prefixes="xs t e" version="2.0">
    <xsl:template match="/">
        <table>
            <xsl:for-each select="//t:text">
                <tr><xsl:variable name="wc">
                    <xsl:value-of select="string-length(normalize-space(.)) -
                        string-length(translate(normalize-space(.),' ,.:',''))"
                    /></xsl:variable>
                    <xsl:variable name="wcn">
                        <xsl:choose>
                            <xsl:when test="$wc  &lt; 50000">short</xsl:when>
                            <xsl:when test="$wc  &lt; 200000">medium</xsl:when>
                            <xsl:when test="$wc  &gt; 200000">long</xsl:when>
                        </xsl:choose>
                </xsl:variable>
                    <td><xsl:value-of select="@xml:lang"/></td>
                    <td> 
                        <xsl:value-of select="concat($wcn, concat(' (',$wc),')')"/>
                    </td>
                    <td>
                        <xsl:value-of select="../t:teiHeader/t:fileDesc/t:titleStmt/t:title[1]"/>
                    </td>
                    <td>
                        <xsl:value-of select="../t:teiHeader/t:fileDesc/t:titleStmt/t:author[1]/text()"/>
                    </td>
                    <td>
                        <xsl:value-of select="../t:teiHeader/t:profileDesc/t:textDesc/e:authorGender/@key"/>
                    </td>
                    <td>
                       <xsl:variable name="claimedWcn">
                           <xsl:value-of select="../t:teiHeader/t:profileDesc/t:textDesc/e:size/@key"/>                           
                       </xsl:variable>                        
                    <xsl:if test="not($wcn = $claimedWcn)">
                        <xsl:attribute name="class">dodgy</xsl:attribute>
                    </xsl:if>
                        <xsl:value-of select="$claimedWcn"/>
                    </td>
                    <td>
                        <xsl:value-of select="../t:teiHeader/t:profileDesc/t:textDesc/e:canonicity/@key"/>
                    </td>
                    <td>
                        <xsl:value-of select="../t:teiHeader/t:profileDesc/t:textDesc/e:timeSlot/@key"/>
                    </td>
                    
                    
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
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
