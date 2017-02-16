;; Customizations for python development

(elpy-enable)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(elpy-use-ipython)
(setq python-shell-interpreter "ipython"
  python-shell-interpreter-args "--simple-prompt -i")
