sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'FullStackTrial/Risks/test/integration/FirstJourney',
		'FullStackTrial/Risks/test/integration/pages/RiskList',
		'FullStackTrial/Risks/test/integration/pages/RiskObjectPage'
    ],
    function(JourneyRunner, opaJourney, RiskList, RiskObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('FullStackTrial/Risks') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRiskList: RiskList,
					onTheRiskObjectPage: RiskObjectPage
                }
            },
            opaJourney.run
        );
    }
);