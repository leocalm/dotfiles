;;; package --- Summary

;;; Commentary:
;;; Code:

;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;;file to save todo items
(setq org-agenda-files (quote ("~/org/tasks.org" "~/org/personal.org")))

;; Recording close time
(setq org-log-done 'time)

(provide 'org-config)
;;; org-config.el ends here
