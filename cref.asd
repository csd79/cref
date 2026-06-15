(require "automation")

(defsystem "cref"
  :description "Code ref generator"
  :author      "Denes Cselovszki <denes.cselovszki@gmail.com>"
  :version     "0.24"
  :depends-on  ("ccom4" "cl-ppcre")
 :serial      t
  :components  ((:file "package")
                (:file "fli-templates")
;                (:file "puetv-2024")
;                (:file "puetv-2025jan")
;                (:file "puetv-2025sep")
;                (:file "puetv-2026jan")
                (:file "cref")
;                (:file "script")
                ))
