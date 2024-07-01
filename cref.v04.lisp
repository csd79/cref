(defparameter *illetmeny*
  '(
    (:havi-ill-gyakornok "Havi illetmény - Gyakornok"
     (:tv "1puetv" :par 98 :bek 2)
     (:tv "2puetv-vhr" :par 88 :bek 1))

    (:havi-ill-ped1-kutato "Havi illetmény - Pedagógus I. - Kutatótanár"
     (:tv "1puetv" :par 98 :bek 2)
     (:tv "2puetv-vhr" :par 88 :spar "A" :bek 1))

    (:mesterfok-illnov "Mesterfokozatért járó illetménynövekedés"
     (:tv "2puetv-vhr" :par 95 :spar "A." :bek 1))

    (:egyes-tantrgy-illnov "Egyes tantárgyak után járó illetménynövekedés"
     (:tv "1puetv" :par 95 :spar "A" :bek 2)
     (:tv "1puetv" :par 95 :spar "A" :bek 4))

    (:eselyteremt-illresz-terulet "Területi alapon járó esélyteremtési illetményrész"
     (:tv "1puetv" :par 98 :bek 5 :pont "a")
     (:tv "2puetv-vhr" :par 88 :bek 3)
     (:tv "2puetv-vhr" :par 88 :bek 4)
     (:tv "2puetv-vhr" :par 88 :bek 6)
     (:tv "2puetv-vhr" :par 131 :bek 4))

    (:eselyteremt-illresz-feladat "Feladatalapon járó esélyteremtési illetményrész"
     (:tv "1puetv" :par 98 :bek 5 :pont "b")
     (:tv "2puetv-vhr" :par 88 :bek 4)
     (:tv "2puetv-vhr" :par 88 :bek 5)
     (:tv "2puetv-vhr" :par 88 :bek 6)
     (:tv "2puetv-vhr" :par 131 :bek 4))

    (:gyogyped-potl "Gyógypedagógiai pótlék"
     (:tv "1puetv" :par 103 :bek 1)
     (:tv "1puetv" :mell 3 :pont "B")
     (:tv "2puetv-vhr" :par 90 :bek 3)
     (:tv "2puetv-vhr" :par 90 :bek 4 :sbek "a"))

    (:diabetesz-ellat "Diabétesz ellátási pótlék"
     (:tv "1puetv" :par 103 :bek 1)
     (:tv "1puetv" :mell 3 :pont "B")
     (:tv "2puetv-vhr"  :par 90 :bek 4)
     (:tv "3koznev-2011-cxc" :par 62 :bek 1 :sbek "b"))

    (:nemzetisegi-potl "Nemzetiségi pótlék"
     (:tv "1puetv" :par 103 :bek 1)
     (:tv "1puetv" :mell 3 :pont "B")
     (:tv "2puetv-vhr" :par 90 :bek 2)
     (:tv "2puetv-vhr" :par 90 :bek 4 :sbek "a"))

    (:aj-thgond-prg "Arany János Tehetséggondozó Program pótléka"
     (:tv "2puetv-vhr" :par 90 :bek 7)
     (:tv "3emmi-20-2012-viii31" :par 176 :bek 8))

    (:ofo-megbiz "Osztályfõnöki megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 3 :pont "b")
     (:tv "2puetv-vhr" :par 90  :bek 6)
     (:tv "2puetv-vhr" :par 90  :bek 6 :sbek "a"))

    (:koll-csopvez "Kollégiumi csoportvezetõi megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 3 :pont "b")
     (:tv "2puetv-vhr" :par 90 :bek 6)
     (:tv "2puetv-vhr" :par 90 :bek 6 :sbek "a"))

    (:tanszakvez "Tanszakvezetõi megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 3 :pont "b")
     (:tv "2puetv-vhr" :par 90 :bek 6)
     (:tv "2puetv-vhr" :par 90 :bek 6 :sbek "a"))

    (:mkkoz-vez "Munkaközösség-vezetõi megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 3 :pont "c")
     (:tv "2puetv-vhr" :par 90 :bek 5)
     (:tv "2puetv-vhr" :par 90 :bek 6)
     (:tv "2puetv-vhr" :par 90 :bek 6 :sbek "a"))

    (:cimz-ig "Címzetes igazgatói megbízási díj"
     (:tv "1puetv" :par 73 :bek 12))
    
    (:cimz-foig "Címzetes fõigazgatói megbízási díj"
     (:tv "1puetv" :par 73 :bek 12))
    
    (:ig "Igazgatói megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 2))
    
    (:foig "Fõigazgatói megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 2))
    
    (:ig-h "Igazgató-helyettesi megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 2 :pont "a"))
    
    (:foig-h "Fõigazgató-helyettesi megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 2 :pont "a"))
    
    (:tagint-ig "Tagintézmény-igazgatói megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 4))
    
    (:integys-vez "Intézményegység-vezetõi megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 4))
    
    (:tagint-ig-h "Tagintézményigazgató-helyettesi megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 5))
    
    (:integys-vez-h "Intézményegységvezetõ-helyettesi megbízási díj"
     (:tv "1puetv" :par 102 :bek 1)
     (:tv "1puetv" :par 102 :bek 5))
  
    (:pednoks-havi-ill-gyakornok "Havi illetmény - Gyakornok"
     (:tv "1puetv" :par 96 :bek 1)
     (:tv "1puetv" :par 96 :bek 2 :pont "a")
     (:tv "1puetv" :par 98 :bek 2)
     (:tv "2puetv-vhr" :par 88 :bek 1))
    
    (:havi-ill-ped1-2 "Havi illetmény - Pedagógus I. - II."
     (:tv "1puetv" :par 96 :bek 1)
     (:tv "1puetv" :par 96 :bek 2 :pont "a")
     (:tv "1puetv" :par 98 :bek 2)
     (:tv "2puetv-vhr" :par 88 :spar "A" :bek 1))
    
    (:pednoks-noks-eselyteremt-illresz "Esélyteremtési illetményrész"
     (:tv "1puetv" :par 99 :bek 2)
     (:tv "1puetv" :par 98 :bek 5 :pont "a")
     (:tv "2puetv-vhr" :par 88 :bek 3)
     (:tv "2puetv-vhr" :par 88 :bek 4)
     (:tv "2puetv-vhr" :par 88 :bek 6)
     (:tv "2puetv-vhr" :par 131 :bek 4))
    
    (:pednoks-noks-aj-thgond-prg "Arany János Tehetséggondozó Program pótléka"
     (:tv "2puetv-vhr" :par 90 :bek 7)
     (:tv "3emmi-20-2012-viii31" :par 176 :bek 8 :megj "(A jogszabályi rendelkezések a pedagógusokra vonatkoznak.)"))
  
    (:noks-havi-ill "Havi illetmény"
     (:tv "1puetv" :par 96 :bek 2 :pont "b")
     (:tv "1puestv" :par 99 :bek 1)
     (:tv "2puetv-vhr" :par 88 :bek 7)
     (:tv "2puetv-vhr" :par 95 :bek 1))
    ))


;;; ---------------------------------------------------------------


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


;;; ---------------------------------------------------------------


(defun plist1-covers-plist2 (plist1 plist2)
  (loop for (key val) on plist1 by #'cddr
        always (equalp (getf plist2 key) val)))


(defun plist-equalp (plist1 plist2)
  (and (plist1-covers-plist2 plist1 plist2)
       (plist1-covers-plist2 plist2 plist1)))


(defun remove-duplicate-plists (list)
  (remove-duplicates list :test #'plist-equalp))


;;; ---------------------------------------------------------------


(defparameter *rec-comp*
  `(:tv   (,#'string-equal ,#'string-lessp nil)
    :par  (,#'= ,#'< nil)
    :spar (,#'string-equal ,#'string-lessp t)
    :bek  (,#'= ,#'< nil)
    :sbek (,#'string-equal ,#'string-lessp t)
    :mell (,#'= ,#'< t)
    :pont (,#'string-equal ,#'string-lessp t)))


(defun <-records (rec1 rec2 &optional (opts *rec-comp*))
  (and opts
       (destructuring-bind (key (same-fn less-fn orientation) &rest rest)
           opts
         (declare (ignore rest))
         (let ((v1 (getf rec1 key))
               (v2 (getf rec2 key)))
           (cond ((not (or v1 v2))        (<-records rec1 rec2 (cddr opts)))
                 ((null v1)               orientation)
                 ((null v2)               (not orientation))
                 ((funcall same-fn v1 v2) (<-records rec1 rec2 (cddr opts)))
                 (t                       (funcall less-fn v1 v2)))))))


(defun sort-records (list)
  (sort list #'<-records))


;;; ---------------------------------------------------------------


(defun key-order ()
  (loop for (key value) on *rec-comp* by #'cddr collecting
        key))


(defun remove-branches (plist key)
  (let* ((keys (key-order))
         (start (position key keys))
         (drops (subseq keys start))
         (copy (copy-list plist)))
    (dolist (key drops)
      (remf copy key))
    (format t "~a  ~a~%" plist copy)
    copy))


(defun point-covered-p (plist list key)
  (when (find key plist)
    (let ((pruned (remove-branches plist key)))
      (find pruned list :test #'plist-equalp))))


(defun remove-covered-sub (list key)
  (remove-if #'(lambda (element)
                 (point-covered-p element list key))
             list))


(defun remove-covered-subs (list &optional (keys '(:pont)))
  (if (null keys)
    list
    (remove-covered-subs
     (remove-covered-sub list (first keys))
     (rest keys))))


;;; ---------------------------------------------------------------


(defun generate-refs (keys)
  (sort-records
   (remove-covered-subs
    (remove-duplicate-plists
     (collect-fees keys *illetmeny*))
    '(:spar :sbek :pont))))


;;; ---------------------------------------------------------------






(defparameter s '(:foig :ig-h :integys-vez :tanszakvez :mkkoz-vez))
(defparameter g '(:foig :ig-h :integys-vez :tanszakvez :mkkoz-vez :nemzetisegi-potl :havi-ill-ped1-2))

