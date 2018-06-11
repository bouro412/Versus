(in-package :cl-user)
(defpackage versus-test
  (:use :cl
        :versus
        :prove))
(in-package :versus-test)

;; NOTE: To run this test file, execute `(asdf:test-system :versus)' in your Lisp.

(plan nil)

;; blah blah blah.

(finalize)
