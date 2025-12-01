-- 修复 user_mailboxes 表缺失 is_pinned 字段的问题
ALTER TABLE user_mailboxes ADD COLUMN is_pinned INTEGER NOT NULL DEFAULT 0;

-- 补充相关索引以优化性能
CREATE INDEX IF NOT EXISTS idx_user_mailboxes_user_pinned ON user_mailboxes(user_id, is_pinned DESC);
CREATE INDEX IF NOT EXISTS idx_user_mailboxes_composite ON user_mailboxes(user_id, mailbox_id, is_pinned);
