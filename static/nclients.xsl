<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:param name="name"/>

<xsl:template match="/">
<xsl:value-of select="count(//live/stream[name=$name]/client[not(publishing) and flashver])"/>
</xsl:template>

</xsl:stylesheet>
