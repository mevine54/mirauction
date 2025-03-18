-- Création de la table USERS
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    auc_total_participates INTEGER DEFAULT 0,
    auc_total_win INTEGER DEFAULT 0
);

-- Création de la table LOTS
CREATE TABLE lots (
    lot_id SERIAL PRIMARY KEY,
    lot_name VARCHAR(100) NOT NULL,
    lot_description TEXT,
    lot_starting_price NUMERIC(10,2) NOT NULL
);

-- Création de la table AUCTIONS
CREATE TABLE auctions (
    auc_id SERIAL PRIMARY KEY,
    auc_start_time TIMESTAMP NOT NULL,
    auc_end_time TIMESTAMP NOT NULL,
    auc_current_bid NUMERIC(10,2) DEFAULT 0,
    auc_last_bidder_id INTEGER,
    auc_final_price NUMERIC(10,2),
    auc_status VARCHAR(20) DEFAULT 'en cours',
    user_id INTEGER NOT NULL,
    lot_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (lot_id) REFERENCES lots(lot_id),
    FOREIGN KEY (auc_last_bidder_id) REFERENCES users(user_id)
);

-- Création de la table BIDS
CREATE TABLE bids (
    bid_id SERIAL PRIMARY KEY,
    bid_amount NUMERIC(10,2) NOT NULL,
    bid_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    auc_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (auc_id) REFERENCES auctions(auc_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Création de la table NOTIFICATIONS
CREATE TABLE notifications (
    not_id SERIAL PRIMARY KEY,
    not_read BOOLEAN DEFAULT FALSE,
    not_message TEXT,
    not_type VARCHAR(20),
    not_sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    auc_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (auc_id) REFERENCES auctions(auc_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);