<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:math="http://exslt.org/math"
		xmlns:func="http://exslt.org/functions"
		xmlns="http://www.w3.org/1999/xhtml"
		version="1.0">
  <xsl:output method="html"/>
  
  <xsl:variable name="modulus">3</xsl:variable>
  <xsl:variable name="count">0</xsl:variable>
  <xsl:template match="html">
	   <xsl:apply-templates select="body"/>
  </xsl:template>
	   
  <xsl:template match="body">
    
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
