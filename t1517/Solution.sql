select user_id, name, mail
from Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*\@leetcode\\.com$';