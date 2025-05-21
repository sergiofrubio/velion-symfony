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

    #[ORM\ManyToOne(inversedBy: 'medicalReports')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Patient $patient = null;

    #[ORM\ManyToOne(inversedBy: 'medicalReports')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Therapist $therapist = null;

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

    public function getPatient(): ?Patient
    {
        return $this->patient;
    }

    public function setPatient(?Patient $patient): static
    {
        $this->patient = $patient;

        return $this;
    }

    public function gettherapist(): ?Therapist
    {
        return $this->therapist;
    }

    public function settherapist(?Therapist $therapist): static
    {
        $this->therapist = $therapist;

        return $this;
    }
}
