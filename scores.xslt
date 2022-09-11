<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	    <xsl:output method="text"/>
	    <xsl:template match="results"><xsl:apply-templates select="data"/></xsl:template>
	    <xsl:template match="data"><xsl:apply-templates select="row"/></xsl:template>		
	    <xsl:template match="row"><xsl:value-of select="trial_index"/>,<xsl:value-of select="score"/><xsl:text>
</xsl:text></xsl:template>
</xsl:stylesheet>
