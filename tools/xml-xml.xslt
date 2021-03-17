<?xml version="1.0" encoding="iso-8859-1"?>
<!--<?altova_samplexml SINA18.xml?>
-->
<?altova_samplexml MPP-Hub.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<xsl:output name="xml-def" method="xml" indent="yes"/>
	<!--=======================================================================-->
	<!-- Main-Template -->
	<!--=======================================================================-->
	<xsl:template match="/">
		<xsl:variable name="fn" select="replace(base-uri(.),'.xml' ,'1.xml')"/>
		<xsl:result-document href="{$fn}" format="xml-def">
			<xsl:apply-templates select="node()"></xsl:apply-templates>
		</xsl:result-document>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Copy-Template, kopiert nur Elemente -->
	<!--=======================================================================-->
    <xsl:template match="node()">
        <xsl:copy>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template></xsl:stylesheet>
