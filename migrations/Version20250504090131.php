<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250504090131 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            CREATE TABLE appointment (id INT AUTO_INCREMENT NOT NULL, patient_id VARCHAR(9) NOT NULL, therapist_id VARCHAR(9) NOT NULL, specialization_id INT NOT NULL, date DATE NOT NULL, time TIME NOT NULL, duration INT NOT NULL, status VARCHAR(255) NOT NULL, INDEX IDX_FE38F8446B899279 (patient_id), INDEX IDX_FE38F84443E8B094 (therapist_id), INDEX IDX_FE38F844FA846217 (specialization_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE category (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, description VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE invoice (id INT AUTO_INCREMENT NOT NULL, customer_id VARCHAR(9) NOT NULL, issue_date DATE NOT NULL, status VARCHAR(255) NOT NULL, INDEX IDX_906517449395C3F3 (customer_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE invoice_product (invoice_id INT NOT NULL, product_id INT NOT NULL, INDEX IDX_2193327E2989F1FD (invoice_id), INDEX IDX_2193327E4584665A (product_id), PRIMARY KEY(invoice_id, product_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE medical_report (id INT AUTO_INCREMENT NOT NULL, patient_id VARCHAR(9) NOT NULL, therapist_id VARCHAR(9) NOT NULL, diagnosis VARCHAR(255) NOT NULL, treatment VARCHAR(255) NOT NULL, notes VARCHAR(255) NOT NULL, INDEX IDX_AF71C02B6B899279 (patient_id), INDEX IDX_AF71C02B43E8B094 (therapist_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE product (id INT AUTO_INCREMENT NOT NULL, category_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, description VARCHAR(255) NOT NULL, price INT NOT NULL, INDEX IDX_D34A04AD12469DE2 (category_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE reset_password_request (id INT AUTO_INCREMENT NOT NULL, user_id VARCHAR(9) NOT NULL, selector VARCHAR(20) NOT NULL, hashed_token VARCHAR(100) NOT NULL, requested_at DATETIME NOT NULL COMMENT '(DC2Type:datetime_immutable)', expires_at DATETIME NOT NULL COMMENT '(DC2Type:datetime_immutable)', INDEX IDX_7CE748AA76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE specialization (id INT AUTO_INCREMENT NOT NULL, description VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE `user` (id VARCHAR(9) NOT NULL, name VARCHAR(255) DEFAULT NULL, surname VARCHAR(255) DEFAULT NULL, birth_date DATE DEFAULT NULL, address VARCHAR(255) DEFAULT NULL, city VARCHAR(255) DEFAULT NULL, province VARCHAR(255) DEFAULT NULL, zip INT DEFAULT NULL, email VARCHAR(255) NOT NULL, roles JSON NOT NULL COMMENT '(DC2Type:json)', password VARCHAR(255) NOT NULL, genre VARCHAR(255) NOT NULL, phone INT DEFAULT NULL, is_verified TINYINT(1) NOT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE user_specialization (user_id VARCHAR(9) NOT NULL, specialization_id INT NOT NULL, INDEX IDX_F55C2D33A76ED395 (user_id), INDEX IDX_F55C2D33FA846217 (specialization_id), PRIMARY KEY(user_id, specialization_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE appointment ADD CONSTRAINT FK_FE38F8446B899279 FOREIGN KEY (patient_id) REFERENCES `user` (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE appointment ADD CONSTRAINT FK_FE38F84443E8B094 FOREIGN KEY (therapist_id) REFERENCES `user` (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE appointment ADD CONSTRAINT FK_FE38F844FA846217 FOREIGN KEY (specialization_id) REFERENCES specialization (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE invoice ADD CONSTRAINT FK_906517449395C3F3 FOREIGN KEY (customer_id) REFERENCES `user` (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE invoice_product ADD CONSTRAINT FK_2193327E2989F1FD FOREIGN KEY (invoice_id) REFERENCES invoice (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE invoice_product ADD CONSTRAINT FK_2193327E4584665A FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE medical_report ADD CONSTRAINT FK_AF71C02B6B899279 FOREIGN KEY (patient_id) REFERENCES `user` (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE medical_report ADD CONSTRAINT FK_AF71C02B43E8B094 FOREIGN KEY (therapist_id) REFERENCES `user` (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE product ADD CONSTRAINT FK_D34A04AD12469DE2 FOREIGN KEY (category_id) REFERENCES category (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE reset_password_request ADD CONSTRAINT FK_7CE748AA76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user_specialization ADD CONSTRAINT FK_F55C2D33A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user_specialization ADD CONSTRAINT FK_F55C2D33FA846217 FOREIGN KEY (specialization_id) REFERENCES specialization (id) ON DELETE CASCADE
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE appointment DROP FOREIGN KEY FK_FE38F8446B899279
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE appointment DROP FOREIGN KEY FK_FE38F84443E8B094
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE appointment DROP FOREIGN KEY FK_FE38F844FA846217
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE invoice DROP FOREIGN KEY FK_906517449395C3F3
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE invoice_product DROP FOREIGN KEY FK_2193327E2989F1FD
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE invoice_product DROP FOREIGN KEY FK_2193327E4584665A
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE medical_report DROP FOREIGN KEY FK_AF71C02B6B899279
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE medical_report DROP FOREIGN KEY FK_AF71C02B43E8B094
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD12469DE2
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE reset_password_request DROP FOREIGN KEY FK_7CE748AA76ED395
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user_specialization DROP FOREIGN KEY FK_F55C2D33A76ED395
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE user_specialization DROP FOREIGN KEY FK_F55C2D33FA846217
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE appointment
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE category
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE invoice
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE invoice_product
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE medical_report
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE product
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE reset_password_request
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE specialization
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE `user`
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE user_specialization
        SQL);
    }
}
