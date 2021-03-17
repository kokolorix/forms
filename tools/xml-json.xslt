<?xml version="1.0" encoding="iso-8859-1"?>
<!--<?altova_samplexml SINA18.xml?>
-->
<?altova_samplexml MPP-Hub.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="text" encoding="utf-8" indent="yes"/>
	<xsl:output name="txt-def" method="text" encoding="utf-8" indent="yes"/>
	<xsl:variable name="tab1" select="'&#x9;'"/>
	<xsl:variable name="tab2" select="concat($tab1, '&#x9;')"/>
	<xsl:variable name="tab3" select="concat($tab2, '&#x9;')"/>
	<xsl:variable name="tab4" select="concat($tab3, '&#x9;')"/>
	<xsl:variable name="tab5" select="concat($tab4, '&#x9;')"/>
	<xsl:variable name="newLine1" select="'&#xA;'"/>
	<xsl:variable name="newLine2" select="concat($newLine1, '&#xA;')"/>
	<!--=======================================================================-->
	<!-- Main-Template -->
	<!--=======================================================================-->
	<xsl:template match="/">
		<xsl:variable name="fn" select="replace(base-uri(.),'.xml' ,'.json')"/>
		<xsl:result-document href="{$fn}" format="txt-def">
			<xsl:value-of select="concat('{', $newLine1)"/>
			<xsl:apply-templates select="DATAPACKET/ROW/*"></xsl:apply-templates>
			<xsl:text>}</xsl:text>
		</xsl:result-document>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Copy-Template, kopiert nur Elemente -->
	<!--=======================================================================-->
	<xsl:template match="node()">
		<xsl:value-of select="concat('&quot;',  name(), '&quot; : &quot;', text(), '&quot;')"/>
		<xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
		<xsl:value-of select="$newLine1"/>
		<!--<xsl:apply-templates select="node()"/>-->
	</xsl:template>
	<!--=======================================================================-->
	<!-- Leer-Template, tut gar nichts, damit Attribut-Werte nicht ausgegeben werden -->
	<!--=======================================================================-->
	<xsl:template match="text()|@*" mode="#all"/>
</xsl:stylesheet>
