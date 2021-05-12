<?xml version="1.0" encoding="iso-8859-1"?>
<!--<?altova_samplexml SINA18.xml?>
<?altova_samplexml ..\MESSPROT_PV20_DE.xml?>
<?altova_samplexml ..\SINA18_DE.xml?>
-->
<?altova_samplexml ..\VSE_IA18_DE.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output name="out-def" encoding="utf-8" method="text"/>
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
		<xsl:variable name="fn" select="replace(base-uri(.),'.xml' ,'.ts')"/>
		<xsl:result-document href="{$fn}" format="out-def">
			<xsl:text/>	
import { ColDef, ISchema } from 'src/app/components';
import { formguid_<xsl:value-of select="/Form/@name"/>, SchemaGuids } from './schema-guid-def';
import { inputGroup, label, labelhtml, schemaClassLayout, w_full, cb_single, multiple_checkboxes_with_cust } from './schema-utils';
		<xsl:apply-templates select="/Form/Snippet" mode="ctrl"/>
			<xsl:value-of select="$nl2"/>
			<xsl:text>SchemaGuids.registerSchema(formguid_</xsl:text>
			<xsl:value-of select="/Form/@name"/>, '<xsl:value-of select="/Form/@caption"/>', '<xsl:value-of select="/Form/@iconText"/>'<xsl:text/>
			<xsl:text>, [</xsl:text>
			<xsl:for-each select="/Form/Snippet">
				<xsl:if test="position() &gt; 1">
					<xsl:text>,</xsl:text>
				</xsl:if>
				<xsl:value-of select="$nl1"/>
				<xsl:value-of select="$t1"/>
				<xsl:value-of select="/Form/@name"/>
				<xsl:value-of select="position()"/>_<xsl:value-of select="@name"/>
			</xsl:for-each>
			<xsl:value-of select="$nl1"/>
			<xsl:text>])</xsl:text>
		</xsl:result-document>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt ein Schnipsel-Element -->
	<!--=======================================================================-->
	<xsl:template match="Snippet" mode="ctrl">
		<xsl:param name="indent" select="$t2"/>
export const <xsl:value-of select="/Form/@name"/>
		<xsl:value-of select="position()"/>_<xsl:value-of select="@name"/>: ISchema = {
	type: 'panel',
	name: '<xsl:value-of select="@name"/>',
	label: '<xsl:value-of select="@caption"/>',
	classLayout: schemaClassLayout,
	children: [<xsl:value-of select="$nl1"/>
		<xsl:apply-templates select="./*" mode="ctrl1">
			<xsl:with-param name="indent" select="$t2"/>
		</xsl:apply-templates>
	]
}
	</xsl:template>
	<!--=======================================================================-->
	<!-- Tab-Template, erstellt eine Tabelle -->
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="ctrl1">
		<xsl:param name="indent" select="$t2"/>
		<xsl:value-of select="$indent"/>{<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t1"/>type: 'datatable',<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t1"/>field: '<xsl:value-of select="@table"/>',<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t1"/>classLayout: 'col-start-1 col-span-2',<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t1"/>dragdrop: true,<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t1"/>colDefs: [<xsl:value-of select="$nl1"/>
		<!-- ColDefs -->
		<xsl:for-each select="./Col[position()&lt;6]">
			<xsl:value-of select="$indent"/>
			<xsl:value-of select="$t2"/>{ <xsl:text/>
			<xsl:text/>title: '<xsl:value-of select="@caption"/>', <xsl:text/>
			<xsl:text/>field: '<xsl:value-of select="@field"/>', <xsl:text/>
			<xsl:text/>class: 'col-start-<xsl:value-of select="position() + (position() - 1) * 2"/> col-span-3'<xsl:text/>
			<xsl:text/> },<xsl:value-of select="$nl1"/>
		</xsl:for-each>
		<!-- ColDefs -->
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t1"/>],<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t1"/>detailComponent: {<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t2"/>type: 'panel',<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t2"/>classLayout: schemaClassLayout,<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t2"/>children: [<xsl:value-of select="$nl1"/>
		<!-- children -->
		<xsl:apply-templates select="./*" mode="ctrl1">
			<xsl:with-param name="indent" select="$t5"/>
		</xsl:apply-templates>
		<!-- children -->
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t2"/>],<xsl:value-of select="$nl1"/>
		<xsl:value-of select="$indent"/>
		<xsl:value-of select="$t1"/>},<xsl:value-of select="$nl1"/>
		
		<xsl:value-of select="$indent"/>},<xsl:value-of select="$nl1"/>
	</xsl:template>
	<!---->
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt ein Feld-Element -->
	<!--=======================================================================-->
	<xsl:template match="Fld" mode="ctrl1">
		<xsl:param name="indent" select="$t2"/>
		<xsl:value-of select="$indent"/>
		<xsl:choose>
			<xsl:when test="@type='checkbox'">
				<xsl:text>cb_single</xsl:text>('<xsl:value-of select="@caption"/>','<xsl:value-of select="@field"/>', false),<xsl:value-of select="$nl1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>label</xsl:text>('<xsl:value-of select="@caption"/>'),<xsl:value-of select="$nl1"/>
				<xsl:value-of select="$indent"/>{<xsl:value-of select="$nl1"/>
				<xsl:variable name="indent1" select="concat($indent, $t1)"/>
				<!--<xsl:value-of select="$indent1"/>label: '<xsl:value-of select="@field"/>',<xsl:value-of select="$nl1"/>-->
				<xsl:value-of select="$indent1"/>hint: '<xsl:value-of select="@field"/>',<xsl:value-of select="$nl1"/>
				<xsl:value-of select="$indent1"/>type: '<xsl:value-of select="@type"/>',<xsl:value-of select="$nl1"/>
				<xsl:value-of select="$indent1"/>field: '<xsl:value-of select="@field"/>',<xsl:value-of select="$nl1"/>
				<xsl:if test="@max != ''">
					<xsl:value-of select="$indent1"/>max: <xsl:value-of select="@max"/>,<xsl:value-of select="$nl1"/>
				</xsl:if>
				<xsl:if test="@multiline = 'true'">
					<xsl:value-of select="$indent1"/>multiline: true,<xsl:value-of select="$nl1"/>
					<xsl:value-of select="$indent1"/>width: w_full,<xsl:value-of select="$nl1"/>
				</xsl:if>
				<xsl:if test="@rows != ''">
					<xsl:value-of select="$indent1"/>rows: <xsl:value-of select="@rows"/>,<xsl:value-of select="$nl1"/>
				</xsl:if>
				<xsl:value-of select="$indent1"/>dataType : '<xsl:value-of select="@dataType"/>',<xsl:value-of select="$nl1"/>
				<xsl:variable name="ddxml" select="replace(/Form/@name , '(.+)_(DE|FR|IT)$', '..\\DataDic\\$1.xml')" ></xsl:variable>				
				<xsl:variable name="udo" select="replace(/Form/@name , '(.+)_(DE|FR|IT)$', 'Udo_$2')" ></xsl:variable>				
				<xsl:variable name="fname" select="@field" ></xsl:variable>	
				<xsl:if test="doc-available($ddxml) and document($ddxml)//Fld[./@Name=$fname]/*[name(.)=$udo]/Uda">
					<xsl:value-of select="$indent1"/>options : [<xsl:value-of select="$nl1"/>
					<xsl:apply-templates select="document($ddxml)//Fld[./@Name=$fname]/*[name(.)=$udo]/Uda" mode="ddxml">
						<xsl:with-param name="indent" select="concat($indent1,$t1)" />
					</xsl:apply-templates>
					<xsl:value-of select="$indent1"/>],<xsl:value-of select="$nl1"/>
				</xsl:if>			
 				<xsl:value-of select="$indent"/>},<xsl:value-of select="$nl1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Uda" mode="ddxml">
		<xsl:param name="indent"/>
		<xsl:value-of select="$indent"/>'<xsl:value-of select="."/>',<xsl:value-of select="$nl1"/>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Adresse-Template, erstellt ein Adressen Element -->
	<!--=======================================================================-->
	<xsl:template match="Adresse" mode="ctrl1">
		<xsl:param name="indent" select="$t2"/>
		label('<xsl:value-of select="@caption"/>', true, 'font-bold'),
		<xsl:apply-templates select="./*" mode="ctrl1">
			<xsl:with-param name="indent" select="$indent"/>
		</xsl:apply-templates>
		label('Name'),
		inputGroup(
			[
				{
					type: 'input',
					label: 'Name1',
					field: '<xsl:value-of select="position()"/>_NAME1',
					hint: '<xsl:value-of select="position()"/>_NAME1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Name2',
					field: '<xsl:value-of select="position()"/>_NAME2',
					hint: '<xsl:value-of select="position()"/>_NAME2',
					max: 40,
				}
			]
		),
		label('Adresse'),
		inputGroup(
			[
				{
					type: 'input',
					label: 'Adresse1',
					field: '<xsl:value-of select="position()"/>_ADR1',
					hint: '<xsl:value-of select="position()"/>_ADR1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Adresse2',
					field: '<xsl:value-of select="position()"/>_ADR2',
					hint: '<xsl:value-of select="position()"/>_ADR2',
					max: 40,
				}
			]
		),
		label('PLZ / Ort'),
		inputGroup(
			[
				{
					type: 'input',
					label: 'PLZ',
					dataType : 'int',
					field: '<xsl:value-of select="position()"/>_PLZ',
					hint: '<xsl:value-of select="position()"/>_PLZ',
					max: 4,
				},
				{
					type: 'input',
					label: 'Ort',
					max: 30,
					field: '<xsl:value-of select="position()"/>_ORT',
					hint: '<xsl:value-of select="position()"/>_ORT',
				}
			]
		),
		<!--<xsl:if test="position() != last()">
			<xsl:text>,</xsl:text>
		</xsl:if>-->
	</xsl:template>
	<!--=======================================================================-->
	<!-- Leer-Template, tut gar nichts -->
	<!--=======================================================================-->
	<xsl:template match="@*|node()"/>
</xsl:stylesheet>
