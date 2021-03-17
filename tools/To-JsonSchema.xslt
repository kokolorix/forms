<?xml version="1.0" encoding="iso-8859-1"?>
<!--<?altova_samplexml SINA18.xml?>
<?altova_samplexml ..\MESSPROT18.xml?>
-->
<?altova_samplexml ..\VSE_IA18.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output name="out-def" encoding="utf-8" method="text" indent="yes"/>
	<xsl:variable name="t1" select="'&#x9;'"/>
	<xsl:variable name="t2" select="concat($t1, '&#x9;')"/>
	<xsl:variable name="t3" select="concat($t2, '&#x9;')"/>
	<xsl:variable name="t4" select="concat($t3, '&#x9;')"/>
	<xsl:variable name="t5" select="concat($t4, '&#x9;')"/>
	<xsl:variable name="t6" select="concat($t5, '&#x9;')"/>
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
		".<xsl:value-of select="Form/@Name"/>": {
			"additionalProperties": false,
			"$ref": "#/definitions/T_<xsl:value-of select="Form/@Name"/>",
			"type": "object"
		},
		"T_<xsl:value-of select="Form/@Name"/>": {
			"additionalProperties": false,
			"properties": {
				".FORM_TYP": {
					"type": "string"
				},<xsl:apply-templates select="/Form/DataDic/Tab/Fld" mode="elm"/>
			<xsl:apply-templates select="/Form/DataDic/Tab/Tab" mode="elm1"/>
			}	
		}
	},
	"properties": {
		"<xsl:value-of select="Form/@Name"/>": {
			"$ref": "#/definitions/.<xsl:value-of select="Form/@Name"/>"
		}
	},
	"type": "object"
}	</xsl:result-document>
		<xsl:apply-templates select="/Form/DataDic/Tab/Tab" mode="doc"/>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt ein Feld-Element -->
	<!--=======================================================================-->
	<xsl:template match="Fld" mode="elm">
		<xsl:param name="indent" select="$t4"></xsl:param>
		<xsl:variable name="type">
			<xsl:choose>
				<xsl:when test="@Type='INT'">
					<xsl:text>integer</xsl:text>
				</xsl:when>
				<xsl:when test="@Type='BOOL'">
					<xsl:text>boolean</xsl:text>
				</xsl:when>
				<xsl:when test="@Type='DATE'">
					<xsl:text>string</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>string</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="position() &gt; 1">
			<xsl:text>,</xsl:text>
		</xsl:if>
		<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>".<xsl:value-of select="@Name"/>": {<xsl:if test="@Length">
			<xsl:value-of select="$nl1"/>
			<xsl:value-of select="concat($indent,$t1)"/>"minLength": 0,<xsl:value-of select="$nl1"/>
			<xsl:value-of select="concat($indent,$t1)"/>"maxLength": <xsl:value-of select="@Length"/>,</xsl:if>
		<xsl:value-of select="$nl1"/>
		<xsl:value-of select="concat($indent,$t1)"/>"type": "<xsl:value-of select="$type"/>"<xsl:value-of select="$nl1"/>
		<xsl:value-of select="concat($indent,'}')"/>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt ein Subtabellen-Element -->
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="elm1">
		<xsl:if test="position() = 1">
		</xsl:if>
		<xsl:text>,</xsl:text>
		<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$t4"/>".<xsl:value-of select="@Name"/>": {<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$t5"/>"type": "object",<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$t5"/>"properties": {
					}
				}</xsl:template>
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="elm2">
		<xsl:if test="position() != 1"><xsl:text>,</xsl:text></xsl:if>
		<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$t4"/>".<xsl:value-of select="@Name"/>": {<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$t5"/>"type": "object",<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$t5"/>"properties": {<xsl:text></xsl:text>
					<xsl:apply-templates select="./Fld" mode="elm">
						<xsl:with-param name="indent" select="$t5"/>
					</xsl:apply-templates>
					}
				}</xsl:template>
	<!--=======================================================================-->
	<!-- Tab-Template, erstellt die Subtabellen-Element Dokumentt -->
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="doc">
		<xsl:variable name="fn" select="replace(base-uri(.),'.xml' ,concat(@Name,'.json'))"/>
		<xsl:result-document href="{$fn}" format="out-def">
{
	"$schema": "http://json-schema.org/schema#",
	"additionalProperties": false,
	"definitions": {
		".<xsl:value-of select="@Name"/>": {
			"additionalProperties": false,
			"$ref": "#/definitions/T_<xsl:value-of select="@Name"/>",
			"type": "object"
		},
		"T_<xsl:value-of select="@Name"/>": {
			"additionalProperties": false,
			"properties": {	<xsl:apply-templates select="." mode="elm2"/>
			}	
		}
	},
	"properties": {
		"<xsl:value-of select="Form/@Name"/>": {
			"$ref": "#/definitions/.<xsl:value-of select="@Name"/>"
		}
	},
	"type": "object"
}		</xsl:result-document>	
	</xsl:template>
	<!-- Leer-Template, tut gar nichts -->
	<!--=======================================================================-->
	<xsl:template match="@*|node()"/>
</xsl:stylesheet>