# CREATING PUBLICATION REGRESSION TABLES

#Example 1: Reg Table with ONE Model

# save robust standard errors
robust_se_m1 <- as.vector(summary(mod1,robust = T)$coefficients[,"Std. Error"])

# print stargazer output with robust standard errors
stargazer(mod1,type = "text",se = list(robust_se_m1), out="lectures/lecture11/regtable1.txt") #text
stargazer(mod1,type = "html",se = list(robust_se_m1), out="lectures/lecture11/regtable1.html") # copy and paste HTML for word

# Example 2: Reg Model with multiple models

#run the second model with covariates
mod2 <- lm(math_scr ~ str + el_pct + avginc + expn_stu, data=caschool)
summary(mod2, robust= T)

# save robust standard errors
robust_se_m2 <- as.vector(summary(mod2,robust = T)$coefficients[,"Std. Error"])

# print stargazer output with both models + robust standard errors
stargazer(mod1, mod2, se=list(robust_se_m1, robust_se_m2), title="Table 1: OLS Regression Results", dep.var.labels=c("Math Score","Math Score"),
          covariate.labels=c("Student-Teacher Ratio","% ELL",
                             "District Income","Expenditures Per Student"),
          omit.stat=c("f"),
          column.labels=c("Model 1: Simple","Model 2: Multivariate"), align=TRUE, type="html", out="lectures/lecture11/regtable2.html")



