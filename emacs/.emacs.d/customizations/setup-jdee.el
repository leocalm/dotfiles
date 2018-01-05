;;; package --- Summary

;;; Commentary:
;;; Code:

(use-package jde-mode
  :disabled t
  :mode ("\\.java\\'" . jde-mode)
  ;; :load-path
  :init
  (progn
    (add-hook 'jde-mode-hook (lambda () (c-set-style "java")))
    (autoload 'jde-mode "jde mode" t)
    (setq jde-bug-debugger-host-address "127.0.0.1")
    (setq jde-bug-jre-home "/usr/lib/jvm/java-8-openjdk/")
    (setq jde-compile-option-debug (quote ("all" (t nil nil))))
    (setq jde-debugger (quote ("jdb")))
    (setq jde-global-classpath (split-string (or (getenv "CLASSPATH") "") ":"))
    ;; (setq jde-jdk-doc-url "/usr/share/doc/openjdk-7-doc/html/api/index.html")
    (setq jde-jdk-registry (quote (("1.8.0" . "/usr/lib/jvm/java-8-openjdk/"))))
    (setq jde-jdk (quote ("1.8.0")))
    ;; (setq jde-regexp-jar-file "/usr/share/java/regexp.jar")
    (setq jde-sourcepath (quote (".")))))

;; (setq jdee-server-dir "~/jdee_server")

(require 'jdee)
;; (setq jdee-server-dir "/home/kazarian/elisp/mode/jdee-server/target")
(jdee-set-variables
 '(jdee-jdk '("1.8"))
 '(jdee-jdk-registry '(("1.8" . "/usr/lib/jvm/java-8-openjdk/")))
 '(jdee-ant-enable-find t)
 '(jdee-compiler (quote ("javac server" "")))
 '(jdee-global-classpath (list
              "/usr/lib/jvm/java-8-openjdk/jre/lib/rt.jar")))

(provide 'setup-jdee)
;;; setup-jdee.el ends here
