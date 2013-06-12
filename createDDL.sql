CREATE TABLE chatuser (ID  SERIAL NOT NULL, COLOR VARCHAR(8), LASTLOGIN TIMESTAMP, NAME VARCHAR(20), PASSWORD VARCHAR(64), PROFILE_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE privatemessage (ID  SERIAL NOT NULL, BODY VARCHAR(4000), DATE TIMESTAMP, READ BOOLEAN, RECIPIENTNAME VARCHAR(20), SENDERNAME VARCHAR(20), SUBJECT VARCHAR(40), RECIPIENT_ID BIGINT, SENDER_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE profile (ID  SERIAL NOT NULL, ABOUT VARCHAR(4000), GENDER INTEGER, AVATAR_ID BIGINT, PRIMARY KEY (ID))
CREATE TABLE image (ID  SERIAL NOT NULL, TITLE VARCHAR(40), URL VARCHAR(255), profile_id BIGINT, PRIMARY KEY (ID))
CREATE TABLE friendlist (ID  SERIAL NOT NULL, NAME VARCHAR(40), VISIBLE BOOLEAN, profile_id BIGINT, PRIMARY KEY (ID))
CREATE TABLE friendlistuser (ID  SERIAL NOT NULL, CONFIRMED BOOLEAN, USERENTITY_ID BIGINT, friendlist_id BIGINT, PRIMARY KEY (ID))
ALTER TABLE chatuser ADD CONSTRAINT FK_chatuser_PROFILE_ID FOREIGN KEY (PROFILE_ID) REFERENCES profile (ID)
ALTER TABLE privatemessage ADD CONSTRAINT FK_privatemessage_SENDER_ID FOREIGN KEY (SENDER_ID) REFERENCES chatuser (ID)
ALTER TABLE privatemessage ADD CONSTRAINT FK_privatemessage_RECIPIENT_ID FOREIGN KEY (RECIPIENT_ID) REFERENCES chatuser (ID)
ALTER TABLE profile ADD CONSTRAINT FK_profile_AVATAR_ID FOREIGN KEY (AVATAR_ID) REFERENCES image (ID)
ALTER TABLE image ADD CONSTRAINT FK_image_profile_id FOREIGN KEY (profile_id) REFERENCES profile (ID)
ALTER TABLE friendlist ADD CONSTRAINT FK_friendlist_profile_id FOREIGN KEY (profile_id) REFERENCES profile (ID)
ALTER TABLE friendlistuser ADD CONSTRAINT FK_friendlistuser_friendlist_id FOREIGN KEY (friendlist_id) REFERENCES friendlist (ID)
ALTER TABLE friendlistuser ADD CONSTRAINT FK_friendlistuser_USERENTITY_ID FOREIGN KEY (USERENTITY_ID) REFERENCES chatuser (ID)