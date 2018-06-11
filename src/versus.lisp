(in-package :cl-user)
(defpackage versus
  (:use :cl :lispbuilder-sdl))
(in-package :versus)


;; main function
(defun main ()
  (sdl:with-init ()
    (sdl:window 640 480 :title-caption "Versus")
    (sdl:with-events ()
      (:quit-event () t)
      (:key-down-event (:key key)
                       (if (sdl:key= key :sdl-key-escape)
                           (sdl:push-quit-event)))
      (:idle ))))
