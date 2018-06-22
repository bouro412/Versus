(in-package :cl-user)
(defpackage versus.app
  (:use :cl :lispbuilder-sdl)
  (:import-from :versus.view
   :view-update)
  (:export main))
(in-package :versus.app)


;; main function
(defun main ()
  (sdl:with-init ()
    (sdl:window 640 480 :title-caption "Versus")
    (sdl:with-events ()
      (:quit-event () t)
      (:key-down-event (:key key)
                       (if (sdl:key= key :sdl-key-escape)
                           (sdl:push-quit-event)))
      (:idle (view-update)))))
