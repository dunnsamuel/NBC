####Data import####

cv.data=read.csv("compiled_cv.csv")
metabolism.data=read.csv("compiled metabolism_longform.csv")
chl.data=read.csv("compiled_chl.csv")
field.data=read.csv("fielddata.csv")
eea.df=read.csv("Compiled_EEA.csv")
###reformat dates####
metabolism.data$Date.Sampled=strptime(as.character(metabolism.data$Date.Sampled),"%m/%d/%Y")
metabolism.data$Date.Sampled=format(metabolism.data$Date.Sampled, "%m/%d/%y")
eea.df$Date.Sampled=strptime(as.character(eea.df$Date.Sampled),"%m/%d/%Y")
eea.df$Date.Sampled=format(eea.df$Date.Sampled, "%m/%d/%y")
cv.data$Date.Sampled=strptime(as.character(cv.data$Date.Sampled),"%m/%d/%Y")
cv.data$Date.Sampled=format(cv.data$Date.Sampled, "%m/%d/%y")
metabolism.data$time=metabolism.data$doy-227
metabolism.data$id=seq(1:15)
eea.df$time=metabolism.data$time
cv.data$time=metabolism.data$time
combo.df=cbind(metabolism.data,eea.df[,7:12])
chl.data=droplevels(chl.data[-which(chl.data$Sample=='Cr'),])
chl.data$time=metabolism.data$time

####Data cleaning-Metabolism####
metabolism.data$GPP<-ifelse(metabolism.data$GPP<0,0.000001,metabolism.data$GPP)
metabolism.data$Resp<-ifelse(metabolism.data$Resp>0,0.000001,metabolism.data$Resp)
pc.df=cbind(metabolism.data[1],metabolism.data[3],metabolism.data[5:7],eea.df[8],eea.df[10],eea.df[12])
cv.data$OD_cm=cv.data$OD/cv.data$area
cv.resp.df=cbind(cv.data,metabolism.data[,5:7])
chl.data$chla_cm=286*(((abs(chl.data$X665B)-abs(chl.data$X750B))-(abs(chl.data$X665A)-abs(chl.data$X750A))*5)/chl.data$area)
chl.data$chl_abs=abs(chl.data$chla_cm)




####Remove outliers####
outlierKD <- function(dt, var) {
  var_name <- eval(substitute(var),eval(dt))
  na1 <- sum(is.na(var_name))
  m1 <- mean(var_name, na.rm = T)
  par(mfrow=c(2, 2), oma=c(0,0,3,0))
  boxplot(var_name, main="With outliers")
  hist(var_name, main="With outliers", xlab=NA, ylab=NA)
  outlier <- boxplot.stats(var_name)$out
  mo <- mean(outlier)
  var_name <- ifelse(var_name %in% outlier, NA, var_name)
  boxplot(var_name, main="Without outliers")
  hist(var_name, main="Without outliers", xlab=NA, ylab=NA)
  title("Outlier Check", outer=TRUE)
  na2 <- sum(is.na(var_name))
  cat("Outliers identified:", na2 - na1, "n")
  cat("Propotion (%) of outliers:", round((na2 - na1) / sum(!is.na(var_name))*100, 1), "n")
  cat("Mean of the outliers:", round(mo, 2), "n")
  m2 <- mean(var_name, na.rm = T)
  cat("Mean without removing outliers:", round(m1, 2), "n")
  cat("Mean if we remove outliers:", round(m2, 2), "n")
  response <- readline(prompt="Do you want to remove outliers and to replace with NA? [yes/no]: ")
  if(response == "y" | response == "yes"){
    dt[as.character(substitute(var))] <- invisible(var_name)
    assign(as.character(as.list(match.call())$dt), dt, envir = .GlobalEnv)
    cat("Outliers successfully removed", "n")
    return(invisible(dt))
  } else{
    cat("Nothing changed", "n")
    return(invisible(var_name))
  }
}

outlierKD(metabolism.data,Resp)
outlierKD(metabolism.data,GPP)
outlierKD(metabolism.data,NEP)
outlierKD(eea.df,BGT2)
outlierKD(eea.df,NAGT2)
outlierKD(eea.df,PT2)
outlierKD(cv.data,OD_cm)

#rename substrates
metabolism.data$Sample=factor(metabolism.data$Sample,levels=c("H","So","Sh","F","T"),labels=c("PVC","Soft PE","Sheet PE","PS","Tile"))
eea.df$Sample=factor(eea.df$Sample,levels=c("H","So","Sh","F","T"),labels=c("PVC","Soft PE","Sheet PE","PS","Tile"))
cv.data$Substrate=factor(cv.data$Substrate,levels=c("H","So","Sh","F","T"),labels=c("PVC","Soft PE","Sheet PE","PS","Tile"))
chl.data$Sample=factor(chl.data$Sample,levels=c("H","So","Sh","F","T"),labels=c("PVC","Soft PE","Sheet PE","PS","Tile"))




###Time Series rmANOVAS####
  ####two-way anovas, no error terms####
require(nlme)
require(multcomp)
require(knitr)

    ####Resp####
resp.aov=aov(Resp~(Sample*Date.Sampled),metabolism.data)
resp.sum=summary(resp.aov)
tuk.resp.sample=TukeyHSD(resp.aov,"Sample")
tuk.resp.date=TukeyHSD(resp.aov,"Date.Sampled")
par(mfrow=c(2,2))
plot(resp.aov)#> in residual plot, falls of 0 9due to negative values)45,1110,1218 are outliers to be removed
resp.results=list(resp.sum,tuk.resp.sample,tuk.resp.date)
capture.output(resp.results,file="resp.twoway.doc")

    ####GPP####
GPP.aov=aov(GPP~Sample*Date.Sampled,metabolism.data)
gpp.sum=summary(GPP.aov)
tuk.gpp.sample=TukeyHSD(GPP.aov,"Sample")
tuk.gpp.date=TukeyHSD(GPP.aov,"Date.Sampled")
par(mfrow=c(2,2))
plot(GPP.aov)#< in residual plot, centered on zero
gpp.results=list(gpp.sum,tuk.gpp.sample,tuk.gpp.date)
capture.output(gpp.results,file="gpp.twoway.doc")

    ####NEP####
NEP.aov=aov(NEP~Sample*Date.Sampled,metabolism.data)
nep.sum=summary(NEP.aov)
tuk.nep.sample=TukeyHSD(NEP.aov,"Sample")
tuk.nep.date=TukeyHSD(NEP.aov,"Date.Sampled")
par(mfrow=c(2,2))
plot(NEP.aov) #no problem
nep.results=list(nep.sum,tuk.nep.sample,tuk.nep.date)
capture.output(nep.results,file="nep.twoway.doc")

####2-way RM anova via LME model approach#####
library(pander)
library(xtable)
panderOptions('digits',4)
panderOptions('round',4)
panderOptions('keep.trailing.zeros',TRUE)
#Resp
lme.resp=anova(lme(Resp~Date.Sampled*Sample,random=list(id=pdBlocked(list(~1,pdIdent(~Sample-1),pdIdent(~Date.Sampled-1)))),method="ML",na.action=na.omit,data=metabolism.data))
lme.resp
print(xtable(lme.resp))
#summary(lme.resp)

#GPP
lme.gpp=anova(lme(GPP~Date.Sampled*Sample,random=list(id=pdBlocked(list(~1,pdIdent(~Sample-1),pdIdent(~Date.Sampled-1)))),method="ML",na.action=na.omit,data=metabolism.data))
lme.gpp

#NEP
lme.nep=anova(lme(NEP~Date.Sampled*Sample,random=list(id=pdBlocked(list(~1,pdIdent(~Sample-1),pdIdent(~Date.Sampled-1)))),method="ML",na.action=na.omit,data=metabolism.data))
lme.nep

###one way anovas by factor level Time####
r.o=lapply(split(x=metabolism.data,f=metabolism.data$Date.Sampled),aov,formula=Resp~Sample)
r.o.sum=lapply(r.o,summary)
g.o=lapply(split(x=metabolism.data,f=metabolism.data$Date.Sampled),aov,formula=GPP~Sample)
g.o.sum=lapply(g.o,summary)
n.o=lapply(split(x=metabolism.data,f=metabolism.data$Date.Sampled),aov,formula=NEP~Sample)
n.o.sum=lapply(n.o,summary)
oneway.time=list(r.o.sum,g.o.sum,n.o.sum)
capture.output(oneway.time,file="oneway.time.doc")

####Tukey for loop, TUKEY HSD on date by date basis####
require(multcomp)
  ####Resp####
dates.resp=lapply(levels(metabolism.data$Date.Sampled), function(i){
  dat=metabolism.data[metabolism.data$Date.Sampled==i,] #subset for date i
  part1<-with(dat, aov(Resp~Sample))
  print(part1)
  list(
    part1=part1,
    part2=TukeyHSD(x=part1,which="Sample", conf.level=0.95)
  )
})
names(dates.resp)<-levels(metabolism.data$Date.Sampled)
dates.resp
capture.output(dates.resp,file="tuk.resp.bydate.doc")
  ####NEP####
dates.nep=lapply(levels(metabolism.data$Date.Sampled), function(i){
  dat=metabolism.data[metabolism.data$Date.Sampled==i,] #subset for date i
  part1<-with(dat, aov(NEP~Sample))
  print(part1)
  list(
    part1=part1,
    part2=TukeyHSD(x=part1,which="Sample", conf.level=0.95)
  )
})
names(dates.nep)<-levels(metabolism.data$Date.Sampled)
dates.nep
capture.output(dates.nep,file="tuk.nep.bydate.doc")
  ####GPP####

dates.gpp=lapply(levels(metabolism.data$Date.Sampled), function(i){
  dat=metabolism.data[metabolism.data$Date.Sampled==i,] #subset for date i
  part1<-with(dat, aov(GPP~Sample))
  print(part1)
  list(
    part1=part1,
    part2=TukeyHSD(x=part1,which="Sample", conf.level=0.95)
  )
})
names(dates.gpp)<-levels(metabolism.data$Date.Sampled)
dates.gpp
capture.output(dates.gpp,file="tuk.gpp.bydate.doc")
####metabolism first cut####
library(ggplot2)
library(gridExtra)

tabletheme <- gridExtra::ttheme_default(
  core = list(fg_params=list(cex = 0.5)),
  colhead = list(fg_params=list(cex = .5)),
  rowhead = list(fg_params=list(cex = .5)))


library(pander)
panderOptions('digits',4)
panderOptions('round',4)
panderOptions('keep.trailing.zeros',TRUE)

raw.plot.g=ggplot(data=metabolism.data,aes(x=time,y=GPP,color=Sample,group=Sample))+geom_point()
raw.plot.g+geom_smooth(inherit.aes=TRUE)+
  theme(panel.background=element_blank())+
  ylab(bquote('GPP (mg'~cm^-2~h^-1~')'))+xlab("Days of Incubation")+
  theme(axis.line.x = element_line(color="black"),axis.line.y = element_line(color="black"))+
  annotation_custom(tableGrob(round(as.matrix(lme.gpp),digits=4),theme=tabletheme),xmin=0,xmax=20,ymin=0.75)
#ggsave("GPP.jpeg",device="jpeg", width=6.5,height=6.2, units="in")


raw.plot.r=ggplot(data=metabolism.data,aes(x=time,y=Resp,color=Sample,group=Sample))+geom_point()
raw.plot.r+geom_smooth(inherit.aes=TRUE)+
  theme(panel.background=element_blank())+
  ylab(bquote('Respiration ('*mu~'g'~cm^-2~h^-1~')'))+xlab("Day of Incubation")+
  theme(axis.line.x = element_line(color="black"),axis.line.y = element_line(color="black"))+
  annotation_custom(tableGrob(round(as.matrix(lme.resp),digits=4),theme=tabletheme),xmin=0,xmax=20,ymax=-0.8)
#ggsave("Resp.jpeg",device="jpeg", width=6.5,height=6.2, units="in")

raw.plot.n=ggplot(data=metabolism.data,aes(x=time,y=NEP,group=Sample,color=Sample))+geom_point()
raw.plot.n+geom_smooth(inherit.aes=TRUE)+
  theme(panel.background=element_blank())+
  geom_hline(yintercept=0)+
  ylab(bquote('NEP ('*mu~'g'~cm^-2~h^-1~')'))+xlab("Day of Incubation")+
  theme(axis.line.x = element_line(color="black"),axis.line.y = element_line(color="black"))+
  annotation_custom(tableGrob(round(as.matrix(lme.nep),digits=4),theme=tabletheme),xmin=20,xmax=30,ymax=-0.6)

#ggsave("NEP.jpeg",device="jpeg", width=6.5,height=6.2, units="in")

####crystal violet first cut####
library(ggplot2)
cv.data=na.omit(cv.data)
cv.sum=summarySE(cv.data,measurevar="OD_cm",groupvars=c("time","Substrate"))
substrate.plot.cv=ggplot(cv.sum,aes(time,group=Substrate,na.rm=T))+
  geom_point(aes(y=OD_cm, fill=Substrate),stat="identity",color="black",size=3,pch=21)+
  geom_line(aes(y=OD_cm, color=Substrate),width=.5)+
  theme_classic()+
  geom_hline(yintercept=0)+
  geom_errorbar(aes(ymin=OD_cm-se,ymax=OD_cm+se,fill=Substrate,color=Substrate),
                stat="identity",width=.15,na.rm=T)+
  ylab(bquote('Optical Density  ('~cm^-2~')'))+
  theme(panel.background=element_blank())+xlab("Days of Incubation")
substrate.plot.cv

####chla first cut####
require(ggplot2)
require(gridExtra)
require(ggpubr)
#chl.data$chla_abs=abs(chl.data$chla_cm)
chl.data=na.omit(chl.data)
chl.sum=summarySE(chl.data,measurevar="chl_abs",groupvars=c("time","Sample"))
raw.plot.chlv=ggplot(chl.sum,aes(time,group=Sample,na.rm=T))+
  geom_point(aes(y=chl_abs, fill=Sample),stat="identity",color="black",size=3,pch=21)+
  geom_line(aes(y=chl_abs, color=Sample),width=.5)+theme_classic()+
  geom_errorbar(aes(ymin=chl_abs-se,ymax=chl_abs+se,fill=Sample,color=Sample),
                stat="identity",width=.15,na.rm=T)+
  ylab(bquote('Chlorohyll-a ( '*mu~'g'~cm^-2~')'))+xlab("Days of Incubation")+
  theme(axis.line.x = element_line(color="black"),axis.line.y = element_line(color="black"))+
  scale_y_continuous(breaks=c(0,1,2,3))
raw.plot.chlv
#ggsave("chl.jpeg",device="jpeg", width=6.5,height=6.2, units="in")
ggsave(ggarrange(substrate.plot.cv+theme(axis.text.x=element_blank(),axis.line.x=element_blank(),axis.ticks.x=element_blank(),axis.title.x = element_blank()),
          raw.plot.chlv+theme(axis.text.x=element_text(angle=35,hjust=1)),common.legend = T,nrow=2,legend="right",align="v"),
       device="jpeg",file="cv_od.jpeg",width=6.5,height=6.2, units="in")

####Tukey plots####
  ####split df by date####
metabolism.data$dates=as.Date(metabolism.data$Date.Sampled, "%m/%d/%Y")
metabolism.data$dates=as.factor(metabolism.data$Date.Sampled)
metabolism.data$Date.Sampled2=as.character(metabolism.data$Date.Sampled)
list.df<-split(metabolism.data, metabolism.data$dates)
list2env(list.df,envir=.GlobalEnv)

#for(i in 1:length(list.df)){
#  assign(new.names[i],list.df[i])
#}
####ADDD IN SIG LETTERS?####
  #####plots####
require(ggplot2)
tukey.plots.gpp<-function(metabolism.data,na.rm=TRUE,...){
  dates_list=unique(metabolism.data$dates)
  for (i in seq_along(dates_list)){
    plot<-ggplot(metabolism.data[metabolism.data$dates==levels(metabolism.data$dates)[i],],
                    aes(x=Sample,y=GPP,color=Sample))+geom_boxplot()+ggtitle(paste(dates_list[i]))
    print(plot)
  }
}

tukey.plots.gpp(metabolism.data)


tukey.plots.nep<-function(metabolism.data,na.rm=TRUE,...){
  dates_list=unique(metabolism.data$dates)
  for (i in seq_along(dates_list)){
    plot<-ggplot(metabolism.data[metabolism.data$dates==levels(metabolism.data$dates)[i],],
                 aes(x=Sample,y=NEP,color=Sample))+geom_boxplot()+ggtitle(paste(dates_list[i]))
    print(plot)
  }
}

tukey.plots.nep(metabolism.data)

tukey.plots.Resp<-function(metabolism.data,na.rm=TRUE,...){
  dates_list=unique(metabolism.data$dates)
  for (i in seq_along(dates_list)){
    plot<-ggplot(metabolism.data[metabolism.data$dates==levels(metabolism.data$dates)[i],],
                 aes(x=Sample,y=Resp,color=Sample))+geom_boxplot()+ggtitle(paste(dates_list[i]))
    print(plot)
  }
}

tukey.plots.Resp(metabolism.data)


####data export#### 

#wide.data=reshape(metabolism.data,timevar="time",direction="wide")
#write.csv(wide.data,"exportfortim.csv")


####EEA ####
require(ggplot2)
require(ggpubr)
eea.df$dBG=eea.df$BGT2-eea.df$BGT1
eea.df$dNAG=eea.df$NAGT2-eea.df$NAGT1
eea.df$dP=eea.df$PT2-eea.df$PT1
eea.df=na.omit(eea.df)
eea.df=droplevels(eea.df[-which(eea.df$Date.Sampled=='09/05/17'),])  ####PLATE DROPPED THIS DATE!!!!!!!


bg.sum=summarySE(eea.df,measurevar="BGT2",groupvars=c("time","Sample"))
nag.sum=summarySE(eea.df,measurevar="NAGT2",groupvars=c("time","Sample"))
p.sum=summarySE(eea.df,measurevar="PT2",groupvars=c("time","Sample"))

exp.plot.bg=ggplot(bg.sum,aes(time,group=Sample,na.rm=T))+
  geom_point(aes(y=BGT2, fill=Sample),stat="identity",color="black",size=3,pch=21)+
  geom_line(aes(y=BGT2, color=Sample),width=.5)+
  geom_hline(yintercept=0)+theme_classic()+
  geom_errorbar(aes(ymin=BGT2-se,ymax=BGT2+se,fill=Sample,color=Sample),
                stat="identity",width=.15,na.rm=T)+
  ylab(bquote(atop(beta~'glucosidase', 
                   '( '*mu~'g'~cm^-2~h^-1~')')))#+scale_y_continuous(limits=c(0,250))
exp.plot.bg
#ggsave("bgt2.jpeg",device="jpeg", width=6.5,height=6.2, units="in")

exp.plot.nag=ggplot(nag.sum,aes(time,group=Sample,na.rm=T))+
  geom_point(aes(y=NAGT2, fill=Sample),stat="identity",color="black",size=3,pch=21)+
  geom_line(aes(y=NAGT2, color=Sample),width=.5)+
  geom_hline(yintercept=0)+theme_classic()+
  geom_errorbar(aes(ymin=NAGT2-se,ymax=NAGT2+se,fill=Sample,color=Sample),
                stat="identity",width=.15,na.rm=T)+
  ylab(bquote(atop('N-acetyl- '*beta~'-D glucosaminidase', '( '*mu~'g'~cm^-2~h^-1~')')))#+scale_y_continuous(limits=c(0,250))
exp.plot.nag
#ggsave("nagt2.jpeg",device="jpeg", width=6.5,height=6.2, units="in")


exp.plot.p=ggplot(p.sum,aes(time,group=Sample,na.rm=T))+
  geom_point(aes(y=PT2, fill=Sample),stat="identity",color="black",size=3,pch=21)+
  geom_line(aes(y=PT2, color=Sample),width=.5)+
  theme_classic()+
  geom_errorbar(aes(ymin=PT2-se,ymax=PT2+se,fill=Sample,color=Sample),
                stat="identity",width=.15,na.rm=T)+
  ylab(bquote(atop('Phosphatase', '( '*mu~'g'~cm^-2~h^-1~')')))+xlab("Date")+scale_y_continuous(limits=c(0,200))+scale_x_continuous(breaks=seq(0,30,5))+
  xlab("Days of Incubation")
exp.plot.p
#ggsave("pt2.jpeg",device="jpeg", width=6.5,height=6.2, units="in")

ggarrange(exp.plot.bg+theme(legend.position = "none",axis.line.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank(),axis.title.x = element_blank()),
          exp.plot.nag+theme(legend.position = "none",axis.line.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank(),axis.title.x = element_blank()),
          exp.plot.p+theme(legend.position = "none"),nrow=3,align="v",common.legend = TRUE,legend="right",heights=c(1,1,1.5))
ggsave("eea_compiled.jpeg",device="jpeg", width=6.5,height=8.2, units="in")
cols=c(13,15,17)
iv.string=names(combo.df)[cols]
####Enz-metabolism regression plots####
#require(ggpmisc)
#reg.plots<-function(combo.df,na.rm=TRUE,...){
  sample_list=unique(combo.df$Sample)
  rv.string=names(combo.df)[5:7]
  cols=c(11,13,15)
  iv.string=names(combo.df)[cols]
  plots=list()
  #mypath <- file.path(paste("myplot_",names[i],names[j],names[k], ".jpg", sep = ""))
  
  for (i in seq_along(sample_list)){
    for(j in rv.string){
      for(k in iv.string){
    
    plots<-ggplot(combo.df[combo.df$Sample==levels(combo.df$Sample)[i],],
                 aes_string(x=k,y=j))+
      geom_point(aes(colour=Date.Sampled))+
      geom_smooth(inherit.aes = TRUE, method="lm")+
      ggtitle(paste(sample_list[i]))+
      stat_poly_eq(formula=y~x,aes(label=paste(..eq.label..,..rr.label..,sep="~~~")),parse=TRUE)+
      stat_fit_glance(method='lm',method.args=list(formula=y~x),geom='text',aes(label=paste("P-value = ",signif(..p.value..,digits=4),sep="")),label.x.npc = 'right', label.y.npc = 0.35, size = 3)
      png(paste(i,j,k,".png",sep=""),width=600, height=500,res=120,units="px")
      print(plots)
      dev.off()
      }
    }
  }
}

#reg.plots(combo.df)



####PCA####
library(devtools)
install_github("ggbiplot", "vqv")
require(ggbiplot)
library(pander)
panderOptions('digits',4)
panderOptions('round',4)
panderOptions('keep.trailing.zeros',TRUE)
cols=c(13,15,17)
iv.string=names(combo.df)[cols]
pc.df=cbind(metabolism.data[1],metabolism.data[3],metabolism.data[5:7],eea.df[8],eea.df[10],eea.df[12],chl.data[11],cv.data[7])
pc.df=na.omit(pc.df)


pca=prcomp(~Resp+GPP+NEP+BGT2+NAGT2+PT2+chl_abs+OD_cm,data=pc.df,scale=TRUE,center=T)

summary(pca)
capture.output(pca$sdev^2,file="eigenvalues.doc") #eigenvalues  #retain 1 and 2 by kaiser criterios
predict(pca,newdata=tail(pc.df,2))
pca.group=pc.df[2]
pca.group2=pc.df[1]
print(pca)
plot(pca,type="l")

p=ggbiplot(pca,obs.scale=1,
           var.scale=1,
           groups=pca.group2$Date.Sampled,ellipse=TRUE,
           circle=FALSE)
p=p+geom_point(aes(shape=pca.group2$Date.Sampled),name="Date Sampled")+
  scale_shape_manual(name="Date Sampled",values=c(1:10),position="right")+
  scale_x_continuous(breaks = seq(-3.5,7.5,1.5))+scale_color_brewer(palette = "Greys",guide=F)

#ggsave("pca.date.jpeg",device="jpeg", width=6.5,height=6.2, units="in")


q=ggbiplot(pca,obs.scale=1,
           var.scale=1,
           groups=pca.group$Sample,ellipse=TRUE,circle=FALSE)
q=q+geom_point(aes(shape=pca.group2$Date.Sampled),name="Material")+
  scale_shape_manual(values=1:nlevels(factor(pca.group2$Date.Sampled)),guide=F)+
  scale_x_continuous(breaks = seq(-3.5,7.5,1.5))
#ggsave("pca.sample.jpeg",device="jpeg", width=6.5,height=6.2, units="in")

ggarrange(p,q,align="v",nrow=2)
ggsave("compiledpca.jpeg",device="jpeg", width=6.5,height=8.2, units="in")
#####STacked bar plots####
require(reshape)
require(dplyr)#,position=position_dodge(.9)
require(Rmisc)
require(ggplot2)
require(multcompView)
require(cowplot)
require(gridExtra)
require(ggpubr)



metabolism.data$GPP_OD=metabolism.data$GPP/cv.data$OD_cm
metabolism.data$NEP_OD=metabolism.data$NEP/cv.data$OD_cm
metabolism.data$Resp_OD=metabolism.data$Resp/cv.data$OD_cm

bar.df=melt(metabolism.data,id.vars=c("time","Sample"),measure.vars = c("GPP","Resp","NEP","GPP_OD","NEP_OD","Resp_OD"),na.rm=TRUE)
head(bar.df)
bar.sum=summarySE(bar.df,measurevar="value",groupvars = c("time","variable","Sample"),na.rm=TRUE)
resp.gpp.bar.plot=ggplot(bar.sum,aes(time,group=Sample,shape=variable,fill=Sample))+
  geom_point(data=subset(bar.sum,variable=="GPP"), aes(y=value, fill=Sample),stat="identity",color="black",size=3,pch=21)+
  geom_point(data=subset(bar.sum,variable=="Resp"),aes(y=value,fill=Sample),stat="identity",color="black",size=3,pch=21)+
  scale_shape_manual(values=c('#E69F00','#56B4E9'))+
  geom_line(data=subset(bar.sum,variable=="GPP"), aes(y=value, color=Sample),width=.5)+
  geom_line(data=subset(bar.sum,variable=="Resp"), aes(y=value, color=Sample),width=.5)+
  geom_hline(yintercept=0)+theme_classic()+
  geom_errorbar(data=subset(bar.sum,variable=="GPP"),aes(ymin=value-se,ymax=value+se,fill=Sample,color=Sample),stat="identity",width=.15,na.rm=T)+
  geom_errorbar(data=subset(bar.sum,variable=="Resp"),aes(ymin=value-se,ymax=value+se,fill=Sample,color=Sample),stat="identity",width=.15,na.rm=T)+
  theme(axis.text.x=element_text(angle=45,hjust=1))+
  scale_y_continuous(limits=c(-1.15,1.15))+scale_x_continuous(breaks=seq(0,30,5))+
  ylab(bquote('mg O'*2~''~cm^-2~''~hr^-1))+xlab(NULL)+annotate("text",x=0,y=1, label="GPP",hjust=0)+annotate("text",x=0,y=-1,label="Respiration",hjust=0)


nep.bar.plot=ggplot(bar.sum,aes(time,group=Sample,shape=variable))+
  geom_point(data=subset(bar.sum,variable=="NEP"),aes(y=value, fill=Sample),stat="identity",color="black",size=3,pch=21)+
  geom_line(data=subset(bar.sum,variable=="NEP"), aes(y=value, color=Sample),width=.5)+
  geom_hline(yintercept=0)+theme_classic()+
  geom_errorbar(data=subset(bar.sum,variable=="NEP"),
                aes(ymin=value-se,ymax=value+se,fill=Sample,color=Sample),
                stat="identity",width=.15,na.rm=T)+
  scale_y_continuous(limits=c(-1.15,1.15))+scale_x_continuous(breaks=seq(0,30,5))+
  ylab(bquote('mg O'*2~''~cm^-2~''~hr^-1))+xlab("Days of Incubation")+annotate("text",x=0,y=1, label="NEP",hjust=0)



ggarrange(resp.gpp.bar.plot+theme(legend.position = "none",axis.line.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank()),nep.bar.plot+theme(legend.position = "none"),nrow=2,common.legend = TRUE,legend="bottom")
ggsave("met.plot.jpeg",device="jpeg", width=6.5,height=6.2, units="in")


###Tables####

