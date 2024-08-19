<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240819124857 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE user_specialization (user_id VARCHAR(9) NOT NULL, specialization_id INT NOT NULL, PRIMARY KEY(user_id, specialization_id))');
        $this->addSql('CREATE INDEX IDX_F55C2D33A76ED395 ON user_specialization (user_id)');
        $this->addSql('CREATE INDEX IDX_F55C2D33FA846217 ON user_specialization (specialization_id)');
        $this->addSql('ALTER TABLE user_specialization ADD CONSTRAINT FK_F55C2D33A76ED395 FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE user_specialization ADD CONSTRAINT FK_F55C2D33FA846217 FOREIGN KEY (specialization_id) REFERENCES specialization (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE appointment ADD specialization_id INT NOT NULL');
        $this->addSql('ALTER TABLE appointment ADD CONSTRAINT FK_FE38F844FA846217 FOREIGN KEY (specialization_id) REFERENCES specialization (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_FE38F844FA846217 ON appointment (specialization_id)');
        $this->addSql('ALTER TABLE invoice ADD customer_id VARCHAR(9) NOT NULL');
        $this->addSql('ALTER TABLE invoice ADD CONSTRAINT FK_906517449395C3F3 FOREIGN KEY (customer_id) REFERENCES "user" (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_906517449395C3F3 ON invoice (customer_id)');
        $this->addSql('ALTER TABLE medical_report ADD patient_id VARCHAR(9) NOT NULL');
        $this->addSql('ALTER TABLE medical_report ADD therapist_id VARCHAR(9) NOT NULL');
        $this->addSql('ALTER TABLE medical_report ADD CONSTRAINT FK_AF71C02B6B899279 FOREIGN KEY (patient_id) REFERENCES "user" (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE medical_report ADD CONSTRAINT FK_AF71C02B43E8B094 FOREIGN KEY (therapist_id) REFERENCES "user" (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_AF71C02B6B899279 ON medical_report (patient_id)');
        $this->addSql('CREATE INDEX IDX_AF71C02B43E8B094 ON medical_report (therapist_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE user_specialization DROP CONSTRAINT FK_F55C2D33A76ED395');
        $this->addSql('ALTER TABLE user_specialization DROP CONSTRAINT FK_F55C2D33FA846217');
        $this->addSql('DROP TABLE user_specialization');
        $this->addSql('ALTER TABLE medical_report DROP CONSTRAINT FK_AF71C02B6B899279');
        $this->addSql('ALTER TABLE medical_report DROP CONSTRAINT FK_AF71C02B43E8B094');
        $this->addSql('DROP INDEX IDX_AF71C02B6B899279');
        $this->addSql('DROP INDEX IDX_AF71C02B43E8B094');
        $this->addSql('ALTER TABLE medical_report DROP patient_id');
        $this->addSql('ALTER TABLE medical_report DROP therapist_id');
        $this->addSql('ALTER TABLE invoice DROP CONSTRAINT FK_906517449395C3F3');
        $this->addSql('DROP INDEX IDX_906517449395C3F3');
        $this->addSql('ALTER TABLE invoice DROP customer_id');
        $this->addSql('ALTER TABLE appointment DROP CONSTRAINT FK_FE38F844FA846217');
        $this->addSql('DROP INDEX IDX_FE38F844FA846217');
        $this->addSql('ALTER TABLE appointment DROP specialization_id');
    }
}
