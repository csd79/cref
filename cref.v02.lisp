(defparameter *illetmeny*
  '(
    (:havi-ill-gyakornok "Havi illetmény - Gyakornok"
     (:puetv
      (:par
       ("98."
        (:bek "(2)"))))
     (:puetv-vhr
      (:par
       ("88."
        (:bek "(1)")))))

    (:havi-ill-ped1-kutato "Havi illetmény - Pedagógus I. - Kutatótanár"
     (:puetv
      (:par
       ("98."
        (:bek "(2)"))))
     (:puetv-vhr
      (:par
       ("88/A."
        (:bek "(1)")))))

    (:mesterfok-illnov "Mesterfokozatért járó illetménynövekedés"
     (:puetv-vhr
      (:par
       ("95/A."
        (:bek "(1)")))))

    (:egyes-tantrgy-illnov "Egyes tantárgyak után járó illetménynövekedés"
     (:puetv
      (:par
       ("95/A."
        (:bek "(2)")
        (:bek "(4)")))))

    (:eselyteremt-illresz-terulet "Területi alapon járó esélyteremtési illetményrész"
     (:puetv
      (:par
       ("98."
        (:bek
         ("(5)"
          (:pont "a)"))))))
     (:puetv-vhr
      (:par
       ("88."
        (:bek "(3)")
        (:bek "(4)")
        (:bek "(6)")))
      (:par
       ("131."
        (:bek "(4)")))))

    (:eselyteremt-illresz-feladat "Feladatalapon járó esélyteremtési illetményrész"
     (:puetv
      (:par
       ("98."
        (:bek
         ("(5)"
          (:pont "b)"))))))
     (:puetv-vhr
      (:par
       ("88."
        (:bek "(4)-(6)")))
      (:par
       ("131."
        (:bek "(4)")))))

    (:gyogyped-potl "Gyógypedagógiai pótlék"
     (:puetv
      (:par
       ("103."
        (:bek "(1)")))
      (:mell
       ("3."
        (:pont "B)"))))
     (:puetv-vhr
      (:par
       ("90."
        (:bek "(3)")
        (:bek "(4a)")))))

    (:diabetesz-ellat "Diabétesz ellátási pótlék"
     (:puetv
      (:par
       ("103."
        (:bek "(1)")))
      (:mell
       ("3."
        (:pont "B)"))))
     (:puetv-vhr
      (:par
       ("90."
        (:bek "(4)"))))
     (:koznev-2011-cxc
      (:par
       ("62."
        (:bek "(1b)")))))

    (:nemzetisegi-potl "Nemzetiségi pótlék"
     (:puetv
      (:par
       ("103."
        (:bek "(1)")))
      (:mell
       ("3."
        (:pont "B)"))))
     (:puetv-vhr
      (:par
       ("90."
        (:bek "(2)")
        (:bek "(4a)")))))

    (:aj-thgond-prg "Arany János Tehetséggondozó Program pótléka"
     (:puetv-vhr
      (:par
       ("90."
        (:bek "(7)"))))
     (:emmi-20-2012-viii31
      (:par
       ("176."
        (:bek "(8)")))))

    (:ofo-megbiz "Osztályfõnöki megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek
         ("(3)"
          (:pont "b)"))))))
     (:puetv-vhr
      (:par
       ("90."
        (:bek "(6)")
        (:bek "(6a)")))))

    (:koll-csopvez "Kollégiumi csoportvezetõi megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek
         ("(3)"
          (:pont "b)"))))))
     (:puetv-vhr
      (:par
       ("90."
        (:bek "(6)")
        (:bek "(6a)")))))

    (:tanszakvez "Tanszakvezetõi megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek
         ("(3)"
          (:pont "b)"))))))
     (:puetv-vhr
      (:par
       ("90."
        (:bek "(6)")
        (:bek "(6a)")))))

    (:mkkoz-vez "Munkaközösség-vezetõi megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek
         ("(3)"
          (:pont "c)"))))))
     (:puetv-vhr
      (:par
       ("90."
        (:bek "(5)")
        (:bek "(6)")
        (:bek "(6a)")))))

    (:cimz-ig "Címzetes igazgatói megbízási díj"
     (:puetv
      (:par
       ("73."
        (:bek "(12)")))))
    
    (:cimz-foig "Címzetes fõigazgatói megbízási díj"
     (:puetv
      (:par
       ("73."
        (:bek "(12)")))))
    
    (:ig "Igazgatói megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek "(2)")))))
    
    (:foig "Fõigazgatói megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek "(2)")))))
    
    (:ig-h "Igazgató-helyettesi megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek
         ("(2)"
          (:pont "a)")))))))
    
    (:foig-h "Fõigazgató-helyettesi megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek
         ("(2)"
          (:pont "a)")))))))
    
    (:tagint-ig "Tagintézmény-igazgatói megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek "(4)")))))
    
    (:integys-vez "Intézményegység-vezetõi megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek "(4)")))))
    
    (:tagint-ig-h "Tagintézményigazgató-helyettesi megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek "(5)")))))
    
    (:integys-vez-h "Intézményegységvezetõ-helyettesi megbízási díj"
     (:puetv
      (:par
       ("102."
        (:bek "(1)")
        (:bek "(5)")))))
  
    (:pednoks-havi-ill-gyakornok "Havi illetmény - Gyakornok"
     (:puetv
      (:par
       ("96."
        (:bek "(1)")
        (:bek
         ("(2)"
          (:pont "a)")))))
      (:par
       ("98."
        (:bek "(2)"))))
     (:puetv-vhr
      (:par
       ("88."
        (:bek "(1)")))))
    
    (:havi-ill-ped1-2 "Havi illetmény - Pedagógus I. - II."
     (:puetv
      (:par
       ("96."
        (:bek "(1)")
        (:bek
         ("(2)"
          (:pont "a)")))))
      (:par
       ("98."
        (:bek "(2)"))))
     (:puetv-vhr
      (:par
       ("88/A."
        (:bek "(1)")))))
    
    (:pednoks-noks-eselyteremt-illresz "Esélyteremtési illetményrész"
     (:puetv
      (:par
       ("99."
        (:bek "(2)")))
      (:par
       ("98."
        (:bek
         ("(5)"
          (:pont "a)"))))))
     (:puetv-vhr
      (:par
       ("88."
        (:bek "(3)")
        (:bek "(4)")
        (:bek "(6)")))
      (:par
       ("131."
        (:bek "(4)")))))
    
    (:pednoks-noks-aj-thgond-prg "Arany János Tehetséggondozó Program pótléka"
     (:puetv-vhr
      (:par
       ("90."
        (:bek "(7)"))))
     (:emmi-20-2012-viii31
      (:par
       ("176."
        (:bek
         ("(8)"
          (:megj "(A jogszabályi rendelkezések a pedagógusokra vonatkoznak.)")))))))
  
    (:noks-havi-ill "Havi illetmény"
     (:puetv
      (:par
       ("96."
        (:bek
         ("(2)"
          (:pont "b)")))))
      (:par
       ("99."
        (:bek "(1)"))))
     (:puetv-vhr
      (:par
       ("88."
        (:bek "(7)")))
      (:par
       ("95."
        (:bek "(1)")))))
    ))


(defparameter *pedagogus*
  '(:havi-ill-gyakornok
    :havi-ill-ped1-kutato
    :mesterfok-illnov
    :egyes-tantrgy-illnov
    :eselyteremt-illresz-terulet
    :eselyteremt-illresz-feladat
    :gyogyped-potl
    :diabetesz-ellat
    :nemzetisegi-potl
    :aj-thgond-prg
    :ofo-megbiz
    :koll-csopvez
    :tanszakvez
    :mkkoz-vez
    :cimz-ig
    :cimz-foig
    :ig
    :foig
    :ig-h
    :foig-h
    :tagint-ig
    :integys-vez
    :tagint-ig-h
    :integys-vez-h))


(defparameter *pednoks*
  '(:pednoks-havi-ill-gyakornok
    :havi-ill-ped1-2
    :mesterfok-illnov
    :pednoks-noks-eselyteremt-illresz
    :gyogyped-potl
    :diabetesz-ellat
    :pednoks-noks-aj-thgond-prg))


(defparameter *noks*
  '(:noks-havi-ill
    :pednoks-noks-eselyteremt-illresz
    :gyogyped-potl
    :diabetesz-ellat
    :pednoks-noks-aj-thgond-prg))


(defun fee-by-key (key list)
  (let ((pos (position key list :key #'first)))
    (when pos
      (let ((result (nth pos list)))
        (values (cddr result)
                (first result)
                (second result))))))


(defun collect-fees (keys list)
  (let ((result '()))
    (dolist (key keys)
      (push (fee-by-key key list)
            result))
    (apply #'append
           (nreverse
            (remove nil result)))))


(defparameter s '(:foig :ig-h :integys-vez :tanszakvez :mkkoz-vez))
(defparameter g '(:foig :ig-h :integys-vez :tanszakvez :mkkoz-vez :nemzetisegi-potl :havi-ill-ped1-2))


(defun cat-sublists (list category)2)" ("(2)" (:PONT "a)")) "(4)" ("(3)" (:PONT "b)")) "(1)" 
  (remove-duplicates
   (apply #'append
          (mapcar
           #'rest
           (remove-if-not
            #'(lambda (element)
                (and (listp element)
                     (equalp (first element) category)))
            list)))
   :test #'equalp))


(defun categories (list) ;;;;;;;;;;;;;;;;;;; ITT RENDEZNI ÉS KÉNE ÕKET!
  (remove-duplicates
   (mapcar #'first
           (remove-if-not #'listp list))
   :test #'equalp))


(defun end-values (list)
  (remove-duplicates
   (remove-if #'listp list)
   :test #'equalp))






(defun level (list)
  (let ((categories (categories list))
        (end-values (end-values list)))
    (if categories
      (apply #'append
             (mapcar #'(lambda (category)
                         (level (cat-sublists list category)))
                     categories))
      end-values)))
  