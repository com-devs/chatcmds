-- Create a new table if it doesn't exist to store items
CREATE TABLE IF NOT EXISTS `items` (
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert the Darkweb item into the items table
INSERT INTO `items` (`name`, `label`) VALUES
    ('darkweb_item', 'Darkweb Device');
