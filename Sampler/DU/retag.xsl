<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs h t"
    xmlns:h="http://www.w3.org/1999/xhtml" 
    xmlns:t="http://www.tei-c.org/ns/1.0"  
    version="2.0">
 <xsl:output exclude-result-prefixes="#all" omit-xml-declaration="yes" ></xsl:output>
 <xsl:template match="/">
     <xsl:apply-templates select="//h:body"></xsl:apply-templates>
 </xsl:template>
    
    
    <xsl:template match="h:body">
      <xsl:choose>
          <xsl:when test="h:div[@class='section']">
              <xsl:comment>
                  <xsl:apply-templates/>
              </xsl:comment>
              
          </xsl:when>
        
          <xsl:otherwise> <div type="chapter"><xsl:apply-templates/></div></xsl:otherwise>
      </xsl:choose>
   </xsl:template>
    
    
    
    <xsl:template match="h:div[@class]">
        <xsl:choose>
            <xsl:when test="@class='kop'">
                <head><xsl:apply-templates/></head>
            </xsl:when>
            <xsl:when test="@class='plat'">
                <p><xsl:apply-templates/></p>
            </xsl:when>
            <xsl:when test="@class='empty-line'"/>
            <xsl:when test="@class='wpvw-motto'">
                <quote> 
                    <xsl:for-each-group select="node()"  group-ending-with="h:br">
                    <xsl:for-each select="current-group()">
                        <xsl:choose> <xsl:when test="self::h:br"/>
                            <xsl:when test="self::lb"/>
                            <xsl:when test="self::h:span">
                                <xsl:apply-templates select="."/>
                            </xsl:when>
                            <xsl:otherwise>
                                <p><xsl:copy><xsl:apply-templates select="."/></xsl:copy></p></xsl:otherwise></xsl:choose>
                    </xsl:for-each>
                </xsl:for-each-group>
                </quote>
            </xsl:when>
            <xsl:otherwise>
                <div type="unknown">
                    <xsl:apply-templates />        
                </div>
            </xsl:otherwise>
        </xsl:choose>
            
    </xsl:template>
    
    <xsl:template match="h:span[@class='cursief']">
        <hi rend="it"><xsl:apply-templates/></hi>
    </xsl:template>
    <!-- italic -->
    
    <xsl:template match="h:span[@class='kleinkap']">
        <hi rend="sc"><xsl:apply-templates/></hi>
    </xsl:template>
   <!-- smallcaps -->
    
    <xsl:template match="h:span[@class='spat']">
        <hi rend="sp"><xsl:apply-templates/></hi>
    </xsl:template>
    <!-- spaced out -->
   
    <xsl:template match="h:br">
        <lb/>
    </xsl:template>
    
   <!--<xsl:template match="h:h2/h:br"/>
    
    <xsl:template match="h:p[@class='e-bookvenovani']">
        <lg>
            <l><xsl:apply-templates/></l>
        </lg>
    </xsl:template>
    
    <xsl:template match="h:p[@class='e-bookversebezpredsazeni6bza']">
        <lg>
            <l><xsl:apply-templates/></l>
        </lg>
    </xsl:template>
   
    
    <xsl:template match="h:div[h:p[@class='msofootnotetext']]">
        <note xml:id="{@id}">
            <xsl:value-of select="h:p"/>
        </note>
    </xsl:template>
  
    <xsl:template match="h:h2">
        <head><xsl:apply-templates/></head>
    </xsl:template>
    
    <xsl:template match="h:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
  <xsl:template match="h:i">
      <hi><xsl:apply-templates/></hi>
  </xsl:template>
    
    <xsl:template match="h:span|h:b">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="h:a">
        <ref><xsl:apply-templates/>
        </ref>
    </xsl:template>
    
    <xsl:template match="h:div[h:img]">
        <div type="liminal"><p><graphic url="{h:img/@src}"/></p></div>
    </xsl:template>
    -->
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