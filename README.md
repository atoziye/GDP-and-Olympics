# GDP-and-Olympics
Dataset and R code to visualize the relationship between national GDP (per capita) and Olympic medal haul across the last 5 Summer Olympic Games (2004-2020). SVG/PNG versions of the final graphic are also available for download. 

These plot originally appeared in a [blog post](https://formulabot.com/blog/olympic-wealth-gdp-country-sport-dominance-correlation) on Formula Bot. This repo is intended as a resource and learning tool for those interested in creating similar graphics and/or replicating our work. 

We sourced raw data from the official Olympics website via Kaggle ([here](https://www.kaggle.com/datasets/samruddhim/olympics-althlete-events-analysis) and [here](https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo)) and the official [IMF website](https://www.imf.org/external/datamapper/NGDP_RPCH@WEO/OEMDC/ADVEC/WEOWORLD). Then, using [Formula Bot's Data Prep tool](https://formulabot.com/), we aggregated the datasets into one before wrangling it into the final dataset available for download in this repo. This final dataset contains columns for country name, number of (gold) medals won across the last 5 Olympics, percentage of medals won that were gold, 2024 GDP, 2024 GDP per capita, and region. The R code used to produce the visualizations from this dataset can be found here.






