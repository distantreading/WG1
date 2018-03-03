<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs h"
    xmlns:h="http://www.w3.org/1999/xhtml" xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:template match="/">
        <xsl:apply-templates select="//h:div[@style = 'text-align:justify; position:static;']"/>
        <!-- select="//h:div[@id = 'mw-content-text']/-->
    </xsl:template>
    <xsl:template match="h:table"><!-- SUPPRESS FOR THE MO --></xsl:template>
   
    <xsl:template match="h:span[h:span[@class = 'PageNumber ws-pagenum']]">
        <pb>
            <xsl:attribute name="n">
                <xsl:value-of select="h:span/h:b/h:a"/>
            </xsl:attribute>
            <xsl:attribute name="facs">
                <xsl:value-of select="h:span/@title"/>
            </xsl:attribute>
        </pb>
    </xsl:template>
    <xsl:template match="h:span[@class = 'PageNumber ws-pagenum']">
        <pb>
            <xsl:attribute name="n">
                <xsl:value-of select="h:b/h:a"/>
            </xsl:attribute>
            <xsl:attribute name="facs">
                <xsl:value-of select="@title"/>
            </xsl:attribute>
        </pb>
    </xsl:template>
    <xsl:template match='h:span[@style = "padding-left:18px;"]'>
        <pstart/>
    </xsl:template>
    <xsl:template match="h:span[@class = 'n0kh']">
        <choice>
            <sic>
                <xsl:value-of select="."/>
            </sic>
            <corr>
                <xsl:value-of select="following-sibling::h:span[@class = 'n0k'][1]"/>
            </corr>
        </choice>
    </xsl:template>
    <xsl:template match="h:span[@class = 'n0k']"/>
    
    <xsl:template match="h:span">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="h:sup[@class='reference']">
    <ref xml:id="{@id}" target="{h:a/@href}">
    <xsl:value-of select="h:a"/></ref>
    </xsl:template>
    <xsl:template match="h:sup/h:a"/>
    
    
    <xsl:template match="h:li">
        <note xml:id="{@id}">
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    
    <xsl:template match="h:span[@class='mw-cite-backlink']">
        <ptr target="{h:a/@href}"/>
    </xsl:template>    
        
    <xsl:template match="h:span[@class='reference-text']">
       <xsl:apply-templates/>
    </xsl:template>    

    
    <xsl:template match="h:br">
        <!-- could be end of p or of l or just blank line -->
        <pEnd/>
    </xsl:template>
    <xsl:template match="h:i">
        <hi>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    
     <xsl:template match="h:hr"/>
    
   <xsl:template match="h:dl|h:dd">
       <xsl:apply-templates/>
   </xsl:template>
       
   <xsl:template match="h:dd[h:span]">
       <quote>
           <xsl:apply-templates/>
       </quote>
   </xsl:template>
   
   
    <xsl:template match="h:div[h:div[@class = 'poem']]">
        <quote>
            <xsl:apply-templates />
        </quote>
    </xsl:template>
   
    <xsl:template match="h:div[@class = 'poem']">
    <lg>
        <xsl:for-each-group select="*" 
            group-starting-with="h:br">
            <xsl:for-each select="current-group()">
                <l><xsl:apply-templates/></l>
                <!--<xsl:choose>
                    <xsl:when test="self::h:span">
                        <l><xsl:value-of select="."/></l>
                    </xsl:when>
                    <xsl:otherwise>
                        <l><xsl:apply-templates/></l>
                    </xsl:otherwise>
                </xsl:choose> -->
            </xsl:for-each></xsl:for-each-group>
    </lg>
    </xsl:template>
    
    <xsl:template match="h:span[@class = 'mw-poem-indented']">
        <indent/>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="h:div[@style = 'text-align:justify; position:static;']">
        <xsl:message>Found body</xsl:message>
        <body xml:id="PL0001" xml:lang="pl">
            <xsl:apply-templates/>
        </body>
    </xsl:template>
    
    <xsl:template match="h:div[@class = 'center']">
        <xsl:choose>
            <xsl:when test="contains(@style,'font-size:200')">
<xsl:text>
</xsl:text><partStart/>
               <head>
                    <xsl:value-of select="h:b"/>
                </head>
            </xsl:when>
            <xsl:when test="contains(@style,'margin-bottom:20px')">
                <chapStart/>
                <head>
                    <xsl:value-of select="."/>
                </head>
            </xsl:when>  
            <xsl:when test="h:hr"/>
            <xsl:otherwise>
                <milestone/>
                <xsl:message>Dunno what this is</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    <!--     
        <xsl:apply-templates/>-->
    </xsl:template>
    
  <xsl:template match="h:div[not(@class) and not(@style)]">
      <xsl:apply-templates/>
  </xsl:template>
   <!-- 
    <xsl:template match="h:div[@class = 'center'][text()]">
        <xsl:message>Found chapter</xsl:message>
        <chapStart/>
        <head>
            <xsl:value-of select="."/>
        </head>
    </xsl:template>
    -->
    <xsl:template match="h:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!--<xsl:for-each-group select="*" group-starting-with="h:div[@class = 'center']/h:b">
               <div type="part">
                    <xsl:message>Found part</xsl:message>
                    <head>
                        <xsl:value-of select="."/>
                    </head>
                          <xsl:apply-templates select="current-group()/*"/>-->
    <!--  <xsl:for-each-group select="current-group()/*"
                             group-starting-with="h:div[@class = 'center'][not(h:b)]">
                             <xsl:message>Found chapter</xsl:message>
                             <div type="chapter">
                                 <head>
                                     <xsl:value-of select="."/>
                                 </head>
                                 <xsl:for-each-group select="current-group()"
                                     group-ending-with="h:br">
                                     <p>
                                    
                                         <xsl:message>Found para</xsl:message>
                                        
                                      <xsl:for-each select="current-group()">
                                          <xsl:text>|</xsl:text>
                                          <xsl:value-of select="name(.)"/>
                                          <xsl:text>|</xsl:text>
                                          <xsl:value-of select="."/>                                         
                                      </xsl:for-each>   
                                      
                                     </p>
                                 </xsl:for-each-group>
                             </div>
                         </xsl:for-each-group>-->
    <!--</div>
                  </xsl:for-each-group>-->
    <!-- <xsl:template match="h:div[@class='center']/h:b">
       <div type='part'><head><xsl:apply-templates/></head>
       </div></xsl:template>-->
    <!--<xsl:template match="h:div[@class='center']">
        <div type='chapter'><head><xsl:apply-templates/></head>
        </div></xsl:template>-->
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
