<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240807063839 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE medical_report_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE medical_report (id INT NOT NULL, diagnosis VARCHAR(255) NOT NULL, treatment VARCHAR(255) NOT NULL, notes VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('ALTER TABLE appointment ADD patient_id VARCHAR(9) NOT NULL');
        $this->addSql('ALTER TABLE appointment DROP diagnosis');
        $this->addSql('ALTER TABLE appointment DROP treatment');
        $this->addSql('ALTER TABLE appointment DROP notes');
        $this->addSql('ALTER TABLE appointment ADD CONSTRAINT FK_FE38F8446B899279 FOREIGN KEY (patient_id) REFERENCES "user" (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_FE38F8446B899279 ON appointment (patient_id)');
        $this->addSql('ALTER TABLE product ADD category_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD12469DE2 FOREIGN KEY (category_id) REFERENCES category (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_D34A04AD12469DE2 ON product (category_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP SEQUENCE medical_report_id_seq CASCADE');
        $this->addSql('DROP TABLE medical_report');
        $this->addSql('ALTER TABLE product DROP CONSTRAINT FK_D34A04AD12469DE2');
        $this->addSql('DROP INDEX IDX_D34A04AD12469DE2');
        $this->addSql('ALTER TABLE product DROP category_id');
        $this->addSql('ALTER TABLE appointment DROP CONSTRAINT FK_FE38F8446B899279');
        $this->addSql('DROP INDEX IDX_FE38F8446B899279');
        $this->addSql('ALTER TABLE appointment ADD diagnosis VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE appointment ADD treatment VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE appointment ADD notes VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE appointment DROP patient_id');
    }
}
