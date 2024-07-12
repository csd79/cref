;;; -*- Mode: Common-Lisp; Author: denes.cselovszky@gmail.com -*- 

(in-package "CL-USER")

(load "c:\\Users\\cselovszkid\\.lispworks")

(asdf:load-system "cref")

(lw:deliver 'cref:run
    "c:\\Users\\cselovszkid\\common-lisp\\cref\\cref_v0.11.exe"
    5
;    :console :io
    :multiprocessing t
    :console t
    :error-on-interpreted-functions t
    :keep-eval t
    :keep-lisp-reader t
    :symbol-names-action nil
    :startup-bitmap-file nil
    :KILL-DSPEC-TABLE NIL
    )
