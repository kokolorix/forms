	
import { ColDef, ISchema, IComponent } from 'src/app/components';
import { formguid_VSE_IA18_DE, SchemaGuids } from './schema-guid-def';
import { inputGroup, label, labelhtml, schemaClassLayout, w_full, cb_single, multiple_checkboxes_with_cust } from './schema-utils';
		
const VSE_IA18_DE1_FrObjektStandortVSE_18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrObjektStandortVSE_18',
			label: 'Ort der Installation',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				label('Standort'),
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
				label('Gemeinde'),
				{
					hint: 'GEMEINDE',
					type: 'input',
					field: 'GEMEINDE',
					max: 30,
					dataType : 'string',
				},
				label('Parzelle'),
				{
					hint: 'PARZELLE',
					type: 'input',
					field: 'PARZELLE',
					max: 18,
					dataType : 'string',
				},
				label('Versicherungs-Nr.'),
				{
					hint: 'VERSICH',
					type: 'input',
					field: 'VERSICH',
					max: 18,
					dataType : 'string',
				},
				label('Standort'),
				{
					hint: 'GEBAEUDEART',
					type: 'input',
					field: 'GEBAEUDEART',
					max: 40,
					dataType : 'string',
				},
				label('Anz. Einheiten/Zähler'),
				{
					hint: 'ANZWOHNG',
					type: 'input',
					field: 'ANZWOHNG',
					dataType : 'int',
				},
				label('Gebäudeteil'),
				{
					hint: 'GEBAEUDETEIL',
					type: 'input',
					field: 'GEBAEUDETEIL',
					max: 40,
					dataType : 'string',
				},
				cb_single('Zusammenschluss zum Eigenverbrauch (ZEV)','ZEV', false),

			],
		},
	],
}
	
const VSE_IA18_DE2_FrKontakteVSE: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrKontakteVSE',
			label: 'Adressen / Geschäftspartner',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [

		label('Installateur', true, 'font-bold'),
						label('Bewillig.-Nr:'),
				{
					hint: 'I_KONZESS',
					type: 'input',
					field: 'I_KONZESS',
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
		
	
		label('Eigentümer', true, 'font-bold'),
		
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
		
	
		label('Zusätzliche Adresse', true, 'font-bold'),
		
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
		
	
			],
		},
	],
}
	
const VSE_IA18_DE3_FrInstallationsbeschriebVSE_18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrInstallationsbeschriebVSE_18',
			label: 'Installationsbeschrieb',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				label(''),
				{
					hint: 'I_TEXT',
					type: 'input',
					field: 'I_TEXT',
					multiline: true,
					width: w_full,
					rows: 4,
					dataType : 'string',
				},
				cb_single('Neuanlage','I_NEW', false),
				cb_single('Änderung/Erweiterung','I_EXTENT', false),
				cb_single('Rückbau','I_REMOVE', false),
				cb_single('Bauanschluss','I_PROV', false),
				cb_single('Temporär','I_TEMP', false),
				cb_single('Festplatz','I_AREA', false),

			],
		},
	],
}
	
const VSE_IA18_DE4_FrInstallationVSE_IA18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrInstallationVSE_IA18',
			label: 'Netzanschluss',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				label('Standort:'),
				{
					hint: 'ANSCH_ORT',
					type: 'input',
					field: 'ANSCH_ORT',
					max: 24,
					dataType : 'string',
				},
				cb_single('Kabel','ANSCH_KAB', false),
				cb_single('Freileitung','ANSCH_FREI', false),
				label('Erforderlicher AS-Überstromunterbrecher:'),
				{
					hint: 'ANSCH_AS_ERF',
					type: 'input',
					field: 'ANSCH_AS_ERF',
					dataType : 'int',
				},
				label('max. Netzbezugsleistung:'),
				{
					hint: 'ANSCH_MAXBEZ',
					type: 'input',
					field: 'ANSCH_MAXBEZ',
					dataType : 'string',
				},
				label('max. Netzeinspeiseleistung:'),
				{
					hint: 'ANSCH_MAXSPEIS',
					type: 'input',
					field: 'ANSCH_MAXSPEIS',
					dataType : 'string',
				},
				cb_single('Kabel','ANSCH_KAB', false),
				cb_single('Freileitung','ANSCH_FREI', false),
				label('Bisheriger AS-Überstromunterbrecher:'),
				{
					hint: 'ANSCH_AS_VOR',
					type: 'input',
					field: 'ANSCH_AS_VOR',
					dataType : 'int',
				},
				label('Modell:'),
				{
					hint: 'ANSCH_MOD',
					type: 'input',
					field: 'ANSCH_MOD',
					max: 14,
					dataType : 'string',
				},
				cb_single('HAK integriert','ANSCH_HAKINT', false),
				label('Erforderlicher AS-Überstromunterbrecher:'),
				{
					hint: 'ANSCH_AS_ERF',
					type: 'input',
					field: 'ANSCH_AS_ERF',
					dataType : 'int',
				},
				label('max. Netzbezugsleistung:'),
				{
					hint: 'ANSCH_MAXBEZ',
					type: 'input',
					field: 'ANSCH_MAXBEZ',
					dataType : 'string',
				},
				label('max. Netzeinspeiseleistung:'),
				{
					hint: 'ANSCH_MAXSPEIS',
					type: 'input',
					field: 'ANSCH_MAXSPEIS',
					dataType : 'string',
				},
				label('Erforderlicher AS-Überstromunterbrecher:'),
				{
					hint: 'ANSCH_AS_ERF',
					type: 'input',
					field: 'ANSCH_AS_ERF',
					dataType : 'int',
				},
				label('max. Netzbezugsleistung:'),
				{
					hint: 'ANSCH_MAXBEZ',
					type: 'input',
					field: 'ANSCH_MAXBEZ',
					dataType : 'string',
				},
				label('max. Netzeinspeiseleistung:'),
				{
					hint: 'ANSCH_MAXSPEIS',
					type: 'input',
					field: 'ANSCH_MAXSPEIS',
					dataType : 'string',
				},
				label('Erforderlicher AS-Überstromunterbrecher:'),
				{
					hint: 'ANSCH_AS_ERF',
					type: 'input',
					field: 'ANSCH_AS_ERF',
					dataType : 'int',
				},
				label('Modell:'),
				{
					hint: 'ANSCH_MOD',
					type: 'input',
					field: 'ANSCH_MOD',
					max: 14,
					dataType : 'string',
				},
				cb_single('HAK integriert','ANSCH_HAKINT', false),
				label('max. Netzbezugsleistung:'),
				{
					hint: 'ANSCH_MAXBEZ',
					type: 'input',
					field: 'ANSCH_MAXBEZ',
					dataType : 'string',
				},
				label('max. Netzeinspeiseleistung:'),
				{
					hint: 'ANSCH_MAXSPEIS',
					type: 'input',
					field: 'ANSCH_MAXSPEIS',
					dataType : 'string',
				},
				label('(H)AK-Nr:'),
				{
					hint: 'ANSCH_HAKNR',
					type: 'input',
					field: 'ANSCH_HAKNR',
					max: 20,
					dataType : 'string',
				},
				label('Erforderlicher AS-Überstromunterbrecher:'),
				{
					hint: 'ANSCH_AS_ERF',
					type: 'input',
					field: 'ANSCH_AS_ERF',
					dataType : 'int',
				},
				label('max. Netzbezugsleistung:'),
				{
					hint: 'ANSCH_MAXBEZ',
					type: 'input',
					field: 'ANSCH_MAXBEZ',
					dataType : 'string',
				},
				label('max. Netzeinspeiseleistung:'),
				{
					hint: 'ANSCH_MAXSPEIS',
					type: 'input',
					field: 'ANSCH_MAXSPEIS',
					dataType : 'string',
				},
				label('(H)AK-Nr:'),
				{
					hint: 'ANSCH_HAKNR',
					type: 'input',
					field: 'ANSCH_HAKNR',
					max: 20,
					dataType : 'string',
				},
				label('Bisheriger AS-Überstromunterbrecher:'),
				{
					hint: 'ANSCH_AS_VOR',
					type: 'input',
					field: 'ANSCH_AS_VOR',
					dataType : 'int',
				},
				label('Erforderlicher AS-Überstromunterbrecher:'),
				{
					hint: 'ANSCH_AS_ERF',
					type: 'input',
					field: 'ANSCH_AS_ERF',
					dataType : 'int',
				},
				label('Modell:'),
				{
					hint: 'ANSCH_MOD',
					type: 'input',
					field: 'ANSCH_MOD',
					max: 14,
					dataType : 'string',
				},
				cb_single('HAK integriert','ANSCH_HAKINT', false),
				label('max. Netzbezugsleistung:'),
				{
					hint: 'ANSCH_MAXBEZ',
					type: 'input',
					field: 'ANSCH_MAXBEZ',
					dataType : 'string',
				},
				label('max. Netzeinspeiseleistung:'),
				{
					hint: 'ANSCH_MAXSPEIS',
					type: 'input',
					field: 'ANSCH_MAXSPEIS',
					dataType : 'string',
				},

			],
		},
	],
}
	
const VSE_IA18_DE5_FrVerbraucherListeVSE_IA18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrVerbraucherListeVSE_IA18',
			label: 'Liste der Verbraucher, Erzeuger, Speicher',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				cb_single('gemäss beiliegender Liste','VERBLIST', false),
				{
					type: 'datatable',
					field: 'VGListe',
					classLayout: 'col-start-1 col-span-2',
					dragdrop: true,
					colDefs: [
						{ title: 'Anzahl', field: 'ANZAHL', class: 'col-start-1 col-span-3' },
						{ title: 'Verbr.', field: 'VERBRAUCHER', class: 'col-start-4 col-span-3' },
						{ title: 'Erzeuger', field: 'ERZEUGER', class: 'col-start-7 col-span-3' },
						{ title: 'Speicher', field: 'SPEICHER', class: 'col-start-10 col-span-3' },
						{ title: 'Bezeichnung des Verbrauchers, Erzeugers, Speichers', field: 'TEXT', class: 'col-start-13 col-span-3' },
					],
					detailComponent: {
						type: 'panel',
						classLayout: schemaClassLayout,
						children: [
					label('Anzahl'),
					{
						hint: 'ANZAHL',
						type: 'input',
						field: 'ANZAHL',
						dataType : 'int',
					},
					cb_single('Verbr.','VERBRAUCHER', false),
					cb_single('Erzeuger','ERZEUGER', false),
					cb_single('Speicher','SPEICHER', false),
					label('Bezeichnung des Verbrauchers, Erzeugers, Speichers'),
					{
						hint: 'TEXT',
						type: 'input',
						field: 'TEXT',
						max: 50,
						dataType : 'string',
						options : [
							'Beleuchtung',
							'Kochherd mit Backofen',
							'Kochherd ohne Backofen',
							'Backofen',
							'Geschirrspüler',
							'Waschautomat',
							'Waschautomat mit Zählerumschalter',
							'Wäschetrockner',
							'Boiler  .... l,  Aufheizzeit .... h',
							'Motoren ohne Anschlussgesuch',
							'Motoren mit Anschlussgesuch',
							'Wärmepumpe ohne Anschlussgesuch',
							'Wärmepumpe mit Anschlussgesuch',
							'Apparat Netzrückwirkungen verursachend',
						],
					},
					label('techn. Anschlussgesuch (TAG) vom'),
					{
						hint: 'GES_DATUM',
						type: 'input',
						field: 'GES_DATUM',
						dataType : 'date',
					},
					label('Leistung Bezug vom Netz [kVA]'),
					{
						hint: 'KVA',
						type: 'input',
						field: 'KVA',
						dataType : 'string',
					},
					label('Leistung Abgabe ans Netz [kVA]'),
					{
						hint: 'KVA_ANS_NETZ',
						type: 'input',
						field: 'KVA_ANS_NETZ',
						dataType : 'string',
					},
					label('Speicher- kapazität [kWh]'),
					{
						hint: 'SPEICH_KAP',
						type: 'input',
						field: 'SPEICH_KAP',
						dataType : 'string',
					},
					label('Anz. Aussen- leiter (1-3)'),
					{
						hint: 'ANZ_AUSSENL',
						type: 'input',
						field: 'ANZ_AUSSENL',
						dataType : 'int',
						options : [
							'1',
							'2',
							'3',
							'1',
							'2',
							'3',
						],
					},
						],
					},
				},
				label('Leistung Total Bezug vom Netz'),
				{
					hint: 'V_LEIST_VOM',
					type: 'input',
					field: 'V_LEIST_VOM',
					dataType : 'string',
				},
				label('Leistung Total Abgabe ans Netz'),
				{
					hint: 'V_LEIST_AN',
					type: 'input',
					field: 'V_LEIST_AN',
					dataType : 'string',
				},
				cb_single('Teilnahme an Systemdienstleistung (Regelenergie)','SYSTDIENSTL', false),
				label('Voraussichtliche Maximalbelastung Total'),
				{
					hint: 'V_LEISTMAX',
					type: 'input',
					field: 'V_LEISTMAX',
					dataType : 'string',
				},
				cb_single('aktive Steuerung VNB','STEUER_VNB', false),
				cb_single('mit Herkunftsnachweis (HKN)','MITHKN', false),

			],
		},
	],
}
	
const VSE_IA18_DE6_FrTarifapparateVSE_18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrTarifapparateVSE_18',
			label: 'Liste der Mess- und Steuereinrichtungen',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				{
					type: 'datatable',
					field: 'TAListe',
					classLayout: 'col-start-1 col-span-2',
					dragdrop: true,
					colDefs: [
						{ title: 'Stromkunde-Name', field: 'BEZUEGER', class: 'col-start-1 col-span-3' },
						{ title: 'Rechnungsadresse', field: 'RECHADR', class: 'col-start-4 col-span-3' },
						{ title: 'Gebäudeteil', field: 'GEBTEIL', class: 'col-start-7 col-span-3' },
						{ title: 'Nutzung', field: 'NUTZUNG', class: 'col-start-10 col-span-3' },
						{ title: 'Verbrauchs- stelle VNB', field: 'EVUANLNR', class: 'col-start-13 col-span-3' },
					],
					detailComponent: {
						type: 'panel',
						classLayout: schemaClassLayout,
						children: [
					label('Stromkunde-Name'),
					{
						hint: 'BEZUEGER',
						type: 'input',
						field: 'BEZUEGER',
						max: 40,
						dataType : 'string',
					},
					label('Rechnungsadresse'),
					{
						hint: 'RECHADR',
						type: 'input',
						field: 'RECHADR',
						max: 100,
						dataType : 'string',
					},
					label('Gebäudeteil'),
					{
						hint: 'GEBTEIL',
						type: 'input',
						field: 'GEBTEIL',
						max: 40,
						dataType : 'string',
					},
					label('Nutzung'),
					{
						hint: 'NUTZUNG',
						type: 'input',
						field: 'NUTZUNG',
						max: 40,
						dataType : 'string',
					},
					label('Verbrauchs- stelle VNB'),
					{
						hint: 'EVUANLNR',
						type: 'input',
						field: 'EVUANLNR',
						max: 20,
						dataType : 'string',
					},
					label('Stock- werk'),
					{
						hint: 'STOCKWERK',
						type: 'input',
						field: 'STOCKWERK',
						max: 6,
						dataType : 'string',
					},
					label('Raum- nummer'),
					{
						hint: 'RAUM',
						type: 'input',
						field: 'RAUM',
						max: 6,
						dataType : 'string',
					},
					label('VNB Tarif'),
					{
						hint: 'TARIF',
						type: 'input',
						field: 'TARIF',
						max: 30,
						dataType : 'string',
					},
					label('Sich. [A]'),
					{
						hint: 'SICH_IN',
						type: 'input',
						field: 'SICH_IN',
						dataType : 'int',
					},
					label('Zählernummer VNB'),
					{
						hint: 'WERKNR',
						type: 'input',
						field: 'WERKNR',
						max: 20,
						dataType : 'string',
					},
					label('Mont. Ort'),
					{
						hint: 'MONT_ORT',
						type: 'input',
						field: 'MONT_ORT',
						max: 30,
						dataType : 'string',
					},
					cb_single('ZEV','ZEV', false),
					label('Anz. Aussenl. (1-3)'),
					{
						hint: 'ANZ_AUSSENL',
						type: 'input',
						field: 'ANZ_AUSSENL',
						dataType : 'int',
						options : [
							'1',
							'2',
							'3',
							'1',
							'2',
							'3',
						],
					},
					cb_single('neu','NEU', false),
					cb_single('vorh.','VORH', false),
					cb_single('ausw.','AUSW', false),
					cb_single('demont.','DEMONT', false),
					cb_single('ummont.','UMMONT', false),
						],
					},
				},

			],
		},
	],
}
	
const VSE_IA18_DE7_FrTREVSE: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrTREVSE',
			label: 'TRE',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				label('TRE/LSG'),
				{
					hint: 'RSEANZ',
					type: 'input',
					field: 'RSEANZ',
					dataType : 'int',
				},
				label('Kommando'),
				{
					hint: 'RSEKDO',
					type: 'input',
					field: 'RSEKDO',
					max: 30,
					dataType : 'string',
				},
				label('TRE/LSG'),
				{
					hint: 'RSENR',
					type: 'input',
					field: 'RSENR',
					max: 10,
					dataType : 'string',
				},
				label('TRE/LSG'),
				{
					hint: 'RSEMONT',
					type: 'input',
					field: 'RSEMONT',
					max: 16,
					dataType : 'string',
				},
				cb_single('','RSENEU', false),
				cb_single('','RSEVORH', false),
				cb_single('','RSEAUSW', false),
				cb_single('','RSEDEMONT', false),
				cb_single('','RSEUMMONT', false),

			],
		},
	],
}
	
const VSE_IA18_DE8_FrInbetriebnahmeVSE: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrInbetriebnahmeVSE',
			label: 'Termine',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				label('Inbetriebsetzungstermin ca.'),
				{
					hint: 'TERMIN',
					type: 'input',
					field: 'TERMIN',
					dataType : 'date',
				},
				label(''),
				{
					hint: 'ABSCHLTERMIN',
					type: 'input',
					field: 'ABSCHLTERMIN',
					dataType : 'date',
				},

			],
		},
	],
}
	
const VSE_IA18_DE9_FrBemerkungenVSE_IA18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrBemerkungenVSE_IA18',
			label: 'Bemerkungen',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				label(''),
				{
					hint: 'INSTBEM',
					type: 'input',
					field: 'INSTBEM',
					multiline: true,
					width: w_full,
					rows: 3,
					dataType : 'string',
				},

			],
		},
	],
}
	
const VSE_IA18_DE10_FrBeilagenVSE_IA18: IComponent = {
	type: 'card',
	classLayout: 'w-full',
	children: [
		{
			type: 'panel',
			name: 'FrBeilagenVSE_IA18',
			label: 'Beilagen',
			class: 'col-span-2',
			classLayout: schemaClassLayout,
			children: [
				cb_single('Schema','SCHEMA', false),
				cb_single('Situationsplan','PLAN', false),
				cb_single('Anschlussgesuch TAG für ','GESUCH', false),
				label(''),
				{
					hint: 'GESUCHTXT',
					type: 'input',
					field: 'GESUCHTXT',
					max: 30,
					dataType : 'string',
				},
				cb_single('Disposition Hauptverteilung','DISP', false),
				cb_single('Liste der Verbraucher, Erzeuger, Speicher','VERBLIST', false),
				cb_single('Zustimmung Endverbraucher/Erzeuger Steuerung durch VNB','STEUER', false),
				cb_single('','BEILLEER', false),
				label(''),
				{
					hint: 'BEILTXT',
					type: 'input',
					field: 'BEILTXT',
					max: 30,
					dataType : 'string',
				},

			],
		},
	],
}
	

export const VSE_IA18_DE: ISchema = {
	type: 'panel',
	classLayout: 'w-full',
	children: [
		VSE_IA18_DE1_FrObjektStandortVSE_18,
		VSE_IA18_DE2_FrKontakteVSE,
		VSE_IA18_DE3_FrInstallationsbeschriebVSE_18,
		VSE_IA18_DE4_FrInstallationVSE_IA18,
		VSE_IA18_DE5_FrVerbraucherListeVSE_IA18,
		VSE_IA18_DE6_FrTarifapparateVSE_18,
		VSE_IA18_DE7_FrTREVSE,
		VSE_IA18_DE8_FrInbetriebnahmeVSE,
		VSE_IA18_DE9_FrBemerkungenVSE_IA18,
		VSE_IA18_DE10_FrBeilagenVSE_IA18,
	]
}
			

SchemaGuids.registerSchema(formguid_VSE_IA18_DE, 'Installationsanzeige', 'IA', [
	VSE_IA18_DE,
])