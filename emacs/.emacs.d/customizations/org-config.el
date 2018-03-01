;;; package --- Summary

;;; Commentary:
;;; Code:

;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;;file to save todo items
;; (setq org-agenda-files (quote ("/Users/bjm/todo.org")))
'(org-agenda-files (quote ("~/org/tasks.org")))


(provide 'org-config)
;;; org-config.el ends here
