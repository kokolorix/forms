	
import { ColDef, ISchema, IComponent } from 'src/app/components';
import { formguid_SINA18_DE, SchemaGuids } from './schema-guid-def';
import { inputGroup, label, labelhtml, schemaClassLayout, w_full, cb_single, multiple_checkboxes_with_cust } from './schema-utils';
		
const SINA18_DE1_FrObjektStandortBemerkungSINA18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrObjektStandortBemerkungSINA18',
			label: 'Ort der Installation',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				label('Standort:'),
				{
					hint: 'O_STRASSE',
					type: 'input',
					field: 'O_STRASSE',
					max: 30,
					dataType : 'string',
				},
				label(''),
				{
					hint: 'O_HAUSNR',
					type: 'input',
					field: 'O_HAUSNR',
					max: 24,
					dataType : 'string',
				},
				label(''),
				{
					hint: 'O_PLZ',
					type: 'input',
					field: 'O_PLZ',
					max: 8,
					dataType : 'string',
				},
				label(''),
				{
					hint: 'O_ORT',
					type: 'input',
					field: 'O_ORT',
					max: 30,
					dataType : 'string',
				},
				label('Gemeinde:'),
				{
					hint: 'GEMEINDE',
					type: 'input',
					field: 'GEMEINDE',
					max: 30,
					dataType : 'string',
				},
				label('Parzelle-Nr:'),
				{
					hint: 'PARZELLE',
					type: 'input',
					field: 'PARZELLE',
					max: 18,
					dataType : 'string',
				},
				label('Standort:'),
				{
					hint: 'GEBAEUDENR',
					type: 'input',
					field: 'GEBAEUDENR',
					max: 16,
					dataType : 'string',
				},
				label('EGID:'),
				{
					hint: 'EGID',
					type: 'input',
					field: 'EGID',
					dataType : 'int',
				},
				label(''),
				{
					hint: 'GEBAEUDEART',
					type: 'input',
					field: 'GEBAEUDEART',
					max: 40,
					dataType : 'string',
				},
				label('Bemerkung:'),
				{
					hint: 'BEMERKUNG',
					type: 'input',
					field: 'BEMERKUNG',
					max: 40,
					dataType : 'string',
				},
				cb_single('ZEV:','ZEV', false),
				label('Parzelle-Nr:'),
				{
					hint: 'ZEV_TEXT',
					type: 'input',
					field: 'ZEV_TEXT',
					max: 40,
					dataType : 'string',
				},

			],
		},
	],
}
	
const SINA18_DE2_FrAnlageSINA18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrAnlageSINA18',
			label: 'Anlage',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				label('Stockw., Lage:'),
				{
					hint: 'LAGE',
					type: 'input',
					field: 'LAGE',
					max: 40,
					dataType : 'string',
				},
				label('Stromkunde:'),
				{
					hint: 'U_NAME1',
					type: 'input',
					field: 'U_NAME1',
					max: 40,
					dataType : 'string',
				},
				label('Zähler-Nr:'),
				{
					hint: 'ZAEHLER',
					type: 'input',
					field: 'ZAEHLER',
					max: 40,
					dataType : 'string',
				},
				label('Anlagen-Nr:'),
				{
					hint: 'ABONR',
					type: 'input',
					field: 'ABONR',
					max: 16,
					dataType : 'string',
				},
				label('Stromkunde:'),
				{
					hint: 'ANLNUTZUNG',
					type: 'input',
					field: 'ANLNUTZUNG',
					max: 40,
					dataType : 'string',
				},
				label('Stromkunde:'),
				{
					hint: 'ANLJAHR0',
					type: 'input',
					field: 'ANLJAHR0',
					dataType : 'int',
				},
				label('Zähler-Nr:'),
				{
					hint: 'ANL1',
					type: 'input',
					field: 'ANL1',
					max: 40,
					dataType : 'string',
				},
				label('Zähler-Nr:'),
				{
					hint: 'ANLJAHR1',
					type: 'input',
					field: 'ANLJAHR1',
					dataType : 'int',
				},
				label('Anlagen-Nr:'),
				{
					hint: 'ANL2',
					type: 'input',
					field: 'ANL2',
					max: 40,
					dataType : 'string',
				},
				label('Anlagen-Nr:'),
				{
					hint: 'ANLJAHR2',
					type: 'input',
					field: 'ANLJAHR2',
					dataType : 'int',
				},

			],
		},
	],
}
	
const SINA18_DE3_FrKontakteSINA: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrKontakteSINA',
			label: 'Adressen / Geschäftspartner',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [

		label('Elektro-Installateur', true, 'font-bold'),
						label('Bewillig.-Nr:'),
				{
					hint: 'E_KONZESS',
					type: 'input',
					field: 'E_KONZESS',
					max: 16,
					dataType : 'string',
				},

		label('Name'),
		inputGroup(
			[
				{
					type: 'input',
					label: 'Name1',
					field: '1_NAME1',
					hint: '1_NAME1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Name2',
					field: '1_NAME2',
					hint: '1_NAME2',
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
					field: '1_ADR1',
					hint: '1_ADR1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Adresse2',
					field: '1_ADR2',
					hint: '1_ADR2',
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
					field: '1_PLZ',
					hint: '1_PLZ',
					max: 4,
				},
				{
					type: 'input',
					label: 'Ort',
					max: 30,
					field: '1_ORT',
					hint: '1_ORT',
				}
			]
		),
		
		label('Unabhängiges Kontrollorgan', true, 'font-bold'),
						label('Bewillig.-Nr:'),
				{
					hint: 'K_KONZESS',
					type: 'input',
					field: 'K_KONZESS',
					max: 16,
					dataType : 'string',
				},

		label('Name'),
		inputGroup(
			[
				{
					type: 'input',
					label: 'Name1',
					field: '2_NAME1',
					hint: '2_NAME1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Name2',
					field: '2_NAME2',
					hint: '2_NAME2',
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
					field: '2_ADR1',
					hint: '2_ADR1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Adresse2',
					field: '2_ADR2',
					hint: '2_ADR2',
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
					field: '2_PLZ',
					hint: '2_PLZ',
					max: 4,
				},
				{
					type: 'input',
					label: 'Ort',
					max: 30,
					field: '2_ORT',
					hint: '2_ORT',
				}
			]
		),
		
		label('Eigentümer', true, 'font-bold'),
		
		label('Name'),
		inputGroup(
			[
				{
					type: 'input',
					label: 'Name1',
					field: '3_NAME1',
					hint: '3_NAME1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Name2',
					field: '3_NAME2',
					hint: '3_NAME2',
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
					field: '3_ADR1',
					hint: '3_ADR1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Adresse2',
					field: '3_ADR2',
					hint: '3_ADR2',
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
					field: '3_PLZ',
					hint: '3_PLZ',
					max: 4,
				},
				{
					type: 'input',
					label: 'Ort',
					max: 30,
					field: '3_ORT',
					hint: '3_ORT',
				}
			]
		),
		
		label('Verwaltung', true, 'font-bold'),
		
		label('Name'),
		inputGroup(
			[
				{
					type: 'input',
					label: 'Name1',
					field: '4_NAME1',
					hint: '4_NAME1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Name2',
					field: '4_NAME2',
					hint: '4_NAME2',
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
					field: '4_ADR1',
					hint: '4_ADR1',
					max: 40,
				},
				{
					type: 'input',
					label: 'Adresse2',
					field: '4_ADR2',
					hint: '4_ADR2',
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
					field: '4_PLZ',
					hint: '4_PLZ',
					max: 4,
				},
				{
					type: 'input',
					label: 'Ort',
					max: 30,
					field: '4_ORT',
					hint: '4_ORT',
				}
			]
		),
		
			],
		},
	],
}
	
const SINA18_DE4_FrKontrollumfangMitDatum18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrKontrollumfangMitDatum18',
			label: 'Kontrollumfang',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				cb_single('Schlusskontrolle (SK)','KONT_SK', false),
				cb_single('Auftrag zur SK erteilt an:','AUFTRSK', false),
				label(''),
				{
					hint: 'AUFTRSK_NAME1',
					type: 'input',
					field: 'AUFTRSK_NAME1',
					max: 40,
					dataType : 'string',
				},
				cb_single('Auftrag zur AK durch Installateur erteilt','AUFTRAK', false),
				label('Kontrolldatum SK:'),
				{
					hint: 'KONDATUM_SK',
					type: 'input',
					field: 'KONDATUM_SK',
					dataType : 'date',
				},
				cb_single('Abnahmekontrolle (AK)','KONT_AK', false),
				cb_single('Periodische Kontrolle (PK)','KONT_PK', false),
				label('Kontrolldatum AK/PK:'),
				{
					hint: 'KONDATUM_AKPK',
					type: 'input',
					field: 'KONDATUM_AKPK',
					dataType : 'date',
				},
				label(''),
				{
					hint: 'KONDATZUS',
					type: 'input',
					field: 'KONDATZUS',
					max: 40,
					dataType : 'string',
				},
				cb_single('Neuanlage','NEUANL', false),
				cb_single('Bestehende Anlage','BEST', false),
				cb_single('Änderung','ANDERS', false),
				cb_single('Erweiterung','ERWEIT', false),
				cb_single(' ','GRUND_X', false),
				label(''),
				{
					hint: 'GRUND_XTXT',
					type: 'input',
					field: 'GRUND_XTXT',
					max: 20,
					dataType : 'string',
					options : [
						'Temporäre Anlage',
						'Spezialinstallation',
					],
				},
				label('Inst.-Anzeige Nr. / Jahr'),
				{
					hint: 'PROJ_NR',
					type: 'input',
					field: 'PROJ_NR',
					max: 12,
					dataType : 'string',
				},
				label('/'),
				{
					hint: 'PROJ_JAHR',
					type: 'input',
					field: 'PROJ_JAHR',
					dataType : 'int',
				},
				label('Datum'),
				{
					hint: 'IA_DATUM',
					type: 'input',
					field: 'IA_DATUM',
					dataType : 'date',
				},
				label(''),
				{
					hint: 'KONTUMFANG',
					type: 'input',
					field: 'KONTUMFANG',
					multiline: true,
					width: w_full,
					rows: 4,
					dataType : 'string',
				},
				cb_single('Plomben wurden entfernt','PLOMBENTF', false),

			],
		},
	],
}
	
const SINA18_DE5_FrTechnischeAngabenSINA18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrTechnischeAngabenSINA18',
			label: 'Technische Angaben',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				cb_single('TN-S','TNS', false),
				cb_single('TN-C','TNC', false),
				cb_single('TN-C-S','TNCS', false),
				cb_single('','TNX', false),
				label('Schutz-System:'),
				{
					hint: 'TNTEXT',
					type: 'input',
					field: 'TNTEXT',
					max: 30,
					dataType : 'string',
				},
				label('Art, Charakteristik:'),
				{
					hint: 'AUU_ART',
					type: 'input',
					field: 'AUU_ART',
					max: 18,
					dataType : 'string',
				},
				label('IN:'),
				{
					hint: 'AUU_IN',
					type: 'input',
					field: 'AUU_IN',
					max: 10,
					dataType : 'string',
				},
				label('Überstrom-Schutzorgan am Anschlusspkt d. Inst.:'),
				{
					hint: 'UU_ZWECK',
					type: 'input',
					field: 'UU_ZWECK',
					max: 30,
					dataType : 'string',
				},
				label(''),
				{
					hint: 'UU_ART',
					type: 'input',
					field: 'UU_ART',
					max: 18,
					dataType : 'string',
				},
				label(''),
				{
					hint: 'UU_IN',
					type: 'input',
					field: 'UU_IN',
					max: 10,
					dataType : 'string',
				},
				label(''),
				{
					hint: 'UU_IKMAX',
					type: 'input',
					field: 'UU_IKMAX',
					max: 8,
					dataType : 'string',
				},
				label(''),
				{
					hint: 'UU_IK',
					type: 'input',
					field: 'UU_IK',
					max: 8,
					dataType : 'string',
				},
				label('IK Anf. [A] '),
				{
					hint: 'UU_IKLN',
					type: 'input',
					field: 'UU_IKLN',
					max: 8,
					dataType : 'string',
				},
				label(''),
				{
					hint: 'UU_IKLN_ENDE',
					type: 'input',
					field: 'UU_IKLN_ENDE',
					max: 8,
					dataType : 'string',
				},
				label(''),
				{
					hint: 'UU_RISO',
					type: 'input',
					field: 'UU_RISO',
					max: 8,
					dataType : 'string',
				},
				label('Besonderheiten:'),
				{
					hint: 'BESONDER',
					type: 'input',
					field: 'BESONDER',
					max: 92,
					dataType : 'string',
				},

			],
		},
	],
}
	
const SINA18_DE6_FrBeilagenSINA18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrBeilagenSINA18',
			label: 'Beilagen',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				cb_single('Mess- + Prüfprotokoll','BEI_MP', false),
				cb_single('Mess- + Prüfprotokoll Photovoltaik','BEI_MPPV', false),
				cb_single('','BEI_X', false),
				label(''),
				{
					hint: 'BEI_TEXT',
					type: 'input',
					field: 'BEI_TEXT',
					max: 30,
					dataType : 'string',
				},
				cb_single('SiNa + Zusatzdokumente an Eigentümer/Verw.','SINAV', false),
				cb_single('SiNa an Netzbetreiberin/Inspektorat','SINAN', false),
				cb_single(' ','VERT1_X', false),
				label(''),
				{
					hint: 'VERT1',
					type: 'input',
					field: 'VERT1',
					max: 40,
					dataType : 'string',
				},

			],
		},
	],
}
	

export const SINA18_DE: IComponent = {
	type: 'panel',
	classLayout: 'w-full',
	children: [
		SINA18_DE1_FrObjektStandortBemerkungSINA18,
		SINA18_DE2_FrAnlageSINA18,
		SINA18_DE3_FrKontakteSINA,
		SINA18_DE4_FrKontrollumfangMitDatum18,
		SINA18_DE5_FrTechnischeAngabenSINA18,
		SINA18_DE6_FrBeilagenSINA18,
	]
}
			

SchemaGuids.registerSchema(formguid_SINA18_DE, 'Sicherheitsnachweis', 'SiNa', [
	SINA18_DE,
])