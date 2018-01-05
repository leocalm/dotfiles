;;; package --- Summary

;;; Commentary:
;;; Code:
(use-package jdee
  :config
  (add-to-list 'load-path "/home/leonardo/.emacs.d/elpa/jdee-20171007.835")
  (autoload 'jde-mode "jde" "JDE mode" t)
  (setq auto-mode-alist
        (append '(("\\.java\\'" . jde-mode)) auto-mode-alist)))

(provide 'setup-java)
;;; setup-java.el ends here
