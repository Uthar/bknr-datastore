;;;; -*- Mode: LISP -*-

(in-package :cl-user)

(defpackage :bknr.indices.system
  (:use :cl :asdf)
  (:export :*bknr-indices-directory*))

(in-package :bknr.indices.system)

(defparameter *bknr-indices-directory*
    (make-pathname :name nil :type nil :version nil
		   :defaults (parse-namestring *load-truename*)))

(defsystem :bknr-indices
  :name "bknr indices"
  :author "Manuel Odendahl <manuel@bl0rg.net>"
  :version "0"
  :maintainer "Manuel Odendahl <manuel@bl0rg.net>"
  :licence "BSD"
  :description "CLOS class indices"
  :long-description ""

  :depends-on (:cl-interpol :bknr-utils :bknr-skip-list)

  :components ((:module "indices"
			:components
			((:file "package")
			 (:file "protocol" :depends-on ("package"))
			 (:file "indices" :depends-on ("package" "protocol"))
			 (:file "indexed-class" :depends-on ("package" "indices"))
			 (:file "category-index" :depends-on ("package" "protocol" "indices"))))))
