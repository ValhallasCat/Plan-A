var nestedData = [
    {
        id: 1,
        titel: "CarePlan Endometriose", // CarePlan "title"
        description: "CarePlan beinhaltet initiale Schritte für die Behandlung von Endometriose und die Linderung der Symptome.", // CarePlan "description"
        created: "10.09.2024", // CarePlan "created"
        status: "aktiv", // CarePlan "status"
        aktivitat: [
            {
                conditionActivity: "Endometriose", //  Condition "code.displayName" -> für Expert*innen soll auch immer die Codierung angezeigt werden
                TypeActivity: "Die Patientin soll eine Selbsthilfegruppe zum Thema Schmerzmanagement besuchen.", // Task "descprition"
                RessourceType: "Service Request", // Typ der verlinkten Ressoruce im Task selbst, also Task "focus"
                priorityActivity: "Niedere Priorität", // Task "priority" -> hier könnte man mappen: "routine" -> nieder Priorität; "urgent" -> mittlere Priorität;   "asap" "stat" -> hohe Priorität
                restrictionrepetitions: "10 Wiederholungen", // Task "restriction.repetitions"
                restrictionperiodes: "von 01.01.2025 bis 01.01.2026", // Task "restriciton.periode"
                patientReported: true, // nur als Idee -> gerne auch weglassen
                codereason: "Schulung über Schmerzmanagement", //Task "reason.code"
                codeRessource: "Überweisung an eine Selbsthilfegruppe", //ServiceRequest "category"
                descriptionActivity: //Task als übergeordnetes Element, in der Beschreibung dann spezifisch auf den Ressorucen Type eingehen...
                `<b>Patientenanweisung</b>: Auf der Webseite werden die Termine für die Selbsthilfegruppe aufgelistet (https://www.eva-info.at/) <br>
                 <b>Wann soll die Aktivität wahrgenommen werden?</b> Wenn Bedarf besteht. <br>
                 <b>Kontaktperson?</b> CarePlan/Sub CarePlan Author
                `
            },
            {
                conditionActivity: "Endometriose",
                TypeActivity: "Die Patientin soll eine antiinflammatorische Ernährungsform folgen.",
                RessourceType: "Nutirition Order",
                priorityActivity: "Niedere Priorität",
                restrictionrepetitions: "Keine",
                restrictionperiodes: "von 01.01.2025 bis 01.06.2026",
                patientReported: true,
                codereason: "Verdauungsprobleme",
                codeRessource: "Mediterrane Diät", //Nutrition Order oralDiet.type
                descriptionActivity: //Task als übergeordnetes Element, in der Beschreibung dann spezifisch auf den Ressorucen Type eingehen...
                `<b>Lebensmittel empfohlen</b>: Kichererbsen <br>
                 <b>Lebensmittel zu vermeiden:</b> Eier<br>
                 <b>Einzuenhemne Nahrungsergänzungsmittel:</b> Omega-3, alle 3 Tage 500mg<br>
                 <b>Notiz</b>: Omega-3 immer nach Mahlzeit einnehmen <br>
                <b>Kontaktperson?</b> CarePlan/Sub CarePlan Author
                `
            },

            {
                conditionActivity: "Endometriose",
                TypeActivity: "Die Patientin soll Kontak zur Fachärztin aufnehmen um aktue Schmerzen abzuklären.",
                RessourceType: "Communication Request",
                priorityActivity: "Hohe Priorität",
                restrictionrepetitions: "Keine",
                restrictionperiodes: "ab 07.11.2025",
                patientReported: true,
                codereason: "Akute Unterbauchschmerzen",
                codeRessource: "Abklärung", // Communication Request "category"
                descriptionActivity: //Task als übergeordnetes Element, in der Beschreibung dann spezifisch auf den Ressorucen Type eingehen...
                `<b>Zu Kontaktierende Person:</b> Fachärztin für Gynäkologie<br>
                 <b>Nachricht an Fachärztin:</b> Seit 14 Tagen liegt der Wert auf der Schmerzskala über 8 <br>
                 <b>Notiz</b>: Seit 14 Tage starke Schmerzen in der unteren Bauchregion, werden täglich schlimmer. <br>
                <b>Kontaktperson?</b> CarePlan/Sub CarePlan Author <br>
                `
            },

            {
                conditionActivity: "Endometriose",
                TypeActivity: "Die Patientin soll ein TRNS Gerät bei Bedarf verwenden.",
                RessourceType: "Device Request",
                priorityActivity: "Mittlere Priorität",
                restrictionrepetitions: "Keine",
                restrictionperiodes: "ab 01.01.2025",
                patientReported: true,
                codereason: "Schmerzen im Unterbauch",
                codeRessource: "Gerät Peripheral Neurostimulator", // Device Request "code"
                descriptionActivity: //Task als übergeordnetes Element, in der Beschreibung dann spezifisch auf den Ressorucen Type eingehen...
                `<b>Notiz</b>: Verwendung des Geräts bei Bedarf. <br>
                <b>Kontaktperson?</b> CarePlan/Sub CarePlan Author <br>
                `
            },
        ],
        goal: [
            {conditionGoal:"Endometriose", // Condition "code"
            priority: "Hohe Priorität", // Goal "priority"
            descriptionGoal: "Schmerzempfinden soll auf ein Minimum gesenkt werden.", // Goal "description"
            target: "Schmerzskala 1-10, zu erreichender Wert: 0", //Goal  "target.measure" und "target.detail"
            achivementStatusGoal: "in Bearbeitung", patientReportedGoal: true}, // Goal "achievementStatus"

            {conditionGoal:"Endometriose",
                priority: "Mittlere Priorität",
                descriptionGoal: "Diätumstellung auf eine antiinflammatorische Diät",
                target: "kein Zielwert",
                achivementStatusGoal: "in Bearbeitung",
                patientReportedGoal: false},
        ]
    },
    {
        id: 2,
        titel: "CarePlan Herzinsuffizienz",
        description: "Der CarePlan dient dazu aktuelle Probleme des Patienten aufgrund seiner Herzinsuffizienz zu lindern.",
        created: "01.01.2025",
        status: "aktiv",
        aktivitat: [
            {
                conditionActivity: "Herzinsuffizienz",
                TypeActivity: "Der Patient soll seinen Cholesterinwert dauerhaft senken.",
                RessourceType: "Task",
                priorityActivity: "Hohe Priorität",
                restrictionrepetitions: "Keine",
                restrictionperiodes: "ab 01.01.2025",
                patientReported: false,
                codereason: "Erhöhte Cholesterinwert",
                codeRessource: "", // keine weitere Ressoruce wurde verlinkt
            },
        ],
        goal: [
            {conditionGoal:"Herzinsuffizienz",
            priority: "Hohe Priorität",
            descriptionGoal: "Cholesterinwert im Blut senken",
            target: "Cholesterinwert, zu erreichender Wert: 200 mg/dl",
            achivementStatusGoal: "in Bearbeitung",
            patientReportedGoal: true},
        ]
    },
];

var selectedRows = [];
var aktivitatTable = null;
var goalTable = null;

var table = new Tabulator("#example-table", {
    layout: "fitColumns",
    data: nestedData,
    selectable: "highlight",
    height: "auto",
    columns: [
        {formatter: "rowSelection", titleFormatter: "rowSelection", hozAlign: "center", headerSort: false, width: 60, responsive: 0, cellClick: function(e, cell) {
            cell.getRow().toggleSelect();
        }},
        {title: "Titel", field: "titel", responsive: 0},
        {title: "Beschreibung", field: "description", formatter: "textarea"},
        {title: "Datum", field: "created"},
        {title: "Status", field: "status"},
    ],
});

table.on("rowSelectionChanged", function(data, rows){
    selectedRows = rows;
    updateDetailSection();
});

function initDetailTables() {
    aktivitatTable = new Tabulator("#aktivitat-table", {
        layout: "fitColumns",
        responsiveLayout: "collapse",
        height: "auto",
        columns: [
            {
                formatter: "responsiveCollapse",
                width: 40,
                minWidth: 40,
                hozAlign: "center",
                resizable: false,
                headerSort: false
            },
            {title: "Für...", field: "conditionActivity", responsive: 0, formatter: "textarea"},
            {title: "Beschreibung", field: "TypeActivity", responsive: 1, formatter: "textarea", minWidth: 180},
            {title: "Priorität", field: "priorityActivity", responsive: 2, formatter: "textarea" }, // Task Priority
            {title: "Anzahl", field: "restrictionrepetitions", responsive: 3, formatter: "textarea"}, // Task Rescription Repetiotions
            {title: "Zeitrahmen", field: "restrictionperiodes", responsive: 4, formatter: "textarea"}, // Task Restriction Periode
            {title: "ResourceType", field: "RessourceType", visible: false, formatter: "textarea"},
            {title: "Grund", field: "codereason" ,formatter: "textarea"}, // Task Reason Code
            {
                title: "Selbstauskunft Patient: <br> Aktivität erledigt?",
                field: "patientReported",
                width: 180,
                editor: true,
                formatter: "tickCross",
                hozAlign: "center",
                responsive: 5
            },
            {
                title: "Details",
                field: "expand",
                width: 80,
                hozAlign: "center",
                formatter: function(cell) {
                    return '<button class="expand-btn">▼</button>';
                },
                cellClick: function(e, cell) {
                    e.stopPropagation();
                    toggleRowDetails(cell.getRow());
                },
                headerSort: false,
                responsive: 0
            }
        ]
    });

    goalTable = new Tabulator("#goal-table", {
        layout: "fitColumns",
        responsiveLayout: "collapse",
        height: "auto",
        columns: [
            {
                formatter: "responsiveCollapse",
                width: 40,
                minWidth: 40,
                hozAlign: "center",
                resizable: false,
                headerSort: false
            },
            {title: "Für...", field: "conditionGoal", responsive: 0},
            {title: "Priorität", field: "priority", responsive: 1},
            {title: "Beschreibung", field: "descriptionGoal", formatter: "textarea", responsive: 2},
            {title: "Ziel Zustand", field: "target", formatter: "textarea", responsive: 3},
            {title: "Goal Erreicht?", field: "achivementStatusGoal", responsive: 4},
            {
                title: "Selbstauskunft Patient: <br> Ziel erreicht?",
                field: "patientReportedGoal",
                width: 180,
                editor: true,
                formatter: "tickCross",
                hozAlign: "center",
                responsive: 5
            },
        ]
    });
}

function toggleRowDetails(row) {
    var rowData = row.getData();
    var rowElement = row.getElement();
    var existingDetails = rowElement.nextElementSibling;

    if (existingDetails && existingDetails.classList.contains('detail-row')) {
        existingDetails.remove();
        var btn = rowElement.querySelector('.expand-btn');
        if (btn) btn.textContent = '▼';
        return;
    }

    var detailRow = document.createElement('div'); // hier werden die einzelnen Ressorucentypen genauer beschrieben bzw. gibt es die Möglichkeit hier genauere Angaben zu machen
    detailRow.className = 'detail-row';
    detailRow.innerHTML = `
        <div class="detail-content">
            <div class="detail-header">
                <strong></br> Genauere Beschreibung ${rowData.codeRessource}:</strong>
            </div></br>
            <div class="detail-text">
                ${rowData.descriptionActivity || 'Keine detaillierte Beschreibung verfügbar.'}
            </div>
            </br>
        </div>
    `;

    rowElement.parentNode.insertBefore(detailRow, rowElement.nextSibling);

    var btn = rowElement.querySelector('.expand-btn');
    if (btn) btn.textContent = '▲';
}

function updateDetailSection() {
    if (selectedRows.length === 0) {
        document.getElementById('detail-section').style.display = 'none';
        return;
    }

    document.getElementById('detail-section').style.display = 'block';
    document.getElementById('selected-count').textContent = selectedRows.length;

    var allAktivitat = [];
    var allGoals = [];

    selectedRows.forEach(function(row) {
        var data = row.getData();

        if (data.aktivitat) {
            data.aktivitat.forEach(function(item) {
                allAktivitat.push({
                    ...item
                });
            });
        }

        if (data.goal) {
            data.goal.forEach(function(item) {
                allGoals.push({
                    ...item
                });
            });
        }
    });

    if (aktivitatTable) {
        aktivitatTable.setData(allAktivitat);
    }

    if (goalTable) {
        goalTable.setData(allGoals);
    }

    applyFilterState();
}

var showAktivitat = true;
var showGoal = true;

function applyFilterState() {
    var aktivitatSection = document.getElementById('aktivitat-section');
    var goalSection = document.getElementById('goal-section');

    if (showAktivitat) {
        aktivitatSection.classList.remove('hidden');
    } else {
        aktivitatSection.classList.add('hidden');
    }

    if (showGoal) {
        goalSection.classList.remove('hidden');
    } else {
        goalSection.classList.add('hidden');
    }
}

document.getElementById('show-aktivitat').addEventListener('click', function() {
    showAktivitat = !showAktivitat;
    this.classList.toggle('active');
    applyFilterState();
});

document.getElementById('show-goal').addEventListener('click', function() {
    showGoal = !showGoal;
    this.classList.toggle('active');
    applyFilterState();
});

document.getElementById('clear-selection').addEventListener('click', function() {
    table.deselectRow();
    selectedRows = [];
    document.getElementById('detail-section').style.display = 'none';
});

initDetailTables();
