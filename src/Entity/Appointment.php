<?php

namespace App\Entity;

use App\Repository\AppointmentRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AppointmentRepository::class)]
class Appointment
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $date = null;

    #[ORM\Column(type: Types::TIME_MUTABLE)]
    private ?\DateTimeInterface $time = null;

    // #[ORM\Column(length: 255, nullable: true)]
    // private ?string $diagnosis = null;

    // #[ORM\Column(length: 255, nullable: true)]
    // private ?string $treatment = null;

    // #[ORM\Column(length: 255, nullable: true)]
    // private ?string $notes = null;

    #[ORM\Column]
    private ?int $duration = null;

    #[ORM\ManyToOne(inversedBy: 'appointments')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $patient = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): static
    {
        $this->date = $date;

        return $this;
    }

    public function getTime(): ?\DateTimeInterface
    {
        return $this->time;
    }

    public function setTime(\DateTimeInterface $time): static
    {
        $this->time = $time;

        return $this;
    }

    // public function getDiagnosis(): ?string
    // {
    //     return $this->diagnosis;
    // }

    // public function setDiagnosis(?string $diagnosis): static
    // {
    //     $this->diagnosis = $diagnosis;

    //     return $this;
    // }

    // public function getTreatment(): ?string
    // {
    //     return $this->treatment;
    // }

    // public function setTreatment(?string $treatment): static
    // {
    //     $this->treatment = $treatment;

    //     return $this;
    // }

    // public function getNotes(): ?string
    // {
    //     return $this->notes;
    // }

    // public function setNotes(?string $notes): static
    // {
    //     $this->notes = $notes;

    //     return $this;
    // }

    public function getDuration(): ?int
    {
        return $this->duration;
    }

    public function setDuration(int $duration): static
    {
        $this->duration = $duration;

        return $this;
    }

    public function getPatient(): ?User
    {
        return $this->patient;
    }

    public function setPatient(?User $patient): static
    {
        $this->patient = $patient;

        return $this;
    }
}
