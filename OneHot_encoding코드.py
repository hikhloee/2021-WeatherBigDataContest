X_train=data1.iloc[:,]
X_test=val1.iloc[:,]

X=pd.concat([X_train,X_test])
X=pd.get_dummies(X,columns=['month', 'season','mode_PRRCK_LARG', 'mode_PRRCK_MDDL','mode_CLZN', 'mode_TRGRP', 'mode_SLDPT_TPCD',
       'mode_FRTP_CD', 'mode_KOFTR_GROU', 'mode_LDMARK_STN'])

X_train=X[:487261]
X_test=X[487261:]

