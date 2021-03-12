<?xml version="1.0" encoding="iso-8859-1"?>
<!--<?altova_samplexml SINA18.xml?>
-->
<?altova_samplexml MESSPROT18.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output name="out-def" encoding="utf-8" method="text" indent="yes"/>
	<xsl:variable name="t1" select="'&#x9;'"/>
	<xsl:variable name="t2" select="concat($t1, '&#x9;')"/>
	<xsl:variable name="t3" select="concat($t2, '&#x9;')"/>
	<xsl:variable name="t4" select="concat($t3, '&#x9;')"/>
	<xsl:variable name="t5" select="concat($t4, '&#x9;')"/>
	<xsl:variable name="nl1" select="'&#xA;'"/>
	<xsl:variable name="nl2" select="concat($nl1, '&#xA;')"/>
	<!--=======================================================================-->
	<!-- Main-Template -->
	<!--=======================================================================-->
	<xsl:template match="/">
		<xsl:variable name="fn" select="replace(base-uri(.),'.xml' ,'.json')"/>
		<xsl:result-document href="{$fn}" format="out-def">
{
	"$schema": "http://json-schema.org/schema#",
	"additionalProperties": false,
	"definitions": {
		".FORMULAR": {
			"additionalProperties": false,
			"properties": {
				"ROW": {
					"$ref": "#/definitions/T_Row"
				}
			},
			"required": [
				"ROW"
			],
			"type": "object"
		},
		"T_Row": {
			"additionalProperties": false,
			"properties": {
				"FORM_TYP": {
					"type": "string"
				}<xsl:apply-templates select="/Form/DataDic/Tab/Fld" mode="Elm"/>
			<xsl:apply-templates select="/Form/DataDic/Tab/Tab" mode="Elm"/>
			<!--=======================================================================-->
			}	
		}
	},
	"properties": {
		"FORMULAR": {
			"$ref": "#/definitions/.FORMULAR"
		}
	},
	"type": "object"
}	</xsl:result-document>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt ein Feld-Element -->
	<!--=======================================================================-->
	<xsl:template match="Fld" mode="Elm">
		<xsl:variable name="type">
			<xsl:choose>
				<xsl:when test="@Type='INT'">
					<xsl:text>integer</xsl:text>
				</xsl:when>
				<xsl:when test="@Type='BOOL'">
					<xsl:text>boolean</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>string</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:text>,</xsl:text>
				"<xsl:value-of select="@Name"/>": {<xsl:if test="@Length">
					"maximum": 0,		
					"minimum": <xsl:value-of select="@Length"/>,</xsl:if>
					"type": "<xsl:value-of select="$type"/>"
				}</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt ein Subtabellen-Element -->
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="Elm"></xsl:template>
	<!--=======================================================================-->
	<!-- Leer-Template, tut gar nichts -->
	<!--=======================================================================-->
	<xsl:template match="@*|node()"/>
</xsl:stylesheet>