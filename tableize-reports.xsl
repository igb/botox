<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:math="http://exslt.org/math"
		xmlns:func="http://exslt.org/functions"
		xmlns:html="http://www.w3.org/1999/xhtml"
		xmlns="http://www.w3.org/1999/xhtml"
		version="1.0">
  <xsl:output method="html"/>
  
  <xsl:variable name="modulus">3</xsl:variable>


  <xsl:template match="html">
    <html>
      <body>
	<table>
      <xsl:for-each select="html:td[position()]">
	<xsl:variable name="count"><xsl:value-of select="position()"/></xsl:variable>
	<xsl:if test="1 = ($count mod $modulus)">
	  <xsl:comment>TR</xsl:comment>
	</xsl:if>
	<td>
	  <xsl:comment><xsl:value-of select="position()"/></xsl:comment>
	  <xsl:apply-templates select="node() | @*"/>
	</td>
	<xsl:if test="not(($count mod $modulus))">
	  <xsl:comment>/TR</xsl:comment>
	</xsl:if>
	
      </xsl:for-each>
	</table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="td">    
    <td>
      <xsl:apply-templates select="node() | @*"/>
    </td>
  </xsl:template>

  
  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
