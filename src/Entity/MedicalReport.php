<?php

namespace App\Entity;

use App\Repository\MedicalReportRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: MedicalReportRepository::class)]
class MedicalReport
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $diagnosis = null;

    #[ORM\Column(length: 255)]
    private ?string $treatment = null;

    #[ORM\Column(length: 255)]
    private ?string $notes = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDiagnosis(): ?string
    {
        return $this->diagnosis;
    }

    public function setDiagnosis(string $diagnosis): static
    {
        $this->diagnosis = $diagnosis;

        return $this;
    }

    public function getTreatment(): ?string
    {
        return $this->treatment;
    }

    public function setTreatment(string $treatment): static
    {
        $this->treatment = $treatment;

        return $this;
    }

    public function getNotes(): ?string
    {
        return $this->notes;
    }

    public function setNotes(string $notes): static
    {
        $this->notes = $notes;

        return $this;
    }
}
