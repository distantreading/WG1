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
       <xsl:choose> <xsl:when test="h:h2">
           <div type="liminal">
               <xsl:apply-templates/>
           </div>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates/>
        </xsl:otherwise>
</xsl:choose>    </xsl:template>
    
    
    <xsl:template match="h:div[@class and not(h:hr)]">
        <xsl:choose>
            <xsl:when test="@class='wordsection6'">
                <div type="chapter"><xsl:apply-templates/></div>
            </xsl:when>
            <xsl:otherwise>
                <div type="liminal">
                    <xsl:apply-templates />        
                </div>
            </xsl:otherwise>
        </xsl:choose>
            
    </xsl:template>
    
    <xsl:template match="h:div[h:hr]"/>
   
   <xsl:template match="h:h2/h:br"/>
    
    <xsl:template match="h:br">
       <lb/>
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
    
    <xsl:template match="h:span">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="h:a">
        <ref><xsl:apply-templates/>
        </ref>
    </xsl:template>
    
    <xsl:template match="h:div[h:img]">
        <div type="liminal"><p><graphic url="{h:img/@src}"/></p></div>
    </xsl:template>
    
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