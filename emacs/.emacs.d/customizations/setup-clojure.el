;;; package --- Summary

;;; Commentary:
;;; Code:
(use-package paredit)
(use-package clojure-mode)
(use-package clojure-mode-extra-font-locking)
(use-package cider
  :config
  (set-variable 'cider-lein-parameters "repl :headless :host localhost"))

(provide 'setup-clojure)
;;; setup-clojure.el ends here
