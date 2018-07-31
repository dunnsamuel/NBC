
---
title: "NBC 16s Analyses.31 July, 2018"
author: "Sam Dunn"
date: "31 July, 2018"
output:
  html_document:
    df_print: paged
    keep_md: true

---

This is the graphing and statistical analyses for the 16s sequences collected for the NBC project in 2017.  Analyses began in Mothur on April 4th 2018 and were compelted on April 18th 2018.  A taxonomic summary was exported from mothur to R on 4/19/2018 and edits have been ongoing.




We have 1,737,300 sequences!  The "vegan" package is for diversity and other community metrics, the "RAM" packages is for evenness (vegan doesn't have it for some reason)

![](NBC_16s_analyses_files/figure-html/Shannon Diversity-1.png)<!-- --><div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["Date"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["term"],"name":[2],"type":["chr"],"align":["left"]},{"label":["df"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["sumsq"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["meansq"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["statistic"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["p.value"],"name":[7],"type":["dbl"],"align":["right"]}],"data":[{"1":"3","2":"Substrate","3":"4","4":"0.02876815","5":"0.007192036","6":"0.6507809","7":"0.63927630"},{"1":"3","2":"Residuals","3":"10","4":"0.11051394","5":"0.011051394","6":"NA","7":"NA"},{"1":"10","2":"Substrate","3":"4","4":"0.03277570","5":"0.008193926","6":"0.5701880","7":"0.69042210"},{"1":"10","2":"Residuals","3":"10","4":"0.14370570","5":"0.014370570","6":"NA","7":"NA"},{"1":"21","2":"Substrate","3":"4","4":"0.08770675","5":"0.021926686","6":"8.8675881","7":"0.00252109"},{"1":"21","2":"Residuals","3":"10","4":"0.02472678","5":"0.002472678","6":"NA","7":"NA"},{"1":"31","2":"Substrate","3":"4","4":"0.02968592","5":"0.007421480","6":"1.0431216","7":"0.43233940"},{"1":"31","2":"Residuals","3":"10","4":"0.07114684","5":"0.007114684","6":"NA","7":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div><div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["Date"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["term"],"name":[2],"type":["chr"],"align":["left"]},{"label":["comparison"],"name":[3],"type":["chr"],"align":["left"]},{"label":["estimate"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["conf.low"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["conf.high"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["adj.p.value"],"name":[7],"type":["dbl"],"align":["right"]}],"data":[{"1":"3","2":"Substrate","3":"H-F","4":"1.337719e-01","5":"-0.148717160","6":"0.41626095","7":"0.551829253"},{"1":"3","2":"Substrate","3":"SH-F","4":"5.537869e-02","5":"-0.227110365","6":"0.33786774","7":"0.963701237"},{"1":"3","2":"Substrate","3":"SO-F","4":"9.011363e-02","5":"-0.192375421","6":"0.37260269","7":"0.827024139"},{"1":"3","2":"Substrate","3":"T-F","4":"7.214032e-02","5":"-0.210348734","6":"0.35462937","7":"0.911757871"},{"1":"3","2":"Substrate","3":"SH-H","4":"-7.839320e-02","5":"-0.360882258","6":"0.20409585","7":"0.885463597"},{"1":"3","2":"Substrate","3":"SO-H","4":"-4.365826e-02","5":"-0.326147314","6":"0.23883079","7":"0.984564849"},{"1":"3","2":"Substrate","3":"T-H","4":"-6.163157e-02","5":"-0.344120627","6":"0.22085748","7":"0.947508154"},{"1":"3","2":"Substrate","3":"SO-SH","4":"3.473494e-02","5":"-0.247754109","6":"0.31722400","7":"0.993437021"},{"1":"3","2":"Substrate","3":"T-SH","4":"1.676163e-02","5":"-0.265727422","6":"0.29925068","7":"0.999614341"},{"1":"3","2":"Substrate","3":"T-SO","4":"-1.797331e-02","5":"-0.300462366","6":"0.26451574","7":"0.999492023"},{"1":"10","2":"Substrate","3":"H-F","4":"1.103050e-01","5":"-0.211824250","6":"0.43243416","7":"0.789549822"},{"1":"10","2":"Substrate","3":"SH-F","4":"6.808260e-02","5":"-0.254046602","6":"0.39021181","7":"0.952896820"},{"1":"10","2":"Substrate","3":"SO-F","4":"1.380570e-01","5":"-0.184072162","6":"0.46018625","7":"0.635195425"},{"1":"10","2":"Substrate","3":"T-F","4":"6.807936e-02","5":"-0.254049845","6":"0.39020856","7":"0.952904506"},{"1":"10","2":"Substrate","3":"SH-H","4":"-4.222235e-02","5":"-0.364351558","6":"0.27990685","7":"0.991644303"},{"1":"10","2":"Substrate","3":"SO-H","4":"2.775209e-02","5":"-0.294377117","6":"0.34988129","7":"0.998332120"},{"1":"10","2":"Substrate","3":"T-H","4":"-4.222560e-02","5":"-0.364354800","6":"0.27990361","7":"0.991641886"},{"1":"10","2":"Substrate","3":"SO-SH","4":"6.997444e-02","5":"-0.252154764","6":"0.39210365","7":"0.948278976"},{"1":"10","2":"Substrate","3":"T-SH","4":"-3.242208e-06","5":"-0.322132447","6":"0.32212596","7":"1.000000000"},{"1":"10","2":"Substrate","3":"T-SO","4":"-6.997768e-02","5":"-0.392106888","6":"0.25215152","7":"0.948270834"},{"1":"21","2":"Substrate","3":"H-F","4":"-1.129313e-01","5":"-0.246552949","6":"0.02069036","7":"0.109476123"},{"1":"21","2":"Substrate","3":"SH-F","4":"6.236128e-02","5":"-0.071260374","6":"0.19598294","7":"0.564398967"},{"1":"21","2":"Substrate","3":"SO-F","4":"-1.095928e-02","5":"-0.144580935","6":"0.12266238","7":"0.998623342"},{"1":"21","2":"Substrate","3":"T-F","4":"1.141338e-01","5":"-0.019487893","6":"0.24775542","7":"0.104672760"},{"1":"21","2":"Substrate","3":"SH-H","4":"1.752926e-01","5":"0.041670920","6":"0.30891423","7":"0.010327097"},{"1":"21","2":"Substrate","3":"SO-H","4":"1.019720e-01","5":"-0.031649641","6":"0.23559367","7":"0.163641974"},{"1":"21","2":"Substrate","3":"T-H","4":"2.270651e-01","5":"0.093443401","6":"0.36068671","7":"0.001663502"},{"1":"21","2":"Substrate","3":"SO-SH","4":"-7.332056e-02","5":"-0.206942216","6":"0.06030109","7":"0.420956738"},{"1":"21","2":"Substrate","3":"T-SH","4":"5.177248e-02","5":"-0.081849175","6":"0.18539414","7":"0.711040688"},{"1":"21","2":"Substrate","3":"T-SO","4":"1.250930e-01","5":"-0.008528614","6":"0.25871470","7":"0.069223084"},{"1":"31","2":"Substrate","3":"H-F","4":"7.064360e-02","5":"-0.156014322","6":"0.29730152","7":"0.838129840"},{"1":"31","2":"Substrate","3":"SH-F","4":"5.722892e-02","5":"-0.169428996","6":"0.28388684","7":"0.914912366"},{"1":"31","2":"Substrate","3":"SO-F","4":"1.323299e-02","5":"-0.213424933","6":"0.23989090","7":"0.999638229"},{"1":"31","2":"Substrate","3":"T-F","4":"1.249439e-01","5":"-0.101713971","6":"0.35160187","7":"0.416856997"},{"1":"31","2":"Substrate","3":"SH-H","4":"-1.341467e-02","5":"-0.240072592","6":"0.21324324","7":"0.999618200"},{"1":"31","2":"Substrate","3":"SO-H","4":"-5.741061e-02","5":"-0.284068530","6":"0.16924731","7":"0.914041838"},{"1":"31","2":"Substrate","3":"T-H","4":"5.430035e-02","5":"-0.172357568","6":"0.28095827","7":"0.928260465"},{"1":"31","2":"Substrate","3":"SO-SH","4":"-4.399594e-02","5":"-0.270653856","6":"0.18266198","7":"0.964939044"},{"1":"31","2":"Substrate","3":"T-SH","4":"6.771502e-02","5":"-0.158942894","6":"0.29437294","7":"0.856931834"},{"1":"31","2":"Substrate","3":"T-SO","4":"1.117110e-01","5":"-0.114946956","6":"0.33836888","7":"0.516813597"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

Shannon-wiener diveristy averaged across sampling replicates.  Bacterial communities aren't significantly different among substrate type but generally increase from the intial deployment to a maxima around day 10 and then egenrally decline as senescence of the biofilm occurs.

![](NBC_16s_analyses_files/figure-html/Shannon Evenness-1.png)<!-- -->

Pielou's evenness is the standard evenness metric.  It mirrors what we observe in the shannon diversity.

Now that we have these done, let's move on to richness.  Since the species concept doesn't work too well with bacteria (screw you lateral gene transfer).  We will define unqiue otus (operational taxonomic units).  I select only taxa that are present by defniing an observationThreshold.  This could be re-worked to eleimnate singletons for future work.

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["Date"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["term"],"name":[2],"type":["chr"],"align":["left"]},{"label":["df"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["sumsq"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["meansq"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["statistic"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["p.value"],"name":[7],"type":["dbl"],"align":["right"]}],"data":[{"1":"3","2":"Substrate","3":"4","4":"1311.067","5":"327.7667","6":"1.492109","7":"0.27630690"},{"1":"3","2":"Residuals","3":"10","4":"2196.667","5":"219.6667","6":"NA","7":"NA"},{"1":"10","2":"Substrate","3":"4","4":"753.600","5":"188.4000","6":"0.454487","7":"0.76745615"},{"1":"10","2":"Residuals","3":"10","4":"4145.333","5":"414.5333","6":"NA","7":"NA"},{"1":"21","2":"Substrate","3":"4","4":"9868.933","5":"2467.2333","6":"7.382505","7":"0.00490566"},{"1":"21","2":"Residuals","3":"10","4":"3342.000","5":"334.2000","6":"NA","7":"NA"},{"1":"31","2":"Substrate","3":"4","4":"1916.400","5":"479.1000","6":"1.032246","7":"0.43710688"},{"1":"31","2":"Residuals","3":"10","4":"4641.333","5":"464.1333","6":"NA","7":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div><div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["Date"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["term"],"name":[2],"type":["chr"],"align":["left"]},{"label":["comparison"],"name":[3],"type":["chr"],"align":["left"]},{"label":["estimate"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["conf.low"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["conf.high"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["adj.p.value"],"name":[7],"type":["dbl"],"align":["right"]}],"data":[{"1":"3","2":"Substrate","3":"H-F","4":"9.000000","5":"-30.826779","6":"48.82678","7":"0.940900086"},{"1":"3","2":"Substrate","3":"SH-F","4":"-4.000000","5":"-43.826779","6":"35.82678","7":"0.996975789"},{"1":"3","2":"Substrate","3":"SO-F","4":"-10.333333","5":"-50.160112","6":"29.49345","7":"0.907182814"},{"1":"3","2":"Substrate","3":"T-F","4":"16.000000","5":"-23.826779","6":"55.82678","7":"0.684951540"},{"1":"3","2":"Substrate","3":"SH-H","4":"-13.000000","5":"-52.826779","6":"26.82678","7":"0.815470966"},{"1":"3","2":"Substrate","3":"SO-H","4":"-19.333333","5":"-59.160112","6":"20.49345","7":"0.530189601"},{"1":"3","2":"Substrate","3":"T-H","4":"7.000000","5":"-32.826779","6":"46.82678","7":"0.975357691"},{"1":"3","2":"Substrate","3":"SO-SH","4":"-6.333333","5":"-46.160112","6":"33.49345","7":"0.982860458"},{"1":"3","2":"Substrate","3":"T-SH","4":"20.000000","5":"-19.826779","6":"59.82678","7":"0.500215332"},{"1":"3","2":"Substrate","3":"T-SO","4":"26.333333","5":"-13.493445","6":"66.16011","7":"0.262897211"},{"1":"10","2":"Substrate","3":"H-F","4":"4.333333","5":"-50.377437","6":"59.04410","7":"0.998798909"},{"1":"10","2":"Substrate","3":"SH-F","4":"-7.666667","5":"-62.377437","6":"47.04410","7":"0.989264460"},{"1":"10","2":"Substrate","3":"SO-F","4":"8.333333","5":"-46.377437","6":"63.04410","7":"0.985370385"},{"1":"10","2":"Substrate","3":"T-F","4":"13.000000","5":"-41.710770","6":"67.71077","7":"0.930168718"},{"1":"10","2":"Substrate","3":"SH-H","4":"-12.000000","5":"-66.710770","6":"42.71077","7":"0.946554437"},{"1":"10","2":"Substrate","3":"SO-H","4":"4.000000","5":"-50.710770","6":"58.71077","7":"0.999122308"},{"1":"10","2":"Substrate","3":"T-H","4":"8.666667","5":"-46.044104","6":"63.37744","7":"0.983101305"},{"1":"10","2":"Substrate","3":"SO-SH","4":"16.000000","5":"-38.710770","6":"70.71077","7":"0.865722361"},{"1":"10","2":"Substrate","3":"T-SH","4":"20.666667","5":"-34.044104","6":"75.37744","7":"0.728523204"},{"1":"10","2":"Substrate","3":"T-SO","4":"4.666667","5":"-50.044104","6":"59.37744","7":"0.998395716"},{"1":"21","2":"Substrate","3":"H-F","4":"-29.666667","5":"-78.790961","6":"19.45763","7":"0.336953704"},{"1":"21","2":"Substrate","3":"SH-F","4":"4.333333","5":"-44.790961","6":"53.45763","7":"0.998171392"},{"1":"21","2":"Substrate","3":"SO-F","4":"-25.333333","5":"-74.457627","6":"23.79096","7":"0.476508632"},{"1":"21","2":"Substrate","3":"T-F","4":"42.000000","5":"-7.124294","6":"91.12429","7":"0.104246133"},{"1":"21","2":"Substrate","3":"SH-H","4":"34.000000","5":"-15.124294","6":"83.12429","7":"0.228554989"},{"1":"21","2":"Substrate","3":"SO-H","4":"4.333333","5":"-44.790961","6":"53.45763","7":"0.998171392"},{"1":"21","2":"Substrate","3":"T-H","4":"71.666667","5":"22.542373","6":"120.79096","7":"0.005052746"},{"1":"21","2":"Substrate","3":"SO-SH","4":"-29.666667","5":"-78.790961","6":"19.45763","7":"0.336953704"},{"1":"21","2":"Substrate","3":"T-SH","4":"37.666667","5":"-11.457627","6":"86.79096","7":"0.160812959"},{"1":"21","2":"Substrate","3":"T-SO","4":"67.333333","5":"18.209039","6":"116.45763","7":"0.007735791"},{"1":"31","2":"Substrate","3":"H-F","4":"14.000000","5":"-43.891457","6":"71.89146","7":"0.926016773"},{"1":"31","2":"Substrate","3":"SH-F","4":"9.666667","5":"-48.224790","6":"67.55812","7":"0.979521162"},{"1":"31","2":"Substrate","3":"SO-F","4":"2.000000","5":"-55.891457","6":"59.89146","7":"0.999954947"},{"1":"31","2":"Substrate","3":"T-F","4":"31.666667","5":"-26.224790","6":"89.55812","7":"0.423755382"},{"1":"31","2":"Substrate","3":"SH-H","4":"-4.333333","5":"-62.224790","6":"53.55812","7":"0.999037409"},{"1":"31","2":"Substrate","3":"SO-H","4":"-12.000000","5":"-69.891457","6":"45.89146","7":"0.955939732"},{"1":"31","2":"Substrate","3":"T-H","4":"17.666667","5":"-40.224790","6":"75.55812","7":"0.847727589"},{"1":"31","2":"Substrate","3":"SO-SH","4":"-7.666667","5":"-65.558124","6":"50.22479","7":"0.991313531"},{"1":"31","2":"Substrate","3":"T-SH","4":"22.000000","5":"-35.891457","6":"79.89146","7":"0.724445092"},{"1":"31","2":"Substrate","3":"T-SO","4":"29.666667","5":"-28.224790","6":"87.55812","7":"0.482151843"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>![](NBC_16s_analyses_files/figure-html/OTU count (richness)-1.png)<!-- -->

From here on out the taxonomic cutoff set for genus level, can restirct to phylum to match up with stacked bar plots below.  Stacked bar plots kidn fo suck IMHO...but they are a good first cut for finding patterns.


![](NBC_16s_analyses_files/figure-html/Stacked Bar Plots-1.png)<!-- -->![](NBC_16s_analyses_files/figure-html/Stacked Bar Plots-2.png)<!-- -->![](NBC_16s_analyses_files/figure-html/Stacked Bar Plots-3.png)<!-- -->![](NBC_16s_analyses_files/figure-html/Stacked Bar Plots-4.png)<!-- -->

Subset rabund stacked bars by date, four panel plot, each panel is sampling event.  There appear to be shifts in relative abundances over the course of the incubation.  Data aggregated at phylum level to enhance visibility.  Let's convert this concept to heatmaps.



```
## Loading required package: viridis
```

```
## Loading required package: viridisLite
```

```
## 
## Attaching package: 'viridis'
```

```
## The following object is masked from 'package:scales':
## 
##     viridis_pal
```

<img src="NBC_16s_analyses_files/figure-html/heatmap-1.png" style="display: block; margin: auto;" />
Great!  Subsetting tot he level 4 tax, order, makes for a readable plot with meaningful resolution.

Switching gear, lets approach this from a multivariat approach.  Ordination approaches allow us to plot our community data in two dimensions very well.  With the envfit function we can correlate our environmental and laboratory assays with our communities.  The envfit function uses the matix of ordination scores.


```
## Run 0 stress 0.1286809 
## Run 1 stress 0.1493072 
## Run 2 stress 0.1337527 
## Run 3 stress 0.1334914 
## Run 4 stress 0.1371219 
## Run 5 stress 0.1368882 
## Run 6 stress 0.1472792 
## Run 7 stress 0.1356583 
## Run 8 stress 0.1457425 
## Run 9 stress 0.1453024 
## Run 10 stress 0.1550471 
## Run 11 stress 0.1475211 
## Run 12 stress 0.1594613 
## Run 13 stress 0.1407352 
## Run 14 stress 0.1352647 
## Run 15 stress 0.1559212 
## Run 16 stress 0.1480842 
## Run 17 stress 0.1441802 
## Run 18 stress 0.137122 
## Run 19 stress 0.1341736 
## Run 20 stress 0.1350992 
## *** No convergence -- monoMDS stopping criteria:
##     20: stress ratio > sratmax
```

```
## 
## ***VECTORS
## 
##                      NMDS1    NMDS2     r2 Pr(>r)    
## NEP                0.54029  0.84148 0.0711  0.184    
## GPP                0.92981 -0.36804 0.0239  0.572    
## Respiration       -0.07586  0.99712 0.0156  0.686    
## BG-ase             0.95681 -0.29070 0.2032  0.007 ** 
## NAG-ase            0.44166 -0.89718 0.0129  0.763    
## P-ase              0.73396  0.67919 0.1547  0.022 *  
## Chl.a              0.88875  0.45839 0.1269  0.038 *  
## Biomass           -1.00000  0.00099 0.0661  0.197    
## Day of Incubation  0.99996  0.00840 0.5925  0.001 ***
## SRP                0.88170 -0.47181 0.2422  0.001 ***
## NO3                0.85670 -0.51581 0.2552  0.001 ***
## NH4               -0.98468 -0.17436 0.7838  0.001 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## Permutation: free
## Number of permutations: 999
## 
## ***FACTORS:
## 
## Centroids:
##                         NMDS1   NMDS2
## Date_Sampled8/18/2017 -0.1111  0.0005
## Date_Sampled8/29/2017 -0.1259 -0.0131
## Date_Sampled9/15/2017  0.1017 -0.0028
## Date_Sampled9/5/2017   0.1161  0.0452
## SubstrateF            -0.0362 -0.0402
## SubstrateH            -0.0174  0.0127
## SubstrateSh            0.0038 -0.0201
## SubstrateSo            0.0117  0.0267
## SubstrateT            -0.0444  0.0357
## 
## Goodness of fit:
##                  r2 Pr(>r)    
## Date_Sampled 0.6735  0.001 ***
## Substrate    0.0630  0.588    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## Permutation: free
## Number of permutations: 999
## 
## 10 observations deleted due to missingness
```

![](NBC_16s_analyses_files/figure-html/Envfit plots-1.png)<!-- -->![](NBC_16s_analyses_files/figure-html/Envfit plots-2.png)<!-- -->![](NBC_16s_analyses_files/figure-html/Envfit plots-3.png)<!-- -->

```
##   Tukey multiple comparisons of means
##     95% family-wise confidence level
## 
## Fit: aov(formula = distances ~ group, data = df)
## 
## $group
##               diff         lwr        upr     p adj
## H-F   -0.013925930 -0.05927570 0.03142384 0.9080180
## Sh-F  -0.008855650 -0.05420542 0.03649412 0.9814002
## So-F  -0.015855332 -0.06120510 0.02949444 0.8604499
## T-F   -0.027993753 -0.07334352 0.01735602 0.4180865
## Sh-H   0.005070280 -0.04027949 0.05042005 0.9977909
## So-H  -0.001929402 -0.04727917 0.04342037 0.9999517
## T-H   -0.014067823 -0.05941759 0.03128195 0.9048926
## So-Sh -0.006999682 -0.05234945 0.03835009 0.9923248
## T-Sh  -0.019138103 -0.06448787 0.02621167 0.7568962
## T-So  -0.012138421 -0.05748819 0.03321135 0.9422220
```

```
##   Tukey multiple comparisons of means
##     95% family-wise confidence level
## 
## Fit: aov(formula = distances ~ group, data = df)
## 
## $group
##                             diff         lwr        upr     p adj
## 8/29/2017-8/18/2017  0.010105464 -0.02952826 0.04973919 0.9060710
## 9/15/2017-8/18/2017 -0.010509108 -0.05014283 0.02912462 0.8958267
## 9/5/2017-8/18/2017  -0.000514723 -0.04014845 0.03911900 0.9999852
## 9/15/2017-8/29/2017 -0.020614572 -0.06024830 0.01901915 0.5186954
## 9/5/2017-8/29/2017  -0.010620187 -0.05025391 0.02901354 0.8929106
## 9/5/2017-9/15/2017   0.009994385 -0.02963934 0.04962811 0.9087922
```

```
## 
## 	Homogeneity of multivariate dispersions
## 
## Call: betadisper(d = bac.ord.dist, group = bac.ORD$Substrate)
## 
## No. of Positive Eigenvalues: 33
## No. of Negative Eigenvalues: 26
## 
## Average distance to median:
##      F      H     Sh     So      T 
## 0.1642 0.1503 0.1553 0.1483 0.1362 
## 
## Eigenvalues for PCoA axes:
##  PCoA1  PCoA2  PCoA3  PCoA4  PCoA5  PCoA6  PCoA7  PCoA8 
## 0.8110 0.2410 0.1373 0.1058 0.0764 0.0504 0.0341 0.0278
```

```
## 
## 	Homogeneity of multivariate dispersions
## 
## Call: betadisper(d = bac.ord.dist, group = bac.ORD$Date_Sampled)
## 
## No. of Positive Eigenvalues: 33
## No. of Negative Eigenvalues: 26
## 
## Average distance to median:
## 8/18/2017 8/29/2017 9/15/2017  9/5/2017 
##    0.1132    0.1233    0.1027    0.1126 
## 
## Eigenvalues for PCoA axes:
##  PCoA1  PCoA2  PCoA3  PCoA4  PCoA5  PCoA6  PCoA7  PCoA8 
## 0.8110 0.2410 0.1373 0.1058 0.0764 0.0504 0.0341 0.0278
```


Okay.  So, we probably don't have any differences between our groups, but let's find out for certain.  PERMANOVA is the analysis of variance using distance matricies (bray-curtis in our case).  It is non-paramteric and robust.


```
## 
## Call:
## anosim(x = bac.dist, grouping = design.df$Substrate) 
## Dissimilarity: bray 
## 
## ANOSIM statistic R: 0.06058 
##       Significance: 0.048 
## 
## Permutation: free
## Number of permutations: 999
## 
## Upper quantiles of permutations (null model):
##    90%    95%  97.5%    99% 
## 0.0426 0.0603 0.0740 0.0824 
## 
## Dissimilarity ranks between and within classes:
##         0%     25%     50%      75% 100%    N
## Between  1 469.750  884.00 1338.250 1770 1440
## F        8 259.000  998.00 1397.750 1747   66
## H       13 342.625  745.25 1101.000 1643   66
## SH       3 468.000 1070.25 1418.250 1757   66
## SO       4 568.750  999.00 1338.875 1761   66
## T        2 136.000  530.00 1052.625 1586   66
```

```
## 
## Call:
## adonis(formula = anosim.df ~ Substrate * Date, data = design.df) 
## 
## Permutation: free
## Number of permutations: 999
## 
## Terms added sequentially (first to last)
## 
##                Df SumsOfSqs  MeanSqs F.Model      R2 Pr(>F)    
## Substrate       4   0.20619 0.051547  3.0502 0.11023  0.003 ** 
## Date            3   0.80504 0.268347 15.8793 0.43039  0.001 ***
## Substrate:Date 12   0.18332 0.015276  0.9040 0.09800  0.634    
## Residuals      40   0.67597 0.016899         0.36138           
## Total          59   1.87051                  1.00000           
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```
## 
## Call:
## adonis(formula = anosim.3 ~ Substrate, data = design.3) 
## 
## Permutation: free
## Number of permutations: 999
## 
## Terms added sequentially (first to last)
## 
##           Df SumsOfSqs  MeanSqs F.Model      R2 Pr(>F)
## Substrate  4   0.10306 0.025764  1.3418 0.34926  0.176
## Residuals 10   0.19202 0.019202         0.65074       
## Total     14   0.29507                  1.00000
```

```
## 
## Call:
## adonis(formula = anosim.10 ~ Substrate, data = design.10) 
## 
## Permutation: free
## Number of permutations: 999
## 
## Terms added sequentially (first to last)
## 
##           Df SumsOfSqs  MeanSqs F.Model      R2 Pr(>F)
## Substrate  4  0.086894 0.021723  0.9508 0.27553  0.525
## Residuals 10  0.228475 0.022847         0.72447       
## Total     14  0.315369                  1.00000
```

```
## 
## Call:
## adonis(formula = anosim.21 ~ Substrate, data = design.21) 
## 
## Permutation: free
## Number of permutations: 999
## 
## Terms added sequentially (first to last)
## 
##           Df SumsOfSqs  MeanSqs F.Model      R2 Pr(>F)  
## Substrate  4  0.099546 0.024886    1.74 0.41037  0.028 *
## Residuals 10  0.143027 0.014303         0.58963         
## Total     14  0.242573                  1.00000         
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```
## 
## Call:
## adonis(formula = anosim.31 ~ Substrate, data = design.31) 
## 
## Permutation: free
## Number of permutations: 999
## 
## Terms added sequentially (first to last)
## 
##           Df SumsOfSqs  MeanSqs F.Model      R2 Pr(>F)
## Substrate  4  0.068752 0.017188  1.1961 0.32361  0.262
## Residuals 10  0.143699 0.014370         0.67639       
## Total     14  0.212452                  1.00000
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["pairs"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["total.DF"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["F.Model"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["R2"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["p.value"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["p.adjusted"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["sig"],"name":[7],"type":["fctr"],"align":["left"]}],"data":[{"1":"H vs F","2":"5","3":"1.6221336","4":"0.2885263","5":"0.2","6":"1","7":""},{"1":"H vs SH","2":"5","3":"0.5273862","4":"0.1164880","5":"0.7","6":"1","7":""},{"1":"H vs SO","2":"5","3":"1.5680689","4":"0.2816181","5":"0.4","6":"1","7":""},{"1":"H vs T","2":"5","3":"1.0285819","4":"0.2045471","5":"0.3","6":"1","7":""},{"1":"F vs SH","2":"5","3":"1.3065241","4":"0.2462109","5":"0.3","6":"1","7":""},{"1":"F vs SO","2":"5","3":"2.6340961","4":"0.3970543","5":"0.2","6":"1","7":""},{"1":"F vs T","2":"5","3":"1.1767864","4":"0.2273199","5":"0.4","6":"1","7":""},{"1":"SH vs SO","2":"5","3":"0.7793444","4":"0.1630651","5":"0.6","6":"1","7":""},{"1":"SH vs T","2":"5","3":"1.1642252","4":"0.2254404","5":"0.3","6":"1","7":""},{"1":"SO vs T","2":"5","3":"2.7149318","4":"0.4043126","5":"0.1","6":"1","7":""}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```
## 'nperm' >= set of all permutations: complete enumeration.
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["pairs"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["total.DF"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["F.Model"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["R2"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["p.value"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["p.adjusted"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["sig"],"name":[7],"type":["fctr"],"align":["left"]}],"data":[{"1":"H vs F","2":"5","3":"2.0894479","4":"0.34312600","5":"0.1","6":"1","7":""},{"1":"H vs SH","2":"5","3":"0.4824982","4":"0.10764047","5":"0.8","6":"1","7":""},{"1":"H vs SO","2":"5","3":"0.3308787","4":"0.07639990","5":"0.9","6":"1","7":""},{"1":"H vs T","2":"5","3":"1.6442914","4":"0.29131936","5":"0.3","6":"1","7":""},{"1":"F vs SH","2":"5","3":"2.0180908","4":"0.33533738","5":"0.1","6":"1","7":""},{"1":"F vs SO","2":"5","3":"1.2476817","4":"0.23775865","5":"0.4","6":"1","7":""},{"1":"F vs T","2":"5","3":"3.0217906","4":"0.43034473","5":"0.1","6":"1","7":""},{"1":"SH vs SO","2":"5","3":"0.1173955","4":"0.02851209","5":"1.0","6":"1","7":""},{"1":"SH vs T","2":"5","3":"0.8274459","4":"0.17140450","5":"0.6","6":"1","7":""},{"1":"SO vs T","2":"5","3":"0.4553879","4":"0.10221061","5":"1.0","6":"1","7":""}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```
## 'nperm' >= set of all permutations: complete enumeration.
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["pairs"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["total.DF"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["F.Model"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["R2"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["p.value"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["p.adjusted"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["sig"],"name":[7],"type":["fctr"],"align":["left"]}],"data":[{"1":"H vs F","2":"5","3":"0.5489709","4":"0.1206802","5":"0.9","6":"1","7":""},{"1":"H vs SH","2":"5","3":"2.5974906","4":"0.3937089","5":"0.1","6":"1","7":""},{"1":"H vs SO","2":"5","3":"1.4629517","4":"0.2677951","5":"0.2","6":"1","7":""},{"1":"H vs T","2":"5","3":"1.6598703","4":"0.2932700","5":"0.2","6":"1","7":""},{"1":"F vs SH","2":"5","3":"2.6075381","4":"0.3946308","5":"0.1","6":"1","7":""},{"1":"F vs SO","2":"5","3":"1.4920784","4":"0.2716783","5":"0.3","6":"1","7":""},{"1":"F vs T","2":"5","3":"2.0370731","4":"0.3374273","5":"0.1","6":"1","7":""},{"1":"SH vs SO","2":"5","3":"0.8820159","4":"0.1806663","5":"0.5","6":"1","7":""},{"1":"SH vs T","2":"5","3":"2.9809742","4":"0.4270141","5":"0.1","6":"1","7":""},{"1":"SO vs T","2":"5","3":"2.3934103","4":"0.3743558","5":"0.1","6":"1","7":""}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```
## 'nperm' >= set of all permutations: complete enumeration.
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

```
## 'nperm' >= set of all permutations: complete enumeration.
```

```
## Set of permutations < 'minperm'. Generating entire set.
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["pairs"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["total.DF"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["F.Model"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["R2"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["p.value"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["p.adjusted"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["sig"],"name":[7],"type":["fctr"],"align":["left"]}],"data":[{"1":"H vs F","2":"5","3":"0.6945648","4":"0.1479508","5":"0.7","6":"1","7":""},{"1":"H vs SH","2":"5","3":"0.7257774","4":"0.1535784","5":"0.7","6":"1","7":""},{"1":"H vs SO","2":"5","3":"0.6997236","4":"0.1488861","5":"0.7","6":"1","7":""},{"1":"H vs T","2":"5","3":"1.1036630","4":"0.2162492","5":"0.4","6":"1","7":""},{"1":"F vs SH","2":"5","3":"1.6044602","4":"0.2862827","5":"0.2","6":"1","7":""},{"1":"F vs SO","2":"5","3":"1.4991676","4":"0.2726172","5":"0.3","6":"1","7":""},{"1":"F vs T","2":"5","3":"0.8119459","4":"0.1687355","5":"0.5","6":"1","7":""},{"1":"SH vs SO","2":"5","3":"0.8331373","4":"0.1723802","5":"0.7","6":"1","7":""},{"1":"SH vs T","2":"5","3":"2.2003928","4":"0.3548796","5":"0.2","6":"1","7":""},{"1":"SO vs T","2":"5","3":"2.0047770","4":"0.3338637","5":"0.1","6":"1","7":""}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div><div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["pairs"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["total.DF"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["F.Model"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["R2"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["p.value"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["p.adjusted"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["sig"],"name":[7],"type":["fctr"],"align":["left"]}],"data":[{"1":"H vs F","2":"23","3":"1.2182768","4":"0.05247060","5":"0.279","6":"1.00","7":""},{"1":"H vs SH","2":"23","3":"1.3852743","4":"0.05923703","5":"0.219","6":"1.00","7":""},{"1":"H vs SO","2":"23","3":"2.1406965","4":"0.08867584","5":"0.068","6":"0.68","7":""},{"1":"H vs T","2":"23","3":"1.1279672","4":"0.04877070","5":"0.304","6":"1.00","7":""},{"1":"F vs SH","2":"23","3":"1.7241838","4":"0.07267621","5":"0.141","6":"1.00","7":""},{"1":"F vs SO","2":"23","3":"1.8894729","4":"0.07909228","5":"0.099","6":"0.99","7":""},{"1":"F vs T","2":"23","3":"1.4371028","4":"0.06131743","5":"0.207","6":"1.00","7":""},{"1":"SH vs SO","2":"23","3":"0.4457387","4":"0.01985850","5":"0.813","6":"1.00","7":""},{"1":"SH vs T","2":"23","3":"2.6835701","4":"0.10871888","5":"0.037","6":"0.37","7":""},{"1":"SO vs T","2":"23","3":"3.0941972","4":"0.12330329","5":"0.023","6":"0.23","7":""}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

We want to know whether the communities are different  between substrates.  

```r
#extract and shape OTU table at Order level
bacteria.df.venn=subset.data.frame(bacteria.df, taxlevel==4,drop=TRUE)

drops <- c("taxlevel","rankID","daughterlevels","total","SDKC1","SDKC2","SDKC3")
bacteria.df.venn=bacteria.df.venn[ , !(names(bacteria.df.venn) %in% drops)]

bacteria.df.venn=melt(bacteria.df.venn,id.vars="taxon")
bacteria.df.venn=dcast(bacteria.df.venn,variable~bacteria.df.venn$taxon)
#rabund.df$variable=as.numeric(rabund.df$variable)
bacteria.df.venn=separate(bacteria.df.venn,variable,into=c("junk","Date","Substrate"),sep=c(1,7))
bacteria.df.venn=separate(bacteria.df.venn,Substrate,into=c("Substrate","Rep"),sep=c(-1))
bacteria.df.venn$junk=NULL

bacteria.df.venn=droplevels(bacteria.df.venn[-which(bacteria.df.venn$Substrate=='CR'),])
bacteria.df.venn$Date=as.factor(bacteria.df.venn$Date)
bacteria.df.venn$Date=revalue(bacteria.df.venn$Date,c("170818"="3","170828"="10","170905"="21","170915"="31"))

Hard=colnames(bacteria.df.venn[bacteria.df.venn$Substrate=="H",apply(bacteria.df.venn[bacteria.df.venn$Substrate=="H",],MARGIN=2,function(x) any(x>0))])
Hard=Hard[-(1:3)]

Soft=colnames(bacteria.df.venn[bacteria.df.venn$Substrate=="SO",apply(bacteria.df.venn[bacteria.df.venn$Substrate=="SO",],MARGIN=2,function(x) any(x>0))])
Soft=Soft[-(1:3)]

Sheet=colnames(bacteria.df.venn[bacteria.df.venn$Substrate=="SH",apply(bacteria.df.venn[bacteria.df.venn$Substrate=="SH",],MARGIN=2,function(x) any(x>0))])
Sheet=Sheet[-(1:3)]

Foam=colnames(bacteria.df.venn[bacteria.df.venn$Substrate=="F",apply(bacteria.df.venn[bacteria.df.venn$Substrate=="F",],MARGIN=2,function(x) any(x>0))])
Foam=Foam[-(1:3)]

Tile=colnames(bacteria.df.venn[bacteria.df.venn$Substrate=="T",apply(bacteria.df.venn[bacteria.df.venn$Substrate=="T",],MARGIN=2,function(x) any(x>0))])
Tile=Tile[-(1:3)]

comparions=list("Hard"=Hard,"Soft"=Soft,"Sheet"=Sheet,"Foam"=Foam,"Tile"=Tile)
#upset(fromList(comparions),order.by="freq",cutoff = 2)
bac.venn.list=list("Hard"=Hard,"Soft"=Soft,"Sheet"=Sheet,"Foam"=Foam,"Tile"=Tile)
bac.venn=gList(venn.diagram(x=bac.venn.list,filename=NULL,label=TRUE,main="Bacterial Communities",main.fontface = 2,fill=c("yellow","blue","green","red","purple"),
                            cat.cex=0.8,cat.fontface=2,lty=1,main.pos=c(0.15,1),
                            cat.just=list(c(0.6,1) , c(0,0) , c(0,0) , c(1,1) ,c(1,0))))

#group.venn(list("Hard"=Hard,"Soft"=Soft,"Sheet"=Sheet,"Foam"=Foam,"Tile"=Tile),label=TRUE,file="bac.venn",ext="jpeg",)
```

Now for time!

```r
#extract and shape OTU table at Order level
bacteria.df.venn=subset.data.frame(bacteria.df, taxlevel==4,drop=TRUE)

drops <- c("taxlevel","rankID","daughterlevels","total","SDKC1","SDKC2","SDKC3")
bacteria.df.venn=bacteria.df.venn[ , !(names(bacteria.df.venn) %in% drops)]

bacteria.df.venn=melt(bacteria.df.venn,id.vars="taxon")
bacteria.df.venn=dcast(bacteria.df.venn,variable~bacteria.df.venn$taxon)
#rabund.df$variable=as.numeric(rabund.df$variable)
bacteria.df.venn=separate(bacteria.df.venn,variable,into=c("junk","Date","Substrate"),sep=c(1,7))
bacteria.df.venn=separate(bacteria.df.venn,Substrate,into=c("Substrate","Rep"),sep=c(-1))
bacteria.df.venn$junk=NULL

bacteria.df.venn=droplevels(bacteria.df.venn[-which(bacteria.df.venn$Substrate=='CR'),])
bacteria.df.venn$Date=as.factor(bacteria.df.venn$Date)
bacteria.df.venn$Date=revalue(bacteria.df.venn$Date,c("170818"="3","170828"="10","170905"="21","170915"="31"))

Day_3=colnames(bacteria.df.venn[bacteria.df.venn$Date=="3",apply(bacteria.df.venn[bacteria.df.venn$Date=="3",],MARGIN=2,function(x) any(x>0))])

Day_10=colnames(bacteria.df.venn[bacteria.df.venn$Date=="10",apply(bacteria.df.venn[bacteria.df.venn$Date=="10",],MARGIN=2,function(x) any(x>0))])

Day_21=colnames(bacteria.df.venn[bacteria.df.venn$Date=="21",apply(bacteria.df.venn[bacteria.df.venn$Date=="21",],MARGIN=2,function(x) any(x>0))])

Day_31=colnames(bacteria.df.venn[bacteria.df.venn$Date=="31",apply(bacteria.df.venn[bacteria.df.venn$Date=="31",],MARGIN=2,function(x) any(x>0))])

venn(list("Day 3"=Day_3,"Day 10"=Day_10,"Day 21"=Day_21,"Day 31"=Day_31))
```

![](NBC_16s_analyses_files/figure-html/Venn Time-1.png)<!-- -->


Okay, so that's allt he analyses for now.
