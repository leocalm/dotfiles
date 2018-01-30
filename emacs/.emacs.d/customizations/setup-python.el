;;; package --- Summary

;;; Commentary:
;;; Code:
(use-package elpy
  :config
  (elpy-enable)
  (elpy-use-ipython))

(use-package pyenv-mode
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto)

(provide 'setup-python)
;;; setup-python.el ends here
