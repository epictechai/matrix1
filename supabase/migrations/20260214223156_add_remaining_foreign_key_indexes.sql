/*
  # Add Remaining Foreign Key Indexes

  ## Overview
  Adds indexes for the remaining unindexed foreign keys to improve query performance,
  particularly for JOIN operations and CASCADE deletes.

  ## Changes

  ### Foreign Key Indexes Added
  1. `generated_posters.user_id` - Critical for filtering posters by user
  2. `post_comments.post_id` - Critical for loading comments for a post

  ## Notes
  - Foreign key indexes are essential even if not immediately "used" by queries
  - They significantly improve DELETE CASCADE performance
  - They optimize JOIN operations between related tables
  - The previously created foreign key indexes (marked as "unused") should be retained
    as they will be utilized as the application scales
*/

-- Add index for generated_posters.user_id foreign key
CREATE INDEX IF NOT EXISTS idx_generated_posters_user_id_fk 
  ON generated_posters(user_id);

-- Add index for post_comments.post_id foreign key
CREATE INDEX IF NOT EXISTS idx_post_comments_post_id_fk 
  ON post_comments(post_id);