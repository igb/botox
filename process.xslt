<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	    <xsl:output method="text"/>
	    <xsl:template match="row">frame-<xsl:value-of select="trial_index"/>
	    <xsl:apply-templates select="*[starts-with(name(),'org')]"/></xsl:template>	
	    <xsl:template match="*[starts-with(name(),'org')]">java -cp dist/autotune-demo.jar <xsl:value-of select="name()"/>  &quot;<xsl:value-of select="."/>&quot;
	</xsl:template>
</xsl:stylesheet>
